//
//  GLSMediator+GLSPersistenceActions.m
//  GLSMediator
//
//  Created by gls on 2019/11/12.
//

#import "GLSMediator+GLSPersistenceActions.h"

NSString *const kGLSMediatorTargetPersistenceHelper = @"GLSPersistenceHelper";

NSString *const kGLSMediatorActionPersistData = @"persistData";
NSString *const kGLSMediatorActionFetchData = @"fetchData";
NSString *const kGLSMediatorActionDeleteData = @"deleteData";
NSString *const kGLSMediatorActionExistsData = @"existsData";

@implementation GLSMediator (GLSPersistenceActions)

- (BOOL)existsPlistDataWithKey:(NSString *)key {
    
    NSDictionary *params = @{@"persist_mode": @"PLIST",
                             @"persist_key": key};
    
    NSNumber *result = [self performTarget:kGLSMediatorTargetPersistenceHelper
                                    action:kGLSMediatorActionExistsData
                                    params:params
                         shouldCacheTarget:YES];
    
    return [result boolValue];
}

/** 传入要持久化的数据 及 文件名*/
- (BOOL)persistData:(id)data toPlist:(NSString *)key {
    
    NSDictionary *params = @{@"persist_mode": @"PLIST",
                             @"persist_data": data,
                             @"persist_key": key};
    
    NSNumber *result = [self performTarget:kGLSMediatorTargetPersistenceHelper
                 action:kGLSMediatorActionPersistData
                 params:params
      shouldCacheTarget:YES];
    
    return [result boolValue];
}

/** 获取本地数据*/
- (id)fetchPlistDataWithKey:(NSString *)key {
    
    NSDictionary *params = @{@"persist_mode": @"PLIST",
                             @"persist_key": key};
    
    return [self performTarget:kGLSMediatorTargetPersistenceHelper
                 action:kGLSMediatorActionFetchData
                 params:params
      shouldCacheTarget:YES];
}

/** 删除本地数据*/
- (BOOL)deletePlistWithKey:(NSString *)key {
    
    NSDictionary *params = @{@"persist_mode": @"PLIST",
                             @"persist_key": key};
    
    NSNumber *result = [self performTarget:kGLSMediatorTargetPersistenceHelper
                 action:kGLSMediatorActionDeleteData
                 params:params
      shouldCacheTarget:YES];
    
    return [result boolValue];
}


/*----------UserDefault---------*/

/** 传入要持久化的数据 及 key*/
- (BOOL)persistData:(NSDictionary *)data toPrefer:(NSString *)key {
    
    NSDictionary *params = @{@"persist_mode": @"PREFER",
                             @"persist_data": data,
                             @"persist_key": key};
    
    NSNumber *result = [self performTarget:kGLSMediatorTargetPersistenceHelper
                 action:kGLSMediatorActionPersistData
                 params:params
      shouldCacheTarget:YES];
    
    return [result boolValue];
}

/** 获取perference数据*/
- (id)fetchPreferDataWithKey:(NSString *)key {
    
    NSDictionary *params = @{@"persist_mode": @"PREFER",
                             @"persist_key": key};
    
    return [self performTarget:kGLSMediatorTargetPersistenceHelper
                 action:kGLSMediatorActionFetchData
                 params:params
      shouldCacheTarget:YES];
}

/** 删除perference数据*/
- (BOOL)deletePreferWithKey:(NSString *)key {
    
    NSDictionary *params = @{@"persist_mode": @"PREFER",
                             @"persist_key": key};
    
    NSNumber *result = [self performTarget:kGLSMediatorTargetPersistenceHelper
                 action:kGLSMediatorActionDeleteData
                 params:params
      shouldCacheTarget:YES];
    
    return [result boolValue];
}


/*----------Keychain---------*/
- (BOOL)persistData:(id)data toKeychain:(NSString *)key {
    
    NSDictionary *params = @{@"persist_mode": @"KEYCHAIN",
                             @"persist_data": data,
                             @"persist_key": key};
    
    NSNumber *result = [self performTarget:kGLSMediatorTargetPersistenceHelper
                 action:kGLSMediatorActionPersistData
                 params:params
      shouldCacheTarget:YES];
    
    return [result boolValue];
}

- (id)fetchKeychainDataWithKey:(NSString *)key {
    
    NSDictionary *params = @{@"persist_mode": @"KEYCHAIN",
                             @"persist_key": key};
    
    return [self performTarget:kGLSMediatorTargetPersistenceHelper
                 action:kGLSMediatorActionFetchData
                 params:params
      shouldCacheTarget:YES];
}

- (BOOL)deleteKeychainDataWithKey:(NSString *)key {
    
    NSDictionary *params = @{@"persist_mode": @"KEYCHAIN",
                             @"persist_key": key};
    
    NSNumber *result = [self performTarget:kGLSMediatorTargetPersistenceHelper
                 action:kGLSMediatorActionDeleteData
                 params:params
      shouldCacheTarget:YES];
    
    return [result boolValue];
}

@end
