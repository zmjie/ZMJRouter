//
//  ZMJRouterConfig.h
//  ZMJRouter
//
//  Created by zmjie on 2019/12/26.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZMJRouterConfig : NSObject

+ (instancetype)zmj_sharedInstance;

@property (strong, nonatomic) NSMutableDictionary *zmj_routes;

@end

NS_ASSUME_NONNULL_END
