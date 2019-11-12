//
//  GLSMediator+GLSGlobalInfoHelperActions.m
//  GLSMediator
//
//  Created by gls on 2019/11/12.
//

#import "GLSMediator+GLSGlobalInfoHelperActions.h"

NSString *const kGLSMediatorTargetGlobalInfoHelper = @"GLSGlobalInfoHelper";

NSString *const kGLSMediatorActionInitUserInfo = @"initUserInfo";
NSString *const kGLSMediatorActionFetchUserInfo = @"fetchUserInfo";
NSString *const kGLSMediatorActionClearUserInfo = @"clearUserInfo";
NSString *const kGLSMediatorActionSetUserInfoProperty = @"setUserInfoProperty";
NSString *const kGLSMediatorActionGetUserInfoProperty = @"getUserInfoProperty";

NSString *const kGLSMediatorActionInitConfigInfo = @"initConfigInfo";
NSString *const kGLSMediatorActionFetchConfigInfo = @"fetchConfigInfo";
NSString *const kGLSMediatorActionSetConfigInfoProperty = @"setConfigInfoProperty";
NSString *const kGLSMediatorActionGetConfigInfoProperty = @"getConfigInfoProperty";

NSString *const kGLSMediatorActionMqttReadyToConnect = @"mqttReadyToConnect";


@implementation GLSMediator (GLSGlobalInfoHelperActions)

#pragma mark - User

/*---------------------------------------
 *   乘客 车主 通用
 *--------------------------------------*/

- (void)userInfo_clearInfo {
    
    [self performTarget:kGLSMediatorTargetGlobalInfoHelper action:kGLSMediatorActionClearUserInfo shouldCacheTarget:NO];
}

- (void)userInfo_loginState:(BOOL)state {
    
    NSDictionary *params = @{@"userinfo_property_name":@"loginState",
                             @"userinfo_property_ivar":@(state)};
    
    [self performAction:kGLSMediatorActionSetUserInfoProperty params:params];
}

- (BOOL)userInfo_loginState {
    
    NSDictionary *params = @{@"userinfo_property_name":@"loginState"};
    
    NSNumber *result = [self performAction:kGLSMediatorActionGetUserInfoProperty params:params];
    
    return [result boolValue];
}

- (void)userInfo_accountStatus:(NSInteger)state {
    
    NSDictionary *params = @{@"userinfo_property_name":@"accountStatus",
                             @"userinfo_property_ivar":@(state)};
    
    [self performAction:kGLSMediatorActionSetUserInfoProperty params:params];
}

- (NSInteger)userInfo_accountStatus {
    
    NSDictionary *params = @{@"userinfo_property_name":@"accountStatus"};
    
    NSNumber *result = [self performAction:kGLSMediatorActionGetUserInfoProperty params:params];
    
    return [result integerValue];
}

- (void)userInfo_headUrl:(NSString *)url {
    
    NSDictionary *params = @{@"userinfo_property_name":@"headUrl",
                             @"userinfo_property_ivar":url};
    
    [self performAction:kGLSMediatorActionSetUserInfoProperty params:params];
}

- (NSString *)userInfo_headUrl {
    
    NSDictionary *params = @{@"userinfo_property_name":@"headUrl"};
    
    return [self performAction:kGLSMediatorActionGetUserInfoProperty params:params];
}

- (void)userInfo_contactPhone:(NSString *)phone {
    
    NSDictionary *params = @{@"userinfo_property_name":@"contactPhone",
                             @"userinfo_property_ivar":phone};
    
    [self performAction:kGLSMediatorActionSetUserInfoProperty params:params];
}

- (NSString *)userInfo_contactPhone {
    
    NSDictionary *params = @{@"userinfo_property_name":@"contactPhone"};
    
    return [self performAction:kGLSMediatorActionGetUserInfoProperty params:params];
}

