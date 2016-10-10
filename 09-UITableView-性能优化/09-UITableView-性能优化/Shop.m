//
//  Shop.m
//  09-UITableView-性能优化
//
//  Created by pan on 14-5-25.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "Shop.h"

@implementation Shop

- (id)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        // 将字典中的键值对转成模型属性
        self.name = dict[@"name"];
        self.icon = dict[@"icon"];
        self.desc = dict[@"desc"];
    }
    return self;
}

+ (id)shopWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}
@end
