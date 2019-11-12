//
//  GLSMediator+GLSNetworkActions.m
//  GLSMediator
//
//  Created by gls on 2019/11/12.
//

#import "GLSMediator+GLSNetworkActions.h"

NSString *const kGLSMediatorTargetNetworkHelper = @"GLSNetworkHelper";

NSString *const kGLSMediatorActionSaveConfiguration = @"saveConfiguration";

NSString *const kGLSMediatorActionNetworkState = @"fetchNetworkState";
NSString *const kGLSMediatorActionStartNetworkMonitor = @"startNetworkMonitor";
NSString *const kGLSMediatorActionStopNetworkMonitor = @"stopNetworkMonitor";
NSString *const kGLSMediatorActionNetworkStateOb = @"networkStateOb";
NSString *const kGLSMediatorActionUserTokenLoseBlock = @"userTokenLoseBlock";

NSString *const kGLSMediatorActionCancelNetwork = @"cancelNetwork";

NSString *const kGLSMediatorActionRequestDataSource = @"requestDataSource";
NSString *const kGLSMediatorActionUploadDataSource = @"uploadDataSource";

@implementation GLSMediator (GLSNetworkActions)

#pragma mark - Config
- (void)initNetworkConfigWithManageClass:(Class _Nonnull)classObj
                             fetchUrlSel:(SEL _Nonnull)urlSel
                           fetchParamSel:(SEL _Nonnull)paraSel {
    
    NSDictionary *params = @{@"config_class":NSStringFromClass(classObj),
                             @"config_urlSel": NSStringFromSelector(urlSel),
                             @"config_paraSel": NSStringFromSelector(paraSel)};
    
    [self performTarget:kGLSMediatorTargetNetworkHelper
                 action:kGLSMediatorActionSaveConfiguration
                 params:params
      shouldCacheTarget:NO];
}

#pragma mark - Request

- (void)request:(NSString *)api
        success:(void (^)(NSInteger, NSString * _Nonnull, id _Nullable))success
        failure:(void (^ _Nullable)(NSInteger, NSString * _Nonnull))failure {
    
    [self request:GLSHTTPMethodPost api:api para:nil invokeObj:GLSInvokeObjProtogenesis willStart:nil success:success failure:failure];
}

- (void)request:(NSString *)api
           para:(NSDictionary *)para
        success:(void (^)(NSInteger, NSString * _Nonnull, id _Nullable))success {
    
    [self request:GLSHTTPMethodPost api:api para:para invokeObj:GLSInvokeObjProtogenesis willStart:nil success:success failure:nil];
}

- (void)request:(NSString *)api
      willStart:(void (^)(void))willStart
        success:(void (^)(NSInteger, NSString * _Nonnull, id _Nullable))success
        failure:(void (^)(NSInteger, NSString * _Nonnull))failure {
    
    [self request:GLSHTTPMethodPost api:api para:nil invokeObj:GLSInvokeObjProtogenesis willStart:willStart success:success failure:failure];
}

- (void)request:(NSString *)api
           para:(NSDictionary *)para
        success:(void (^)(NSInteger, NSString * _Nonnull, id _Nullable))success
        failure:(void (^)(NSInteger, NSString * _Nonnull))failure {
    
    [self request:GLSHTTPMethodPost api:api para:para invokeObj:GLSInvokeObjProtogenesis willStart:nil success:success failure:failure];
}

- (void)rn_request:(NSString *)api
           para:(NSDictionary *)para
        success:(void (^)(NSInteger, NSString * _Nonnull, id _Nullable))success
        failure:(void (^)(NSInteger, NSString * _Nonnull))failure {
    
    [self request:GLSHTTPMethodPost api:api para:para invokeObj:GLSInvokeObjReactNative willStart:nil success:success failure:failure];
}

- (void)request:(NSString *)api
           para:(NSDictionary *)para
      willStart:(void (^)(void))willStart
        success:(void (^)(NSInteger, NSString * _Nonnull, id _Nullable))success
        failure:(void (^)(NSInteger, NSString * _Nonnull))failure {
    
    [self request:GLSHTTPMethodPost api:api para:para invokeObj:GLSInvokeObjProtogenesis willStart:willStart success:success failure:failure];
}