- (void)userInfo_token:(NSString *)token {
    
    NSDictionary *params = @{@"userinfo_property_name":@"token",
                             @"userinfo_property_ivar":token};
    
    [self performAction:kGLSMediatorActionSetUserInfoProperty params:params];
}

- (NSString *)userInfo_token {
    
    NSDictionary *params = @{@"userinfo_property_name":@"token"};
    
    return [self performAction:kGLSMediatorActionGetUserInfoProperty params:params];
}

- (void)userInfo_name:(NSString *)name {
    
    NSDictionary *params = @{@"userinfo_property_name":@"name",
                             @"userinfo_property_ivar":name};
    
    [self performAction:kGLSMediatorActionSetUserInfoProperty params:params];
}

- (NSString *)userInfo_name {
    
    NSDictionary *params = @{@"userinfo_property_name":@"name"};
    
    return [self performAction:kGLSMediatorActionGetUserInfoProperty params:params];
}

- (void)userInfo_userPhone:(NSString *)phone {
    
    NSDictionary *params = @{@"userinfo_property_name":@"userPhone",
                             @"userinfo_property_ivar":phone};
    
    [self performAction:kGLSMediatorActionSetUserInfoProperty params:params];
}

- (NSString *)userInfo_userPhone {
    
    NSDictionary *params = @{@"userinfo_property_name":@"userPhone"};
    
    return [self performAction:kGLSMediatorActionGetUserInfoProperty params:params];
}

/*---------------------------------------
 *   车主端
 *--------------------------------------*/

- (void)userInfo_initDriverUserInfo:(NSDictionary *)info {
    
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:info];
    
    [params setValue:@(YES) forKey:@"ProIsDriver"];
    
    [self performAction:kGLSMediatorActionInitUserInfo params:params];
}
- (NSDictionary *)userInfo_fetchDriverUserInfo {
    
    NSDictionary *params = @{@"ProIsDriver": @(YES)};
    
    return [self performAction:kGLSMediatorActionFetchUserInfo params:params];
}

- (void)userInfo_driverState:(DriverState)state {
    
    NSDictionary *params = @{@"userinfo_property_name":@"driverState",
                             @"userinfo_property_ivar":@(state)};
    
    [self performAction:kGLSMediatorActionSetUserInfoProperty params:params];
}

- (DriverState)userInfo_driverState {
    
    NSDictionary *params = @{@"userinfo_property_name":@"driverState"};
    
    NSNumber *result = [self performAction:kGLSMediatorActionGetUserInfoProperty params:params];
    
    return [result integerValue];
}

- (void)userInfo_accountCategory:(NSInteger)category {
    
    NSDictionary *params = @{@"userinfo_property_name":@"accountCategory",
                             @"userinfo_property_ivar":@(category)};
    
    [self performAction:kGLSMediatorActionSetUserInfoProperty params:params];
}

- (NSInteger)userInfo_accountCategory {
    
    NSDictionary *params = @{@"userinfo_property_name":@"accountCategory"};
    
    NSNumber *result = [self performAction:kGLSMediatorActionGetUserInfoProperty params:params];
    
    return [result integerValue];
}

- (void)userInfo_bindCars:(NSInteger)cars {
    
    NSDictionary *params = @{@"userinfo_property_name":@"bindCars",
                             @"userinfo_property_ivar":@(cars)};
    
    [self performAction:kGLSMediatorActionSetUserInfoProperty params:params];
}

- (NSInteger)userInfo_bindCars {
    
    NSDictionary *params = @{@"userinfo_property_name":@"bindCars"};
    
    NSNumber *result = [self performAction:kGLSMediatorActionGetUserInfoProperty params:params];
    
    return [result integerValue];
}

- (void)userInfo_driverId:(NSString *)id {
    
    NSDictionary *params = @{@"userinfo_property_name":@"driverId",
                             @"userinfo_property_ivar":id};
    
    [self performAction:kGLSMediatorActionSetUserInfoProperty params:params];
}

