//
//  GLSMediator+GLSNetworkActions.h
//  GLSMediator
//
//  Created by gls on 2019/11/12.
//

#import "GLSMediator.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, GLSHTTPMethod) {
    GLSHTTPMethodPost,
    GLSHTTPMethodGet
};

typedef NS_ENUM(NSUInteger, GLSInvokeObj) {
    GLSInvokeObjProtogenesis,
    GLSInvokeObjReactNative,
};

@interface GLSMediator (GLSNetworkActions)

#pragma mark - Config
- (void)initNetworkConfigWithManageClass:(Class _Nonnull)classObj fetchUrlSel:(SEL _Nonnull)urlSel fetchParamSel:(SEL _Nonnull)paraSel;

#pragma mark - Request

/// api success failure
- (void)request:(NSString *)api
        success:(void (^)(NSInteger, NSString *msg, id _Nullable dataSource))success
        failure:(void (^ _Nullable)(NSInteger code, NSString *msg))failure;

/// api para success
- (void)request:(NSString *)api
           para:(NSDictionary * _Nullable)para
        success:(void (^)(NSInteger, NSString *msg, id _Nullable dataSource))success;

/// api willStart success failure
- (void)request:(NSString *)api
      willStart:(void(^ _Nullable)(void))willStart
        success:(void(^)(NSInteger code, NSString *msg, id _Nullable dataSource))success
        failure:(void(^ _Nullable)(NSInteger code, NSString *msg))failure;

/// api para success failure
- (void)request:(NSString *)api
           para:(NSDictionary * _Nullable)para
        success:(void (^)(NSInteger code, NSString *msg, id _Nullable dataSource))success
        failure:(void (^ _Nullable)(NSInteger code, NSString *msg))failure;

/// RN api para success failure
- (void)rn_request:(NSString *)api
              para:(NSDictionary * _Nullable)para
           success:(void (^)(NSInteger code, NSString *msg, id _Nullable dataSource))success
           failure:(void (^ _Nullable)(NSInteger code, NSString *msg))failure;

/// api para willStart success failurem
- (void)request:(NSString *)api
           para:(NSDictionary * _Nullable)para
      willStart:(void(^ _Nullable)(void))willStart
        success:(void(^)(NSInteger code, NSString *msg, id _Nullable dataSource))success
        failure:(void(^ _Nullable)(NSInteger code, NSString *msg))failure;


#pragma mark - Upload

/// api data sucess
- (void)upload:(NSString *)api
          data:(NSData *)data
       success:(void(^)(id data))success;

/// api data progress success
- (void)upload:(NSString *)api
          data:(NSData *)data
      progress:(void(^ _Nullable)(CGFloat progress))progress
       success:(void(^)(id data))success;

/// api data progress success failure
- (void)upload:(NSString *)api
          data:(NSData *)data
      progress:(void(^ _Nullable)(CGFloat progress))progress
       success:(void(^)(id data))success
       failure:(void(^ _Nullable)(NSInteger code, NSString *msg))failure;

#pragma mark - Cancel
/// 取消当前所有request
- (void)cancelCurrentRequest;
/// 取消当前所有upload
- (void)cancelCurrentUpload;
/// 取消当前所有网路请求
- (void)cancelAllRequest;

#pragma mark - NetworkState

@property (nonatomic, assign, readonly) BOOL networkState;

- (void)startNetworkMonitor;

- (void)stopNetworkMonitor;

- (void)networkStateOb:(void(^)(BOOL state))ob;

- (void)userTokenLoseBlock:(void(^)(void))block;

@end

NS_ASSUME_NONNULL_END
