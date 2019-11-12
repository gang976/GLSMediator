//
//  GLSMediator+CustomerService.m
//  GLSMediator
//
//  Created by gls on 2019/11/12.
//

#import "GLSMediator+CustomerService.h"
#import "GLSMediator+GLSGlobalInfoHelperActions.h"
#import "GLSMediator+CommonTool.h"

NSString *const kGLSMediatorTargetCustomerService = @"CustomerService";
NSString *const kGLSMediatorActionRegisterQY = @"registerQY";
NSString *const kGLSMediatorActionConnectService = @"connectService";

@implementation GLSMediator (CustomerService)

- (void)GLSMediator_registerQY:(NSString *)appId appName:(NSString *)appName {

    NSDictionary *parm = @{
                           @"appId": appId,
                           @"appName": appName
                           };
    [self performTarget:kGLSMediatorTargetCustomerService
                 action:kGLSMediatorActionRegisterQY
                 params:parm
      shouldCacheTarget:NO];
}

- (void)GLSMediator_connectService:(UIViewController *)viewController backImage:(UIImage *)backImage {

    //头像、控制器对象、背景颜色、标题颜色、userID、data
    UIColor *backColor = [Mediator colorWithHexString:@"#212741"];
    UIColor *textColor = [UIColor whiteColor];
    NSString *userId = [Mediator userInfo_driverId];
    NSString *headUrl = [Mediator userInfo_headUrl] ?: @" ";

    NSDictionary *nameDict = @{
                               @"key" : @"real_name",
                               @"value" : [Mediator userInfo_name],
                               };

    NSDictionary *phoneDict = @{
                                @"key" : @"mobile_phone",
                                @"value" : [Mediator userInfo_userPhone],
                                @"hidden" : @(NO),
                                };
    NSDictionary *avatarDict = @{
                                 @"key": @"avatar",
                                 @"value": headUrl
                                 };

    NSArray *array = @[nameDict, phoneDict, avatarDict];
    NSData *data = [NSJSONSerialization dataWithJSONObject:array options:0 error:nil];

    NSDictionary *parm = @{
                           @"backImage": backImage,
                           @"backColor": backColor,
                           @"textColor": textColor,
                           @"userId": userId,
                           @"headUrl": headUrl,
                           @"data": data,
                           @"viewController": viewController
                           };

    [self performTarget:kGLSMediatorTargetCustomerService
                 action:kGLSMediatorActionConnectService
                 params:parm
      shouldCacheTarget:NO];
}

@end
