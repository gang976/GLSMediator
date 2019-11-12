//
//  GLSMediator.m
//  GLSMediator
//
//  Created by gls on 2019/11/12.
//

#import "GLSMediator.h"
#import <objc/runtime.h>
#import <objc/message.h>

typedef NS_ENUM(NSUInteger, GLSMediatorReturnType) {
    GLSMediatorReturnTypeVoid,
    GLSMediatorReturnTypeBasic,
    GLSMediatorReturnTypeObjc,
};

@interface GLSMediator ()
@property (nonatomic, strong) NSMutableDictionary *cachedTarget;

@end

static GLSMediator *_mediator = nil;

@implementation GLSMediator

#pragma mark - public methods
+ (instancetype)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _mediator = [[GLSMediator alloc] init];
    });
    return _mediator;
}

/*
 scheme://[target]/[action]?[params]
 
 url sample:
 aaa://targetA/actionB?id=1234
 */

- (id)performActionWithUrl:(NSURL *)url
                completion:(void (^)(NSDictionary *))completion {
    
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    NSString *urlString = [url query];
    for (NSString *param in [urlString componentsSeparatedByString:@"&"]) {
        NSArray *elts = [param componentsSeparatedByString:@"="];
        if([elts count] < 2) continue;
        [params setObject:[elts lastObject] forKey:[elts firstObject]];
    }
    
    // 这里这么写主要是出于安全考虑，防止黑客通过远程方式调用本地模块。这里的做法足以应对绝大多数场景，如果要求更加严苛，也可以做更加复杂的安全逻辑。
    NSString *actionName = [url.path stringByReplacingOccurrencesOfString:@"/" withString:@""];
    if ([actionName hasPrefix:@"native"]) { return @(NO); }
    
    // 这个demo针对URL的路由处理非常简单，就只是取对应的target名字和method名字，但这已经足以应对绝大部份需求。如果需要拓展，可以在这个方法调用之前加入完整的路由逻辑
    id result = [self performTarget:url.host action:actionName params:params shouldCacheTarget:NO];
    if (completion) {
        if (result) { completion(@{@"result":result}); }
        else { completion(nil); }
    }
    return result;
}

- (id)performTarget:(NSString *)targetName
             action:(NSString *)actionName
  shouldCacheTarget:(BOOL)shouldCacheTarget {
    
    return [self performTarget:targetName action:actionName params:nil shouldCacheTarget:shouldCacheTarget];
}

/**
 * 本地组件对象方法调用入口
 * 含参传递
 */
- (id)performTarget:(NSString *)targetName
             action:(NSString *)actionName
             params:(NSDictionary * _Nullable)params
  shouldCacheTarget:(BOOL)shouldCacheTarget {
    
    NSString *targetClassString = [NSString stringWithFormat:@"Target_%@", targetName];
    NSString *actionString = [NSString stringWithFormat:@"Action_%@", actionName];
    if (params && ![actionString hasSuffix:@":"]) {
        actionString = [actionString stringByAppendingString:@":"];
    }
    
    NSObject *target = self.cachedTarget[targetClassString];
    if (target == nil) {
        Class targetClass = NSClassFromString(targetClassString);
        target = [[targetClass alloc] init];
    }
    
    SEL action = NSSelectorFromString(actionString);
    
    if (target == nil) {
        // 这里是处理无响应请求的地方之一，这个demo做得比较简单，如果没有可以响应的target，就直接return了。实际开发过程中是可以事先给一个固定的target专门用于在这个时候顶上，然后处理这种请求的
        return nil;
    }
    
    if (shouldCacheTarget) {
        self.cachedTarget[targetClassString] = target;
    }
    
    if ([target respondsToSelector:action]) {
        return [self safePerformAction:action target:target params:params];
    } else {
        // 有可能target是Swift对象
        actionString = [NSString stringWithFormat:@"Action_%@WithParams", actionName];
        action = NSSelectorFromString(actionString);
        if ([target respondsToSelector:action]) {
            return [self safePerformAction:action target:target params:params];
        } else {
            // 这里是处理无响应请求的地方，如果无响应，则尝试调用对应target的notFound方法统一处理
            SEL action = NSSelectorFromString(@"notFound:");
            if ([target respondsToSelector:action]) {
                return [self safePerformAction:action target:target params:params];
            } else {
                // 这里也是处理无响应请求的地方，在notFound都没有的时候，这个demo是直接return了。实际开发过程中，可以用前面提到的固定的target顶上的。
                [self.cachedTarget removeObjectForKey:targetClassString];
                return nil;
            }
        }
    }
}

/**
 * 本地组件Target/Action调用入口
 * className
 * actionName
 * moduleName 'Use for swift module.'
 * params
 * shouldCacheTarget
 */

