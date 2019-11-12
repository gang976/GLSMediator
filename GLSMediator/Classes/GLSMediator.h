//
//  GLSMediator.h
//  GLSMediator
//
//  Created by gls on 2019/11/12.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

#define Mediator [GLSMediator sharedInstance]

@interface GLSMediator : NSObject

+ (instancetype)sharedInstance;

/** 远程App调用入口 */
- (id)performActionWithUrl:(NSURL *)url
                completion:(void(^)(NSDictionary *info))completion;

/**
 * 本地组件调用入口
 * 无参传递
 */
- (id)performTarget:(NSString *)targetName
             action:(NSString *)actionName
  shouldCacheTarget:(BOOL)shouldCacheTarget;

/**
 * 本地组件调用入口
 * 含参传递
 */
- (id)performTarget:(NSString *)targetName
             action:(NSString *)actionName
             params:(NSDictionary * _Nullable)params
  shouldCacheTarget:(BOOL)shouldCacheTarget;

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
  shouldCacheTarget:(BOOL)shouldCacheTarget;

/**
 * 本地组件类方法调用入口
 * 含参传递
 */
- (id)performClass:(NSString *)className
            action:(NSString *)actionName
            params:(NSDictionary * _Nullable)params;

/** 从缓存中释放 */
- (void)releaseCachedTargetWithTargetName:(NSString *)targetName;

@end

NS_ASSUME_NONNULL_END
