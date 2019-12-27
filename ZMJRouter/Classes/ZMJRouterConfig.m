//
//  ZMJRouterConfig.m
//  ZMJRouter
//
//  Created by zmjie on 2019/12/25.
//

#import "ZMJRouterConfig.h"

@implementation ZMJRouterConfig

 static ZMJRouterConfig *zmj_routerConfig;

+ (instancetype)zmj_sharedInstance {
    
    static dispatch_once_t zmj_oncePredicate;
    dispatch_once(&zmj_oncePredicate, ^{
        
        zmj_routerConfig = [[ZMJRouterConfig alloc] init];
    });
    
    return zmj_routerConfig;
}

- (NSMutableDictionary *)zmj_routes {
    if (!_zmj_routes) {
        
        _zmj_routes = [[NSMutableDictionary alloc] init];
    }
    return _zmj_routes;
}

@end