- (id)performTarget:(NSString *)targetName
             action:(NSString *)actionName
             module:(NSString * _Nullable)moduleName
             params:(NSDictionary * _Nullable)params
  shouldCacheTarget:(BOOL)shouldCacheTarget {

    NSString *targetClassString;
    if (moduleName == nil) {
        targetClassString = [NSString stringWithFormat:@"Target_%@", targetName];
    } else {
        targetClassString = [NSString stringWithFormat:@"%@.Target_%@", moduleName, targetName];
    }
    Class targetClass = NSClassFromString(targetClassString);
    // 根据 targetClassString 从 cachedTarget （缓存的Target）获取 target
    NSObject * target = self.cachedTarget[targetClassString];
    if (target == nil) {
        // 未获取到 则生成一个target
        target = [[targetClass alloc] init];
    }

    // 可能初始化失败
    if (target == nil) { return nil; }
    
    // 是否需要对 Target 进行缓存
    if (shouldCacheTarget) {
        // 将 Target 进行缓存
        self.cachedTarget[targetClassString] = target;
    }

    actionName = [NSString stringWithFormat:@"Action_%@", actionName];
    if (params && ![actionName hasSuffix:@":"]) {
        actionName = [actionName stringByAppendingString:@":"];
    }

    SEL action = NSSelectorFromString(actionName);
    
    // 判断 Target 是否有 action 相应，避免crash
    if ([target respondsToSelector:action]) {
        // 这里是处理有响应请求的地方
        return [self safePerformAction:action target:target params:params];
    } else {
        // 这里是处理无响应请求的地方，如果无响应，则尝试调用对应target的notFound方法统一处理
        SEL action = NSSelectorFromString(@"notFound:");
        if ([targetClass respondsToSelector:action]) {
            return [self safePerformAction:action target:targetClass params:params];
        } else {
            // 这里也是处理无响应请求的地方，在notFound都没有的时候，这个demo是直接return了。实际开发过程中，可以用前面提到的固定的target顶上的。
            [self.cachedTarget removeObjectForKey:targetClassString];
            return nil;
        }
    }
    return nil;
}

/**
 * 本地组件类方法调用入口
 * 含参传递
 */
- (id)performClass:(NSString *)className
            action:(NSString *)actionName
            params:(NSDictionary * _Nullable)params {
    
    Class targetClass = NSClassFromString(className);
    
    if (params && ![actionName hasSuffix:@":"]) {
        actionName = [actionName stringByAppendingString:@":"];
    }
    
    SEL action = NSSelectorFromString(actionName);
    
    if ([targetClass respondsToSelector:action]) {
        return [self safePerformAction:action target:targetClass params:params];
    } else {
        NSLog(@"未找到类方法%@",actionName);
    }
    return nil;
}

- (void)releaseCachedTargetWithTargetName:(NSString *)targetName {
    
    NSString *targetClassString = [NSString stringWithFormat:@"Target_%@", targetName];
    [self.cachedTarget removeObjectForKey:targetClassString];
}

#pragma mark - private methods

- (id)safePerformAction:(SEL)action
                 target:(id)target
                 params:(NSDictionary * _Nullable)params {
    // NSMethodSignature 该类为对方法的参数、返回类型进行封装
    NSMethodSignature* methodSig = [target methodSignatureForSelector:action];
    if(methodSig == nil) { return nil; }
    
    GLSMediatorReturnType returnType = [self fetchReturnTypeWithMethodSign:methodSig];
    
    switch (returnType) {
        case GLSMediatorReturnTypeVoid: {
            // 用来包装方法和对应的对象，它可以存储方法的名称，对应的对象，对应的参数
            NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:methodSig];
            if (params) { [invocation setArgument:&params atIndex:2]; }
            [invocation setSelector:action];
            [invocation setTarget:target];
            // 执行NSInvocation对象中指定对象的指定方法，并且传递指定的参数
            [invocation invoke];
            
            return nil;
        }
            break;
        case GLSMediatorReturnTypeBasic: {
            // 返回值如果是基础数据类型 则转为NSNumber类型 所以在接收时 要注意
            NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:methodSig];
            NSInteger length =  invocation.methodSignature.numberOfArguments - 1;
            if (params) { [invocation setArgument:&params atIndex:length]; }
            [invocation setSelector:action];
            [invocation setTarget:target];
            [invocation invoke];
            NSInteger result = 0;
            // 将返回数据拷贝到提供的缓存区（retLoc）内
            [invocation getReturnValue:&result];
        
            return @(result);
        }
            break;
        case GLSMediatorReturnTypeObjc: {
            
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
            // 利用RunTime 向target对象传递消息，执行 target 中 action 的方法，传递参数 params
            return [target performSelector:action withObject:params];
#pragma clang diagnostic pop
        }
            break;
            
        default:
            break;
    }
}

/** 根据方法签名 得到该方法的返回值类型*/
- (GLSMediatorReturnType)fetchReturnTypeWithMethodSign:(NSMethodSignature *)methodSign {
    
    const char* retType = [methodSign methodReturnType];
    
    if (strcmp(retType, @encode(void)) == 0) {
        
        return GLSMediatorReturnTypeVoid;
        
    }  else if ((strcmp(retType, @encode(NSInteger)) == 0)
                || (strcmp(retType, @encode(BOOL)) == 0)
                || (strcmp(retType, @encode(CGFloat)) == 0)
                || (strcmp(retType, @encode(NSUInteger)) == 0)) {
        
        return GLSMediatorReturnTypeBasic;
    } else {
        
        return GLSMediatorReturnTypeObjc;
    }
}

#pragma mark - getters and setters
- (NSMutableDictionary *)cachedTarget
{
    if (_cachedTarget == nil) {
        _cachedTarget = [[NSMutableDictionary alloc] init];
    }
    return _cachedTarget;
}


@end
