//
//  GLSMediator+CommonTool.m
//  GLSMediator
//
//  Created by gls on 2019/11/12.
//

#import "GLSMediator+CommonTool.h"
#import "GLSMediatorHelper.h"

NSString *const kGLSMediatorTargetCommonTool = @"CommonTool";
NSString *const kGLSMediatorActionCreateDeviceUUID = @"createDeviceUUID";
NSString *const kGLSMediatorActionSaveDeviceUUID = @"saveDeviceUUID";
NSString *const kGLSMediatorActionReadDeviceUUID= @"readDeviceUUID";
NSString *const kGLSMediatorActionDeleteDeviceUUID = @"deleteDeviceUUID";
NSString *const kGLSMediatorActionGetDeviceIMSI = @"getDeviceIMSI";
NSString *const kGLSMediatorActionColorWithHexString = @"colorWithHexString";

NSString *const kGLSMediatorTargetLogin = @"Login";
NSString *const kGLSMediatorActionFetchCommontParam = @"fetchCommontWebParam";
@implementation GLSMediator (CommonTool)

- (NSString *)createDeviceUUID {

    return [self performTarget:kGLSMediatorTargetCommonTool
                        action:kGLSMediatorActionCreateDeviceUUID
                        params:nil
             shouldCacheTarget:NO];
}

- (void)saveDeviceUUID {

    [self performTarget:kGLSMediatorTargetCommonTool
                 action:kGLSMediatorActionSaveDeviceUUID
                 params:nil
      shouldCacheTarget:NO];
}

- (NSString *)readDeviceUUID {

    return [self performTarget:kGLSMediatorTargetCommonTool
                 action:kGLSMediatorActionReadDeviceUUID
                 params:nil
      shouldCacheTarget:NO];
}

- (void)deleteDeviceUUID {

    [self performTarget:kGLSMediatorTargetCommonTool
                 action:kGLSMediatorActionDeleteDeviceUUID
                 params:nil
      shouldCacheTarget:NO];
}

- (NSString *)getDeviceIMSI {

    return [self performTarget:kGLSMediatorTargetCommonTool
                        action:kGLSMediatorActionGetDeviceIMSI
                        params:nil
             shouldCacheTarget:NO];
}

- (UIColor *)colorWithHexString:(NSString *)hexString {

    NSDictionary *params = @{
                             @"hexString": hexString
                             };
    return [self performTarget:kGLSMediatorTargetCommonTool
                        action:kGLSMediatorActionColorWithHexString
                        params:params
             shouldCacheTarget:NO];
}

//获取 登录组件 web公参
- (NSDictionary *)fetchWebCommonParameters {
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *versionString = infoDictionary[@"CFBundleShortVersionString"];
    NSString *softVersion = versionString;
    NSString *sysVersion = [UIDevice currentDevice].systemVersion;
    NSString *platform = @"2";
    NSString *channel = [Mediator configInfo_channelId];
    NSString *deviceId = [UIDevice currentDevice].identifierForVendor.UUIDString;
    NSString *token = [Mediator userInfo_token];
    NSString *serviveUrl = [Mediator configInfo_sslUrl] ?: @"";
    NSString *accountCategory = [NSString stringWithFormat:@"%ld",(long)[Mediator userInfo_accountCategory]];
    NSString *timestamp = [NSString stringWithFormat:@"%f",[[NSDate date] timeIntervalSince1970]];

    return @{@"role": @"2",
             @"softVersion": softVersion,
             @"sysVersion": sysVersion,
             @"platform": platform,
             @"channel": channel,
             @"deviceId": deviceId,
             @"token": token,
             @"serviveUrl": serviveUrl,
             @"accountCategory": accountCategory,
             @"timestamp": timestamp};
}

@end
