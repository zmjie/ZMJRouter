//
//  ZMJRouterConfig.m
//  ZMJRouter
//
//  Created by zmjie on 2019/12/26.
//

#import "ZMJRouterConfig.h"

@implementation ZMJRouterConfig

+ (instancetype)zmj_sharedInstance {
    
    static ZMJRouterConfig *zmj_routerConfig;
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