- (NSString *)userInfo_driverId {
    
    NSDictionary *params = @{@"userinfo_property_name":@"driverId"};
    
    return [self performAction:kGLSMediatorActionGetUserInfoProperty params:params];
}

- (void)userInfo_serviceType:(NSInteger)serviceType {
    
    NSDictionary *params = @{@"userinfo_property_name":@"serviceType",
                             @"userinfo_property_ivar":@(serviceType)};
    
    [self performAction:kGLSMediatorActionSetUserInfoProperty params:params];
}

- (NSInteger)userInfo_serviceType {
    
    NSDictionary *params = @{@"userinfo_property_name":@"serviceType"};
    
    NSNumber *result = [self performAction:kGLSMediatorActionGetUserInfoProperty params:params];
    
    return [result integerValue];
}

- (void)userInfo_accountStatusMsg:(NSString *)msg {
    
    NSDictionary *params = @{@"userinfo_property_name":@"accountStatusMsg",
                             @"userinfo_property_ivar":msg};
    
    [self performAction:kGLSMediatorActionSetUserInfoProperty params:params];
}

- (NSString *)userInfo_accountStatusMsg {
    
    NSDictionary *params = @{@"userinfo_property_name":@"accountStatusMsg"};
    
    return [self performAction:kGLSMediatorActionGetUserInfoProperty params:params];
}

- (void)userInfo_carNum:(NSString *)name {
    
    NSDictionary *params = @{@"userinfo_property_name":@"carNum",
                             @"userinfo_property_ivar":name};
    
    [self performAction:kGLSMediatorActionSetUserInfoProperty params:params];
}

- (NSString *)userInfo_carNum {
    
    NSDictionary *params = @{@"userinfo_property_name":@"carNum"};
    
    return [self performAction:kGLSMediatorActionGetUserInfoProperty params:params];
}

- (void)userInfo_auditStatus:(NSInteger)status {
    
    NSDictionary *params = @{@"userinfo_property_name":@"auditStatus",
                             @"userinfo_property_ivar":@(status)};
    
    [self performAction:kGLSMediatorActionSetUserInfoProperty params:params];
}

- (NSInteger)userInfo_auditStatus {
    
    NSDictionary *params = @{@"userinfo_property_name":@"auditStatus"};
    
    NSNumber *result = [self performAction:kGLSMediatorActionGetUserInfoProperty params:params];
    
    return [result integerValue];
}

- (void)userInfo_auditRemark:(NSString *)remark {
    
    NSDictionary *params = @{@"userinfo_property_name":@"auditRemark",
                             @"userinfo_property_ivar":remark};
    
    [self performAction:kGLSMediatorActionSetUserInfoProperty params:params];
}

- (NSString *)userInfo_auditRemark {
    
    NSDictionary *params = @{@"userinfo_property_name":@"auditRemark"};
    
    return [self performAction:kGLSMediatorActionGetUserInfoProperty params:params];
}

- (void)userInfo_auditReaseon:(NSString *)reaseon {
    
    NSDictionary *params = @{@"userinfo_property_name":@"auditReaseon",
                             @"userinfo_property_ivar":reaseon};
    
    [self performAction:kGLSMediatorActionSetUserInfoProperty params:params];
}

- (NSString *)userInfo_auditReaseon {
    
    NSDictionary *params = @{@"userinfo_property_name":@"auditReaseon"};
    
    return [self performAction:kGLSMediatorActionGetUserInfoProperty params:params];
}

/*---------------------------------------
 *   乘客端
 *--------------------------------------*/
- (void)userInfo_initPassengerUserInfo:(NSDictionary *)info {
    
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:info];
    
    [params setValue:@(NO) forKey:@"ProIsDriver"];
    
    [self performAction:kGLSMediatorActionInitUserInfo params:params];
}

- (NSDictionary *)userInfo_fetchPassengerUserInfo {
    
    NSDictionary *params = @{@"ProIsDriver": @(NO)};
    
    return [self performAction:kGLSMediatorActionFetchUserInfo params:params];
}

