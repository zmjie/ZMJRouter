//
//  ZMJDemoViewController.h
//  ZMJRouter_Example
//
//  Created by zmjie on 2019/12/26.
//  Copyright © 2019 zmjie. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^ZMJDemoBlock)(id obj);

@interface ZMJDemoViewController : UIViewController

@property (copy, nonatomic) NSString *zmj_title;
@property (copy, nonatomic) ZMJDemoBlock zmj_demoBlock;

@end

NS_ASSUME_NONNULL_END
