//
//  GLSMediator+AutoServices.m
//  GLSMediator
//
//  Created by gls on 2019/11/12.
//

#import "GLSMediator+AutoServices.h"

// ModuleName & TargetName
NSString * const kGLSMediatorAutoServicesModuleName = @"GLSSwiftAutoServices";
NSString * const kGLSMediatorAutoServicesTarget = @"AutoServices";

// ActionNames
NSString * const kGLSMediatorAutoServicesSetEnvironment = @"setEnvironment";
NSString * const kGLSMediatorAutoServicesSetClientType = @"setClientType";
NSString * const kGLSMediatorAutoServicesGetHomeViewController = @"getHomeViewController";

@implementation GLSMediator (AutoServices)

- (void)setAutoServicesEnvironment:(int)environment
{
    [self performTarget:kGLSMediatorAutoServicesTarget
                 action:kGLSMediatorAutoServicesSetEnvironment
                 module:kGLSMediatorAutoServicesModuleName
                 params:@{ @"environment": @(environment) }
    shouldCacheTarget:NO];
}

- (void)setAutoServicesClientType:(AutoServiceClientType)type
{
    [self performTarget:kGLSMediatorAutoServicesTarget
                 action:kGLSMediatorAutoServicesSetClientType
                 module:kGLSMediatorAutoServicesModuleName
                 params:@{ @"platform": type == AutoServiceClientType_Passenger ? @0 : @1 }
      shouldCacheTarget:NO];
}

- (UIViewController *)getAutoServicesHomeViewController {
    return [self performTarget:kGLSMediatorAutoServicesTarget
                 action:kGLSMediatorAutoServicesGetHomeViewController
                 module:kGLSMediatorAutoServicesModuleName
                 params:nil
      shouldCacheTarget:NO];
}

@end