- (void)userInfo_userId:(NSString *)id {
    
    NSDictionary *params = @{@"userinfo_property_name":@"userId",
                             @"userinfo_property_ivar":id};
    
    [self performAction:kGLSMediatorActionSetUserInfoProperty params:params];
}

- (NSString *)userInfo_userId {
    
    NSDictionary *params = @{@"userinfo_property_name":@"userId"};
    
    return [self performAction:kGLSMediatorActionGetUserInfoProperty params:params];
}

- (void)userInfo_addressState:(BOOL)state {
    
    NSDictionary *params = @{@"userinfo_property_name":@"addressState",
                             @"userinfo_property_ivar":@(state)};
    
    [self performAction:kGLSMediatorActionSetUserInfoProperty params:params];
    
}

- (BOOL)userInfo_addressState {
    
    NSDictionary *params = @{@"userinfo_property_name":@"addressState"};
    
    NSNumber *result =  [self performAction:kGLSMediatorActionGetUserInfoProperty params:params];
    
    return [result boolValue];
}

- (void)userInfo_passengerState:(PassengerState)state {
    
    NSDictionary *params = @{@"userinfo_property_name":@"passengerState",
                             @"userinfo_property_ivar":@(state)};
    
    [self performAction:kGLSMediatorActionSetUserInfoProperty params:params];
}

- (PassengerState)userInfo_passengerState {
    
    NSDictionary *params = @{@"userinfo_property_name":@"passengerState"};
    
    NSNumber *result =  [self performAction:kGLSMediatorActionGetUserInfoProperty params:params];
    
    return [result integerValue];
}

- (void)userInfo_selectCarType:(SelectCarType)type {
    
    NSDictionary *params = @{@"userinfo_property_name":@"businessType",
                             @"userinfo_property_ivar":@(type)};
    
    [self performAction:kGLSMediatorActionSetUserInfoProperty params:params];
}

- (SelectCarType)userInfo_selectCarType {
    
    NSDictionary *params = @{@"userinfo_property_name":@"businessType"};
    
    NSNumber *result =  [self performAction:kGLSMediatorActionGetUserInfoProperty params:params];
    
    return [result integerValue];
}

- (void)userInfo_bindEnterprise:(BOOL)enterprise {
    
    NSDictionary *params = @{@"userinfo_property_name":@"bindEnterprise",
                             @"userinfo_property_ivar":@(enterprise)};
    
    [self performAction:kGLSMediatorActionSetUserInfoProperty params:params];
}

- (BOOL)userInfo_bindEnterprise {
    
    NSDictionary *params = @{@"userinfo_property_name":@"bindEnterprise"};
    
    NSNumber *result = [self performAction:kGLSMediatorActionGetUserInfoProperty params:params];
    
    return [result boolValue];
}


#pragma mark - Config
- (void)configInfo_initConfigInfo:(NSDictionary *)info {
    
    [self performAction:kGLSMediatorActionInitConfigInfo params:info];
}

- (NSDictionary *)configInfo_fetchConfigInfo {
    
    return [self performTarget:kGLSMediatorTargetGlobalInfoHelper action:kGLSMediatorActionFetchConfigInfo shouldCacheTarget:YES];
}

- (void)configInfo_domainName:(NSString *)address {
    
    NSDictionary *params = @{@"configinfo_property_name":@"domainName",
                             @"configinfo_property_ivar":address};
    
    [self performAction:kGLSMediatorActionSetConfigInfoProperty params:params];
}

- (NSString *)configInfo_domainName {
    
    NSDictionary *params = @{@"configinfo_property_name":@"domainName"};
    
    return [self performAction:kGLSMediatorActionGetConfigInfoProperty params:params];
}

- (void)configInfo_htmlIp:(NSString *)ip {
    
    NSDictionary *params = @{@"configinfo_property_name":@"htmlIp",
                             @"configinfo_property_ivar":ip};
    
    [self performAction:kGLSMediatorActionSetConfigInfoProperty params:params];
}

