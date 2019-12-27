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
    
    UIViewController *vc = [UIViewController zmj_viewControllerURLString:urlstring zmj_parameters:parameters];
    
    if (vc) {
        
        [[UIViewController zmj_topViewController].navigationController pushViewController:vc animated:animated];
    }
}

+ (void)zmj_presentViewControllerURLString:(NSString *)urlstring zmj_animated:(BOOL)animated zmj_completion:(void (^ __nullable)(void))completion {
    
    [self zmj_presentViewControllerURLString:urlstring zmj_parameters:@{} zmj_animated:animated zmj_completion:completion];
}

+ (void)zmj_presentViewControllerURLString:(NSString *)urlstring zmj_parameters:(NSDictionary *)parameters zmj_animated:(BOOL)animated zmj_completion:(void (^ __nullable)(void))completion {
    
    UIViewController *vc = [UIViewController zmj_viewControllerURLString:urlstring zmj_parameters:parameters];
    
    if (vc) {
        
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
        nav.modalPresentationStyle = UIModalPresentationFullScreen;
        [[UIViewController zmj_topViewController].navigationController presentViewController:nav animated:animated completion:completion];
    }
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
