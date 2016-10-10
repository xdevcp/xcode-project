//
//  Shop.h
//  09-UITableView-性能优化
//
//  Created by pan on 14-5-25.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Shop : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *desc;

- (id)initWithDict:(NSDictionary *)dict;
+ (id)shopWithDict:(NSDictionary *)dict;

@end