- (NSString *)configInfo_htmlIp {
    
    NSDictionary *params = @{@"configinfo_property_name":@"htmlIp"};
    
    return [self performAction:kGLSMediatorActionGetConfigInfoProperty params:params];
}

- (void)configInfo_sslUrl:(NSString *)url {
    
    NSDictionary *params = @{@"configinfo_property_name":@"sslUrl",
                             @"configinfo_property_ivar":url};
    
    [self performAction:kGLSMediatorActionSetConfigInfoProperty params:params];
}

- (NSString *)configInfo_sslUrl {
    
    NSDictionary *params = @{@"configinfo_property_name":@"sslUrl"};
    
    return [self performAction:kGLSMediatorActionGetConfigInfoProperty params:params];
}

- (void)configInfo_mqttIp:(NSString *)ip {
    
    NSDictionary *params = @{@"configinfo_property_name":@"mqttIp",
                             @"configinfo_property_ivar":ip};
    
    [self performAction:kGLSMediatorActionSetConfigInfoProperty params:params];
}

- (NSString *)configInfo_mqttIp {
    
    NSDictionary *params = @{@"configinfo_property_name":@"mqttIp"};
    
    return [self performAction:kGLSMediatorActionGetConfigInfoProperty params:params];
}

- (void)configInfo_mqttPort:(NSString *)port {
    
    NSDictionary *params = @{@"configinfo_property_name":@"mqttPort",
                             @"configinfo_property_ivar":port};
    
    [self performAction:kGLSMediatorActionSetConfigInfoProperty params:params];
}

- (NSString *)configInfo_mqttPort {
    
    NSDictionary *params = @{@"configinfo_property_name":@"mqttPort"};
    
    return [self performAction:kGLSMediatorActionGetConfigInfoProperty params:params];
}

- (void)configInfo_mqttSslPort:(NSString *)port {
    
    NSDictionary *params = @{@"configinfo_property_name":@"mqttSslPort",
                             @"configinfo_property_ivar":port};
    
    [self performAction:kGLSMediatorActionSetConfigInfoProperty params:params];
}

- (NSString *)configInfo_mqttSslPort {
    
    NSDictionary *params = @{@"configinfo_property_name":@"mqttSslPort"};
    
    return [self performAction:kGLSMediatorActionGetConfigInfoProperty params:params];
}

- (void)configInfo_mqttClientId:(NSString *)id {
    
    NSDictionary *params = @{@"configinfo_property_name":@"mqttClientId",
                             @"configinfo_property_ivar":id};
    
    [self performAction:kGLSMediatorActionSetConfigInfoProperty params:params];
}

- (NSString *)configInfo_mqttClientId {
    
    NSDictionary *params = @{@"configinfo_property_name":@"mqttClientId"};
    
    return [self performAction:kGLSMediatorActionGetConfigInfoProperty params:params];
}

- (void)configInfo_channelId:(NSString *)id {
    
    NSDictionary *params = @{@"configinfo_property_name":@"channelId",
                             @"configinfo_property_ivar":id};
    
    [self performAction:kGLSMediatorActionSetConfigInfoProperty params:params];
}

- (NSString *)configInfo_channelId {
    
    NSDictionary *params = @{@"configinfo_property_name":@"channelId"};
    
    return [self performAction:kGLSMediatorActionGetConfigInfoProperty params:params];
}

-(BOOL)mqttReadyToConnect {
    
    NSNumber *result = [self performTarget:kGLSMediatorTargetGlobalInfoHelper action:kGLSMediatorActionMqttReadyToConnect shouldCacheTarget:YES];
    
    return [result boolValue];
}

#pragma mark - private method
- (id)performAction:(NSString *)actionName params:(NSDictionary *)params {
    
    return [self performTarget:kGLSMediatorTargetGlobalInfoHelper action:actionName params:params shouldCacheTarget:YES];
}

@end
