//
//  GLSMediator+GLSPersistenceActions.h
//  GLSMediator
//
//  Created by gls on 2019/11/12.
//

#import "GLSMediator.h"

NS_ASSUME_NONNULL_BEGIN

@interface GLSMediator (GLSPersistenceActions)

/** 检查是否存在*/
- (BOOL)existsPlistDataWithKey:(NSString *_Nonnull)key;

/** 传入要持久化的数据 及 文件名*/
- (BOOL)persistData:(id)data toPlist:(NSString *)key;

/** 获取本地数据*/
- (id)fetchPlistDataWithKey:(NSString *)key;

/** 删除本地数据*/
- (BOOL)deletePlistWithKey:(NSString *)key;


/*----------UserDefault---------*/

/** 传入要持久化的数据 及 key*/
- (BOOL)persistData:(id)data toPrefer:(NSString *)key;

/** 获取perference数据*/
- (id)fetchPreferDataWithKey:(NSString *)key;

/** 删除perference数据*/
- (BOOL)deletePreferWithKey:(NSString *)key;


/*----------Keychain---------*/
- (BOOL)persistData:(id)data toKeychain:(NSString *)key;

- (id)fetchKeychainDataWithKey:(NSString *)key;

- (BOOL)deleteKeychainDataWithKey:(NSString *)key;

@end

NS_ASSUME_NONNULL_END
