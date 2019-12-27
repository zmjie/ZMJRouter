//
//  ZMJViewController.m
//  ZMJRouter
//
//  Created by zmjie on 12/26/2019.
//  Copyright (c) 2019 zmjie. All rights reserved.
//

#import "ZMJViewController.h"

#import "ZMJMacro.h"

#import "UIColor+ZMJ.h"

#import <ZMJRouter/ZMJRouter.h>
#import <Masonry/Masonry.h>

@interface ZMJViewController () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) UITableView *zmj_tableViewPlain;

@property (strong, nonatomic) NSArray *array;

@end

@implementation ZMJViewController

+ (void)load {
    
    [ZMJRouter zmj_registerURLPattern:@"zmj://zmjVC" zmj_classString:NSStringFromClass(self.class)];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor zmj_dynamicColor:[UIColor whiteColor] zmj_darkColor:[UIColor whiteColor]];
    
    if (@available(iOS 11.0, *)) {} else {
        
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    [self zmj_initData];
    [self zmj_initView];
    [self zmj_makeSubViewsConstraints];
}

- (void)zmj_initData {
    
    _array = @[@"URL Push", @"URL Push + 回调", @"URL Present", @"URL Present + 回调"];
}

- (void)zmj_initView {

    [self.view addSubview:self.zmj_tableViewPlain];
}

- (void)zmj_makeSubViewsConstraints {
    
    [_zmj_tableViewPlain mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(zmj_navBarHeight);
        make.leading.bottom.trailing.equalTo(self.view);
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *zmj_string = @"UITableViewCell";
    
    UITableViewCell *zmj_cell = [tableView dequeueReusableCellWithIdentifier:zmj_string];
    
    if (!zmj_cell) {
        
        zmj_cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:zmj_string];
    }
    
    zmj_cell.textLabel.font = zmj_pingFangSCRegularSize(zmj_defaultFontSize);
    zmj_cell.textLabel.text = _array[indexPath.row];
    
    return zmj_cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return zmj_size(50);
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.row) {
            
        case 0: {
            
            [ZMJRouter zmj_pushViewControllerURLString:@"zmj://zmjDemoVC?zmj_title=Push" zmj_animated:YES];
//            [ZMJRouter pushViewControllerURLString:@"zmj://zmjDemoVC" parameters:@{@"zmj_title" : @"Push"} animated:YES];
        }
            break;
        
        case 1: {
            
            [ZMJRouter zmj_pushViewControllerURLString:@"zmj://zmjDemoVC?zmj_title=Push" zmj_parameters:@{@"zmj_demoBlock" : ^(id obj) {
                
                NSLog(@"%@", obj);
                
            }} zmj_animated:YES];
        }
            break;
            
        case 2: {
            
//            [ZMJRouter presentViewControllerURLString:@"zmj://zmjDemoVC?zmj_title=Present" animated:YES completion:nil];
            [ZMJRouter zmj_presentViewControllerURLString:@"zmj://zmjDemoVC" zmj_parameters:@{@"zmj_title" : @"Present"} zmj_animated:YES zmj_completion:nil];
        }
            break;
            
        case 3: {
            
            [ZMJRouter zmj_presentViewControllerURLString:@"zmj://zmjDemoVC?zmj_title=Present" zmj_parameters:@{@"zmj_demoBlock" : ^(id obj) {
                
                NSLog(@"%@", obj);
                
            }} zmj_animated:YES zmj_completion:nil];
        }
            break;
            
        default:
            break;
    }
}

- (UITableView *)zmj_tableViewPlain {
    if (!_zmj_tableViewPlain) {
        _zmj_tableViewPlain = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _zmj_tableViewPlain.delegate = self;
        _zmj_tableViewPlain.dataSource = self;
        _zmj_tableViewPlain.backgroundColor = [UIColor zmj_dynamicColor:[UIColor whiteColor] zmj_darkColor:[UIColor whiteColor]];
        _zmj_tableViewPlain.tableFooterView = [UIView new];
        
        if (@available(iOS 11.0, *)) {
            
            _zmj_tableViewPlain.contentInsetAdjustmentBehavior   = UIScrollViewContentInsetAdjustmentNever;
        }
    }
    return _zmj_tableViewPlain;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
