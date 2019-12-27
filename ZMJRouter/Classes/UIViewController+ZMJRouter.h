//
//  UIViewController+ZMJRouter.h
//  ZMJRouter
//
//  Created by zmjie on 2019/12/26.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (ZMJRouter)

+ (UIViewController *)zmj_topViewController;

+ (UIViewController *)zmj_viewControllerURLString:(NSString *)urlstring zmj_parameters:(NSDictionary *)parameters;

@end

NS_ASSUME_NONNULL_END