- (void)request:(GLSHTTPMethod)method
            api:(NSString *)api
           para:(NSDictionary *)para
      invokeObj:(GLSInvokeObj)invokeObj
      willStart:(void (^)(void))willStart
        success:(void (^)(NSInteger, NSString * _Nonnull, id _Nullable))success
        failure:(void (^)(NSInteger, NSString * _Nonnull))failure {
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    if (method == GLSHTTPMethodPost) { [params setValue:@"POST" forKey:@"request_method"]; }
    else if (method == GLSHTTPMethodGet) { [params setValue:@"GET" forKey:@"request_method"]; }
    
    if (api) {
        [params setValue:api forKey:@"request_api"];
    } else {
        [params setValue:@"" forKey:@"request_api"];
    }
    
    if (para) {
        [params setValue:para forKey:@"request_para"];
    } else {
        [params setValue:@{} forKey:@"request_para"];
    }
    
    NSNumber *invokeObjNum = [NSNumber numberWithInteger:invokeObj];
    [params setValue:invokeObjNum forKey:@"request_invokeObj"];
    
    if (willStart) { [params setValue:willStart forKey:@"request_willStart"]; }
    
    if (success) { [params setValue:success forKey:@"request_success"]; }
    
    if (failure) { [params setValue:failure forKey:@"request_failure"]; }
    
    [self performTarget:kGLSMediatorTargetNetworkHelper
                 action:kGLSMediatorActionRequestDataSource
                 params:params
      shouldCacheTarget:YES];
}

#pragma mark - Upload
- (void)upload:(NSString *)api
          data:(NSData *)data
       success:(void (^)(id _Nonnull))success {
    
    [self upload:api data:data progress:nil success:success failure:nil];
}

- (void)upload:(NSString *)api
          data:(NSData *)data
      progress:(void (^)(CGFloat))progress
       success:(void (^)(id _Nonnull))success {
    
    [self upload:api data:data progress:progress success:success failure:nil];
}


- (void)upload:(NSString *)api
          data:(NSData *)data
      progress:(void (^)(CGFloat))progress
       success:(void (^)(id _Nonnull))success
       failure:(void (^)(NSInteger, NSString * _Nonnull))failure {
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    [params setValue:api forKey:@"upload_api"];
    [params setValue:data forKey:@"upload_data"];
    
    if (progress) { [params setValue:progress forKey:@"upload_progress"]; }
    
    if (success) { [params setValue:success forKey:@"upload_success"]; }
    
    if (failure) { [params setValue:failure forKey:@"upload_failure"]; }
    
    [self performTarget:kGLSMediatorTargetNetworkHelper
                 action:kGLSMediatorActionUploadDataSource
                 params:params
      shouldCacheTarget:YES];
}

#pragma mark - Cancel
/// 取消当前所有网路请求
- (void)cancelAllRequest {
    
    NSDictionary *params = @{@"cancel_type" : @(0)};
    
    [self performTarget:kGLSMediatorTargetNetworkHelper
                 action:kGLSMediatorActionCancelNetwork
                 params:params
      shouldCacheTarget:YES];
}
/// 取消当前所有request
- (void)cancelCurrentRequest {
    
    NSDictionary *params = @{@"cancel_type" : @(1)};
    
    [self performTarget:kGLSMediatorTargetNetworkHelper
                 action:kGLSMediatorActionCancelNetwork
                 params:params
      shouldCacheTarget:YES];
}
/// 取消当前所有upload
- (void)cancelCurrentUpload {
    
    NSDictionary *params = @{@"cancel_type" : @(2)};
    
    [self performTarget:kGLSMediatorTargetNetworkHelper
                 action:kGLSMediatorActionCancelNetwork
                 params:params
      shouldCacheTarget:YES];
}


#pragma mark - NetworkState
- (BOOL)networkState {
    
    // BOOL为转为Number类型返回
    NSNumber *state = [self performTarget:kGLSMediatorTargetNetworkHelper
                                    action:kGLSMediatorActionNetworkState
                                    params:nil
                         shouldCacheTarget:YES];
    
    return [state boolValue];
}

- (void)startNetworkMonitor {
    
    [self performTarget:kGLSMediatorTargetNetworkHelper
                 action:kGLSMediatorActionStartNetworkMonitor
                 params:nil
      shouldCacheTarget:YES];
}

- (void)stopNetworkMonitor {
    
    [self performTarget:kGLSMediatorTargetNetworkHelper
                 action:kGLSMediatorActionStopNetworkMonitor
                 params:nil
      shouldCacheTarget:YES];
}

- (void)networkStateOb:(void (^)(BOOL))ob {
    
    [self performTarget:kGLSMediatorTargetNetworkHelper action:kGLSMediatorActionNetworkStateOb params:@{@"state_ob":ob} shouldCacheTarget:YES];
}

- (void)userTokenLoseBlock:(void (^)(void))block {
    
    [self performTarget:kGLSMediatorTargetNetworkHelper action:kGLSMediatorActionUserTokenLoseBlock params:@{@"token_loseEfficacy":block} shouldCacheTarget:YES];
}

@end
