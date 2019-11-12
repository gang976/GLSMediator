//
//  GLSMediator+CommonTool.h
//  GLSMediator
//
//  Created by gls on 2019/11/12.
//

#import "GLSMediator.h"

NS_ASSUME_NONNULL_BEGIN

@interface GLSMediator (CommonTool)

/// 生成UUID tip: 每次卸载都会变化
- (NSString *)createDeviceUUID;

/// 存储UUID tip: 钥匙串存储保持不变
- (void)saveDeviceUUID;

/// 读取钥匙串中的UUID
- (NSString *)readDeviceUUID;

/// 删除钥匙串中的UUID
- (void)deleteDeviceUUID;

/// 获取IMSI
- (NSString *)getDeviceIMSI;

/// 颜色设置
- (UIColor *)colorWithHexString:(NSString *)hexString;

//获取web公参
- (NSDictionary *)fetchWebCommonParameters;
@end

NS_ASSUME_NONNULL_END
