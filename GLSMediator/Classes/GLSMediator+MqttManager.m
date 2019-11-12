//
//  GLSMediator+MqttManager.m
//  GLSMediator
//
//  Created by gls on 2019/11/12.
//

#import "GLSMediator+MqttManager.h"
#import "GLSMediator+GLSNetworkActions.h"
#import "GLSMediator+CommonTool.h"
#import "GLSMediator+GLSGlobalInfoHelperActions.h"

NSString *const kGLSMediatorActionInitConfig = @"initConfig";
NSString *const kGLSMediatorTargetMqttManager = @"MqttManager";
NSString *const kGLSMediatorActionConnectState = @"connectState";
NSString *const kGLSMediatorActionConnectMQTT = @"connectMQTT";
NSString *const kGLSMediatorActionSetMQTTDelegate = @"setMQTTDelegate";
NSString *const kGLSMediatorActionDisconnectMQTT = @"disconnectMQTT";
NSString *const kGLSMediatorActionSendInfo = @"sendInfo";

@implementation GLSMediator (MqttManager)

//初始化配置
- (void)initMqttConfig_Class:(Class)objc_Class Methord:(SEL)methord{
    NSString *class = NSStringFromClass(objc_Class);
    NSString *methordString = NSStringFromSelector(methord);

        [self performTarget:kGLSMediatorTargetMqttManager
                     action:kGLSMediatorActionInitConfig
                     params:@{@"class":class,@"methord":methordString}
          shouldCacheTarget:NO];
}

/// 连接状态
- (BOOL)connectState {

    NSString *status = [self performTarget:kGLSMediatorTargetMqttManager
                                    action:kGLSMediatorActionConnectState
                                    params:@{}
                         shouldCacheTarget:NO];

    return [status boolValue];
}

/// 开始连接
- (void)GLSMediator_connectMQTT {

    /// 这里添加需要的参数
    [self performTarget:kGLSMediatorTargetMqttManager
                 action:kGLSMediatorActionConnectMQTT
                 params:@{}
      shouldCacheTarget:NO];
}

/// 设置代理
- (void)GLSMediator_setDelegate:(id)object {

    [self performTarget:kGLSMediatorTargetMqttManager
                 action:kGLSMediatorActionSetMQTTDelegate
                 params:@{@"object": object}
      shouldCacheTarget:NO];
}

/// 断开mqtt连接
- (void)GLSMediator_disconnectMQTTWithAction:(void(^)(BOOL status))action {

    NSMutableDictionary *paramsToSend = [NSMutableDictionary dictionaryWithCapacity:0];
    if (action) {
        paramsToSend[@"action"] = action;
    }
    [self performTarget:kGLSMediatorTargetMqttManager
                 action:kGLSMediatorActionDisconnectMQTT
                 params:paramsToSend
      shouldCacheTarget:NO];
}

/// 发送mqtt消息命令
- (void)GLSMediator_sendInfo:(NSDictionary *)parameters port:(NSString *)port {

    NSMutableDictionary *paramsToSend = [[NSMutableDictionary alloc] init];
    paramsToSend[@"parameters"] = parameters;
    paramsToSend[@"port"] = port;
    [self performTarget:kGLSMediatorTargetMqttManager
                 action:kGLSMediatorActionSendInfo
                 params:paramsToSend
      shouldCacheTarget:NO];
}


@end
