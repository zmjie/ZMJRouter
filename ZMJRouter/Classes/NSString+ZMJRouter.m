//
//  NSString+ZMJRouter.m
//  ZMJRouter
//
//  Created by zmjie on 2019/12/26.
//

#import "NSString+ZMJRouter.h"

@implementation NSString (ZMJRouter)

- (NSString *)zmj_scheme {
    
    if (![self containsString:@"://"]) {
        return @"";
    }
    return [[self componentsSeparatedByString:@"://"] firstObject];
}

- (NSString *)zmj_host {
    
    if (![self containsString:@"://"]) {
        return @"";
    }
    
    if (![self containsString:@"/"]) {
        return @"";
    }
    return [[[self stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"%@%@", self.zmj_scheme, @"://"] withString:@""] componentsSeparatedByString:@"/"] firstObject];
}

- (NSString *)zmj_path {
    
    return [[self stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"%@%@%@%@", self.zmj_scheme, @"://", self.zmj_host, @"/"] withString:@""] stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"%@%@", @"?", self.zmj_keyValues] withString:@""];
}

- (NSString *)zmj_allPath {
    
    return [self stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"%@%@", @"?", self.zmj_keyValues] withString:@""];
}

- (NSString *)zmj_keyValues {
    
    if (![self containsString:@"?"]) {
        return @"";
    }
    return [[self componentsSeparatedByString:@"?"] lastObject];
}

- (NSDictionary *)zmj_parameters {
    
    if ([self.zmj_keyValues stringByReplacingOccurrencesOfString:@" " withString:@""].length == 0) {
        return @{};
    }
    
    NSArray *array = [self.zmj_keyValues componentsSeparatedByString:@"&"];
    
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    
    [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        NSString *keyValue = (NSString *)obj;
        
        if ([keyValue containsString:@"="]) {
            
            [dic setValue:[[keyValue componentsSeparatedByString:@"="] lastObject] forKey:[[keyValue componentsSeparatedByString:@"="] firstObject]];
        }
    }];
    
    return dic;
}

@end
