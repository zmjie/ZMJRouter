//
//  ZMJRouter.h
//  ZMJRouter
//
//  Created by zmjie on 2019/12/26.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZMJRouter : NSObject

+ (void)zmj_registerURLPattern:(NSString *)URLPattern zmj_classString:(NSString *)classString;

+ (void)zmj_pushViewControllerURLString:(NSString *)urlstring zmj_animated:(BOOL)animated;
+ (void)zmj_pushViewControllerURLString:(NSString *)urlstring zmj_parameters:(NSDictionary *)parameters zmj_animated:(BOOL)animated;

+ (void)zmj_presentViewControllerURLString:(NSString *)urlstring zmj_animated:(BOOL)animated zmj_completion:(void (^ __nullable)(void))completion;
+ (void)zmj_presentViewControllerURLString:(NSString *)urlstring zmj_parameters:(NSDictionary *)parameters  zmj_animated:(BOOL)animated zmj_completion:(void (^ __nullable)(void))completion;

+ (void)zmj_popOrDismissViewControllerAnimated:(BOOL)animated;

@end

NS_ASSUME_NONNULL_END
