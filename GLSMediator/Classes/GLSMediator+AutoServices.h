//
//  GLSMediator+AutoServices.h
//  GLSMediator
//
//  Created by gls on 2019/11/12.
//

#import "GLSMediator.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, AutoServiceClientType){
    AutoServiceClientType_Passenger = 0,
    AutoServiceClientType_Driver
};

@interface GLSMediator (AutoServices)

- (void)setAutoServicesEnvironment:(int)environment;

- (void)setAutoServicesClientType:(AutoServiceClientType)type;

- (UIViewController *)getAutoServicesHomeViewController;

@end

NS_ASSUME_NONNULL_END
