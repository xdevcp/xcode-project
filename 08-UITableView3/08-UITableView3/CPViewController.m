//
//  CPViewController.m
//  08-UITableView3
//
//  Created by pan on 14-5-23.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "CPViewController.h"

@interface CPViewController () <UITableViewDataSource,UITableViewDelegate>

@end

@implementation CPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 创建表格
	// self.view.bounds 占据整个屏幕  UITableViewStylePlain 普通样式
    UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    tableView.dataSource = self;
    tableView.delegate = self;
    
    [self.view addSubview:tableView];
}

#pragma mark 数据源方法

#pragma mark 行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 30;
}

#pragma mark 返回每一行的cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"C1";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"第%d行数据",indexPath.row];
    
    NSLog(@"%p - %d", cell, indexPath.row);
    
    return cell;
}

#pragma mark 代理方法设置行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}
@end
