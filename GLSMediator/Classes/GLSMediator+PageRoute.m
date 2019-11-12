//
//  GLSMediator+PageRoute.m
//  GLSMediator
//
//  Created by gls on 2019/11/12.
//

#import "GLSMediator+PageRoute.h"

NSString * const kGLSMediatorLoginTarget = @"Login";
NSString * const kGLSMediatorPayPlatformTarget = @"PayPlatform";

NSString * const kGLSMediatorPassengerLogin = @"passengerLogin";
NSString * const kGLSMediatorDriverLogin = @"driverLogin";
NSString * const kGLSMediatorInitPayInfo = @"initPay";
NSString * const kGLSMediatorHandleUrl = @"handleOpenURL";

@implementation GLSMediator (PageRoute)

/*
 * 调用乘客端端登录
 */
- (void) presentPassengerLoginFrom:(UIViewController *)vc{
    [self performTarget:kGLSMediatorLoginTarget action:kGLSMediatorPassengerLogin params:@{@"target":vc} shouldCacheTarget:NO];
}

/*
 * 调用司机端登录
 */
- (void) presentDriverLoginFrom:(UIViewController *)vc{
     [self performTarget:kGLSMediatorLoginTarget action:kGLSMediatorDriverLogin params:@{@"target":vc} shouldCacheTarget:NO];
}

/*
 * 跳转地址选择
 */
- (void) pushSelectViewControllerWithInfo:(NSDictionary *)info viewController:(UIViewController *)vc{
    NSString *className = info[@"target"];
    Class targetClass = NSClassFromString(className);
    id target = [[targetClass alloc]init];
    [vc.navigationController pushViewController:target animated:YES];
}

/*
 * 跳转收银台
 */
- (void) pushCashierDeskFrom:(UIViewController *)vc
                      params:(NSDictionary *)param
                    UserType:(PaymentUserType)userType{

    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:param];
    [params setValue:@(userType) forKey:@"userType"];
    [self performTarget:kGLSMediatorPayPlatformTarget action:kGLSMediatorInitPayInfo params:params shouldCacheTarget:YES];
}

/**
 * 回调处理
 */
- (void)handleOpenURL:(NSURL *)url{
    [self performTarget:kGLSMediatorPayPlatformTarget action:kGLSMediatorHandleUrl params:@{@"url":url} shouldCacheTarget:YES];
}

@end
