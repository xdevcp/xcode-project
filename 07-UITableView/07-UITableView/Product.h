//
//  Product.h
//  07-UITableView
//
//  Created by pan on 14-5-20.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Product : NSObject
/* 图片 */
@property (nonatomic, copy) NSString *icon;
/* 名称 */
@property (nonatomic, copy) NSString *name;
/* 描述 */
@property (nonatomic, copy) NSString *desc;

@end
