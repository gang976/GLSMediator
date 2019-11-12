//
//  GLSMediator+PageRoute.h
//  GLSMediator
//
//  Created by gls on 2019/11/12.
//

#import "GLSMediator.h"

typedef NS_ENUM(NSUInteger,PaymentSourceType){
    PaymentSourceTypeRecharge = 1,   //充值支付
    PaymentSourceTypeGiftPay = 2,   //礼品卡支付
    PaymentSourceTypeNormalPay = 3, //普通支付
    PaymentSourceTypeBaogan = 4,    //包干支付
    PaymentSourceTypeExpPay = 5,    //快车支付
    PaymentSourceTypeSpecialPay = 6,//专车支付
    PaymentSourceTypeBusCarPay = 7, //村村通支付
    PaymentSourceTypeScanPay = 8,   //扫码支付
    PaymentSourceTypeExpLargePay = 9,//快车大额支付
    PaymentSourceTypeSpecialLargePay = 10//专车大额支付
};

typedef NS_ENUM(NSUInteger,PaymentUserType){
    PaymentUserType_Driver,
    PaymentUserType_Passenger
};

NS_ASSUME_NONNULL_BEGIN

@interface GLSMediator (PageRoute)

/*
 * 调用乘客端端登录
 */
- (void) presentPassengerLoginFrom:(UIViewController *)vc;

/*
 * 调用司机端登录
 */
- (void) presentDriverLoginFrom:(UIViewController *)vc;

/*
 * 跳转地址选择
 */
- (void) pushSelectViewControllerWithInfo:(NSDictionary *)info viewController:(UIViewController *)vc;

/*
 * 跳转收银台
 * userType    : 用户类型 司机端/乘客端
 */
- (void) pushCashierDeskFrom:(UIViewController *)vc
                      params:(NSDictionary *)param
                    UserType:(PaymentUserType)userType;

/**
 * 回调处理
 */
- (void)handleOpenURL:(NSURL *)url;
@end

NS_ASSUME_NONNULL_END
