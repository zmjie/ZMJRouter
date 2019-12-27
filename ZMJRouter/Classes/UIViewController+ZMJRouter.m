//
//  UIViewController+ZMJRouter.m
//  ZMJRouter
//
//  Created by zmjie on 2019/12/26.
//

#import "UIViewController+ZMJRouter.h"

#import "ZMJRouterConfig.h"

#import "NSString+ZMJRouter.h"

@implementation UIViewController (ZMJRouter)

+ (UIViewController *)zmj_topViewController {
    
    return [self zmj_topViewControllerWithRootViewController:[UIApplication sharedApplication].keyWindow.rootViewController];
}

+ (UIViewController *)zmj_viewControllerURLString:(NSString *)urlstring zmj_parameters:(NSDictionary *)parameters {
    
    if (![[ZMJRouterConfig zmj_sharedInstance].zmj_routes.allKeys containsObject:urlstring.zmj_allPath]) {
        return nil;
    }
    
    NSString *zmj_classString = [[ZMJRouterConfig zmj_sharedInstance].zmj_routes objectForKey:urlstring.zmj_allPath];
    
    if ([zmj_classString stringByReplacingOccurrencesOfString:@" " withString:@""].length == 0) {
        return nil;
    }
    
    Class zmj_class = NSClassFromString(zmj_classString);
    UIViewController *zmj_vc = [[zmj_class alloc] init];
    
    NSMutableDictionary *zmj_dic = [[NSMutableDictionary alloc] init];
    
    [zmj_dic addEntriesFromDictionary:urlstring.zmj_parameters];
    [zmj_dic addEntriesFromDictionary:parameters];
    
    [zmj_dic.allKeys enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        NSString *zmj_key = (NSString *)obj;
        
        [zmj_vc setValue:[zmj_dic objectForKey:zmj_key] forKey:zmj_key];
    }];
    
    return zmj_vc;
}

+ (UIViewController *)zmj_topViewControllerWithRootViewController:(UIViewController*)rootViewController {
    
    if ([rootViewController isKindOfClass:[UITabBarController class]]) {
        
        UITabBarController *zmj_tabBarController = (UITabBarController *)rootViewController;
        return [self zmj_topViewControllerWithRootViewController:zmj_tabBarController.selectedViewController];
        
    }else if ([rootViewController isKindOfClass:[UINavigationController class]]) {
        
        UINavigationController *zmj_navigationController = (UINavigationController *)rootViewController;
        return [self zmj_topViewControllerWithRootViewController:zmj_navigationController.visibleViewController];
        
    }else if (rootViewController.presentedViewController) {
        
        UIViewController *zmj_presentedViewController = rootViewController.presentedViewController;
        return [self zmj_topViewControllerWithRootViewController:zmj_presentedViewController];
        
    }else {
        
        return rootViewController;
    }
}

@end
