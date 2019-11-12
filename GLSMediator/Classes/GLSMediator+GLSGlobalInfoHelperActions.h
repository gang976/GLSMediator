//
//  GLSMediator+GLSGlobalInfoHelperActions.h
//  GLSMediator
//
//  Created by gls on 2019/11/12.
//

#import "GLSMediator.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, DriverState) {
    
    DriverStateFree = 0,//司机空闲
    DriverStateStartPicking,//开始去接乘客 预约单新增状态
    DriverStateReceiveOrder,//司机接单
    DriverStateArrive,//到达预约地点
    DriverStateStartCharge,//开始计费
    DriverStateStopCharge,//结束计费
    DriverStateConfirmCharge//确认计费
};

typedef NS_ENUM(NSUInteger, PassengerState) {
    PassengerStateFree = 0,//没有做任何操作
    PassengerStateAddress,//地址填写完
    PassengerStateWaitReply,//等待应答
    PassengerStateReserveSuccess,//预约单预约成功
    PassengerStateDriverOrders,//司机接单
    PassengerStateArrive,//司机已到达
    PassengerStateInService,//司机服务中
    PassengerStateServiceFinish,//送达乘客
    PassengerStateWaitPay,//乘客待支付
    PassengerStateSuccessPay,//支付成功
    PassengerStateInvite,     //邀请接单
    PassengerStateInviteSuccess //发送邀请成功
};

typedef NS_ENUM(NSUInteger, SelectCarType) {
    SelectCarTypeExpress, //快车
    SelectCarTypeTaxi,    //出租车
    SelectCarTypeSpecial, //专车
    SelectCarTypePool,    //拼车
    SelectCarTypeCarLift, //车生活
    SelectCarTypeDriverService //代驾
};


@interface GLSMediator (GLSGlobalInfoHelperActions)

#pragma mark - User

/*---------------------------------------
*   乘客 车主 通用
*--------------------------------------*/

- (void)userInfo_clearInfo;

- (void)userInfo_loginState:(BOOL)state;
- (BOOL)userInfo_loginState;

- (void)userInfo_accountStatus:(NSInteger)status;
- (NSInteger)userInfo_accountStatus;

- (void)userInfo_headUrl:(NSString *)url;
- (NSString *)userInfo_headUrl;

- (void)userInfo_contactPhone:(NSString *)phone;
- (NSString *)userInfo_contactPhone;

- (void)userInfo_token:(NSString *)token;
- (NSString *)userInfo_token;

- (void)userInfo_name:(NSString *)name;
- (NSString *)userInfo_name;

- (void)userInfo_userPhone:(NSString *)phone;
- (NSString *)userInfo_userPhone;


/*---------------------------------------
 *   车主端
 *--------------------------------------*/

- (void)userInfo_initDriverUserInfo:(NSDictionary *)info;
- (NSDictionary *)userInfo_fetchDriverUserInfo;

/**
 -1,请完善资料 0,待提交审核 1,资料审核中 2,资料审核不通过 3,账号被禁用
 4,账号被删除 5,登录成功 6,账号被锁定 7,账号被锁定接单
 */
- (void)userInfo_accountCategory:(NSInteger)category;
- (NSInteger)userInfo_accountCategory;

- (void)userInfo_driverState:(DriverState)state;
- (DriverState)userInfo_driverState;

- (void)userInfo_bindCars:(NSInteger)cars;
- (NSInteger)userInfo_bindCars;

- (void)userInfo_driverId:(NSString *)id;
- (NSString *)userInfo_driverId;

- (void)userInfo_serviceType:(NSInteger)serviceType;
- (NSInteger)userInfo_serviceType;

- (void)userInfo_accountStatusMsg:(NSString *)msg;
- (NSString *)userInfo_accountStatusMsg;

- (void)userInfo_carNum:(NSString *)name;
- (NSString *)userInfo_carNum;

/**
 资料审核状态 -1:待完善资料 0:待提交审核 10:审核中 20:审核不通过
 25:审核通过 30:正在申请修改资料 40:申请修改资料审核不通过
 */
- (void)userInfo_auditStatus:(NSInteger)status;
- (NSInteger)userInfo_auditStatus;

- (void)userInfo_auditRemark:(NSString *)remark;
- (NSString *)userInfo_auditRemark;

- (void)userInfo_auditReaseon:(NSString *)reaseon;
- (NSString *)userInfo_auditReaseon;

/*---------------------------------------
 *   乘客端
 *--------------------------------------*/

- (void)userInfo_initPassengerUserInfo:(NSDictionary *)info;
- (NSDictionary *)userInfo_fetchPassengerUserInfo;

- (void)userInfo_userId:(NSString *)id;
- (NSString *)userInfo_userId;

- (void)userInfo_addressState:(BOOL)state;
- (BOOL)userInfo_addressState;

- (void)userInfo_passengerState:(PassengerState)state;
- (PassengerState)userInfo_passengerState;

- (void)userInfo_selectCarType:(SelectCarType)type;
- (SelectCarType)userInfo_selectCarType;

- (void)userInfo_bindEnterprise:(BOOL)enterprise;
- (BOOL)userInfo_bindEnterprise;

#pragma mark - Config
- (void)configInfo_initConfigInfo:(NSDictionary *)info;
- (NSDictionary *)configInfo_fetchConfigInfo;

- (void)configInfo_domainName:(NSString *)address;
- (NSString *)configInfo_domainName;

- (void)configInfo_htmlIp:(NSString *)ip;
- (NSString *)configInfo_htmlIp;

- (void)configInfo_sslUrl:(NSString *)url;
- (NSString *)configInfo_sslUrl;

- (void)configInfo_mqttIp:(NSString *)ip;
- (NSString *)configInfo_mqttIp;

- (void)configInfo_mqttPort:(NSString *)port;
- (NSString *)configInfo_mqttPort;

- (void)configInfo_mqttSslPort:(NSString *)port;
- (NSString *)configInfo_mqttSslPort;

- (void)configInfo_mqttClientId:(NSString *)id;
- (NSString *)configInfo_mqttClientId;

- (void)configInfo_channelId:(NSString *)id;
- (NSString *)configInfo_channelId;

- (BOOL)mqttReadyToConnect;

@end

NS_ASSUME_NONNULL_END
