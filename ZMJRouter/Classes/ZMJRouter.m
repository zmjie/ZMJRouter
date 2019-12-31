//
//  ZMJRouter.m
//  ZMJRouter
//
//  Created by zmjie on 2019/12/26.
//

#import "ZMJRouter.h"

#import "ZMJRouterConfig.h"

#import "NSString+ZMJRouter.h"
#import "UIViewController+ZMJRouter.h"

@implementation ZMJRouter

+ (void)zmj_registerURLPattern:(NSString *)URLPattern zmj_classString:(NSString *)classString {
    
    [[ZMJRouterConfig zmj_sharedInstance].zmj_routes setValue:classString forKey:URLPattern];
}

+ (void)zmj_pushViewControllerURLString:(NSString *)urlstring zmj_animated:(BOOL)animated {
    
    [self zmj_pushViewControllerURLString:urlstring zmj_parameters:@{} zmj_animated:animated];
}

+ (void)zmj_pushViewControllerURLString:(NSString *)urlstring zmj_parameters:(NSDictionary *)parameters zmj_animated:(BOOL)animated {
    
    UIViewController *zmj_vc = [UIViewController zmj_viewControllerURLString:urlstring zmj_parameters:parameters];
    
    if (zmj_vc) {
        
        [[UIViewController zmj_topViewController].navigationController pushViewController:zmj_vc animated:animated];
    }
}

+ (void)zmj_presentViewControllerURLString:(NSString *)urlstring zmj_animated:(BOOL)animated zmj_completion:(void (^ __nullable)(void))completion {
    
    [self zmj_presentViewControllerURLString:urlstring zmj_parameters:@{} zmj_animated:animated zmj_completion:completion];
}

+ (void)zmj_presentViewControllerURLString:(NSString *)urlstring zmj_parameters:(NSDictionary *)parameters zmj_animated:(BOOL)animated zmj_completion:(void (^ __nullable)(void))completion {
    
    UIViewController *zmj_vc = [UIViewController zmj_viewControllerURLString:urlstring zmj_parameters:parameters];
    
    if (zmj_vc) {
        
        UINavigationController *zmj_navVC = [[UINavigationController alloc] initWithRootViewController:zmj_vc];
        zmj_navVC.modalPresentationStyle = UIModalPresentationFullScreen;
        [[UIViewController zmj_topViewController].navigationController presentViewController:zmj_navVC animated:animated completion:completion];
    }
}

+ (void)zmj_registerProtocol:(Protocol *)protocol zmj_classString:(NSString *)classString {
    
    [[ZMJRouterConfig zmj_sharedInstance].zmj_routes setValue:classString forKey:NSStringFromProtocol(protocol)];
}

+ (Class)zmj_objectForProtocol:(Protocol *)protocol {
    
    if (![[ZMJRouterConfig zmj_sharedInstance].zmj_routes.allKeys containsObject:NSStringFromProtocol(protocol)]) {
        
        return nil;
    }
    
    NSString *zmj_classString = [[ZMJRouterConfig zmj_sharedInstance].zmj_routes objectForKey:NSStringFromProtocol(protocol)];
    
    if ([zmj_classString stringByReplacingOccurrencesOfString:@" " withString:@""].length == 0) {
        
        return nil;
    }
    
    return NSClassFromString(zmj_classString);
}

+ (void)zmj_popOrDismissViewControllerAnimated:(BOOL)animated {
    
    UIViewController *zmj_currentViewController = [UIViewController zmj_topViewController];
    
    if (!zmj_currentViewController) {
        return;
    }
    
    if (zmj_currentViewController.navigationController) {
        
        if (zmj_currentViewController.navigationController.viewControllers.count == 1) {
            
            if (zmj_currentViewController.presentingViewController) {
                
                [zmj_currentViewController dismissViewControllerAnimated:animated completion:nil];
            }
            return;
        }
        
        [zmj_currentViewController.navigationController popViewControllerAnimated:animated];
        return;
    }
    
    if(zmj_currentViewController.presentingViewController) {
        
        [zmj_currentViewController dismissViewControllerAnimated:animated completion:nil];
    }
}

@end
