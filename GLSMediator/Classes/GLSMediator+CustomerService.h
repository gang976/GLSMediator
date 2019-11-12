//
//  GLSMediator+CustomerService.h
//  GLSMediator
//
//  Created by gls on 2019/11/12.
//

#import "GLSMediator.h"

NS_ASSUME_NONNULL_BEGIN

@interface GLSMediator (CustomerService)

- (void)GLSMediator_registerQY:(NSString *)appId appName:(NSString *)appName;

- (void)GLSMediator_connectService:(UIViewController *)viewController backImage:(UIImage *)backImage;

@end

NS_ASSUME_NONNULL_END
