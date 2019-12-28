//
//  UIColor+ZMJ.h
//  ZMJRouter
//
//  Created by zmjie on 2019/12/26.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (ZMJRouter)

+ (UIColor *)zmj_dynamicColor:(UIColor *)lightColor zmj_darkColor:(UIColor *)darkColor;

@end

NS_ASSUME_NONNULL_END
