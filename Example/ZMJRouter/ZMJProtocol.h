//
//  ZMJProtocol.h
//  ZMJRouter_Example
//
//  Created by zmjie on 2019/12/28.
//  Copyright © 2019 zmjie. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol zmj_demoViewControllerProtocol <NSObject>

- (UIViewController *)zmj_demoViewController:(NSString *)title zmj_completion:(void (^ __nullable)(id obj))completion;

@end

@interface ZMJProtocol : NSObject

@end

NS_ASSUME_NONNULL_END
