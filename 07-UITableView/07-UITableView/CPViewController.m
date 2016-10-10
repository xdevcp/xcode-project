//
//  CPViewController.m
//  07-UITableView
//
//  Created by pan on 14-5-20.
//  Copyright (c) 2014年 itcast. All rights reserved.
//
#define kHangGao 60

#import "CPViewController.h"

@interface CPViewController () <UITableViewDataSource,UITableViewDelegate>
@end

@implementation CPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

#pragma mark 返回组数 单组设为1
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

#pragma mark 返回组里的行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 9;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // UITableViewCellStyleDefault - 默认不显示详情
    // UITableViewCellStyleSubtitle - 在底部显示详情
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    
    int rowC = indexPath.row + 1;  // 获得行
    
    // 设置文字
    cell.textLabel.text = [NSString stringWithFormat:@"产品 - %d",rowC];
    
    // 设置图片
    NSString *imgName = [NSString stringWithFormat:@"00%d.png",rowC];
    cell.imageView.image = [UIImage imageNamed:imgName];
    
    // 显示详情
    cell.detailTextLabel.text = [NSString stringWithFormat:@"产品%d，很好！！",rowC];
    
    // 显示辅助指示图标
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

#pragma mark 代理方法，设置行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return kHangGao;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *name = [NSString stringWithFormat:@"click row - %d",indexPath.row + 1];
    // 创建弹窗
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"产品信息展示" message:name delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [alert show];
}

@end
