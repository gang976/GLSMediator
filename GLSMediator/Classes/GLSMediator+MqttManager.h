//
//  GLSMediator+MqttManager.h
//  GLSMediator
//
//  Created by gls on 2019/11/12.
//

#import "GLSMediator.h"

NS_ASSUME_NONNULL_BEGIN

@interface GLSMediator (MqttManager)

@property (nonatomic, readonly, assign) BOOL connectState;

/**
 * 初始化数据
 */
- (void)initMqttConfig_Class:(Class)objc_Class Methord:(SEL)methord;

/**
 开始连接
 */
- (void)GLSMediator_connectMQTT;

/**
 设置监听数据的协议

 @param object 遵守协议的对象
 */
- (void)GLSMediator_setDelegate:(id)object;

/**
 断开连接

 @param action 成功后的回调
 */
- (void)GLSMediator_disconnectMQTTWithAction:(void(^)(BOOL status))action;

/**
 发送命令

 @param parameters 命令参数
 @param port 接口
 */
- (void)GLSMediator_sendInfo:(NSDictionary *)parameters port:(NSString *)port;


@end

NS_ASSUME_NONNULL_END
