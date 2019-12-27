//
//  NSString+ZMJRouter.h
//  ZMJRouter
//
//  Created by zmjie on 2019/12/26.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (ZMJRouter)

//https://github.com/zmjie/ZMJRouter?author1=zmjie&author2=zmjie

- (NSString *)zmj_scheme;           //https

- (NSString *)zmj_host;             //github.com

- (NSString *)zmj_path;             //zmjie/ZMJRouter

- (NSString *)zmj_allPath;          //https://github.com/zmjie/ZMJRouter

- (NSString *)zmj_keyValues;        //author1=zmjie&author2=zmjie

- (NSDictionary *)zmj_parameters;   //@{@"author1":@"zmjie", @"author2":@"zmjie"}

@end

NS_ASSUME_NONNULL_END
