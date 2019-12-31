//
//  ZMJDemoViewController.m
//  ZMJRouter_Example
//
//  Created by zmjie on 2019/12/26.
//  Copyright © 2019 zmjie. All rights reserved.
//

#import "ZMJDemoViewController.h"

#import "ZMJProtocol.h"

#import "UIColor+ZMJ.h"

#import <ZMJRouter/ZMJRouter.h>

typedef void(^ZMJDemoBlock)(id obj);

@interface ZMJDemoViewController ()

@property (copy, nonatomic) NSString *zmj_title;
@property (copy, nonatomic) ZMJDemoBlock zmj_demoBlock;

@end

@implementation ZMJDemoViewController

+ (void)load {
    
    [ZMJRouter zmj_registerURLPattern:@"zmj://zmjDemoVC" zmj_classString:NSStringFromClass(self.class)];
    [ZMJRouter zmj_registerProtocol:@protocol(zmj_demoViewControllerProtocol) zmj_classString:NSStringFromClass(self.class)];
}

- (UIViewController *)zmj_demoViewController:(NSString *)title zmj_completion:(void (^ __nullable)(id obj))completion {
    
    return [[self.class alloc] initWithTitle:title zmj_completion:completion];
}

- (instancetype)initWithTitle:(NSString *)title zmj_completion:(void (^ __nullable)(id obj))completion{
    if (self = [super init]) {
        
        _zmj_title = title;
        _zmj_demoBlock = completion;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor zmj_dynamicColor:[UIColor whiteColor] zmj_darkColor:[UIColor whiteColor]];
    
    self.title = _zmj_title;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    if (self.zmj_demoBlock) {
        
        self.zmj_demoBlock([NSString stringWithFormat:@"%@%@", _zmj_title, @"逆向传值"]);
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [ZMJRouter zmj_popOrDismissViewControllerAnimated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
