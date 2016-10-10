//
//  CPViewController.m
//  06-联系人管理
//
//  Created by pan on 14-5-11.
//  Copyright (c) 2014年 itcast. All rights reserved.
//
#import "CPViewController.h"

#define kDurationSpeed 0.5
#define kRowH 50

// 类扩展 （class extension 又叫匿名分类）
@interface CPViewController ()
{
    NSArray *_allNames;
}
@end

@implementation CPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _allNames = @[@"小明",@"小芳",@"小红",@"大黄"];
}

#pragma mark 添加
- (IBAction)add:(UIBarButtonItem *)sender {
    // 首先取出最后一个控件
    UIView *last = [self.view.subviews lastObject];
    
    CGFloat rowY = last.frame.origin.y + last.frame.size.height + 2;
    
    // 创建一行
    UIView *rowView = [self createRowView];
    
    // 添加一行到控制器的view中
    [self.view addSubview:rowView];
    
    // 让删除item有效
    _removeItem.enabled = YES;
    
    
    rowView.frame = CGRectMake(320, rowY, 320, kRowH);
    rowView.alpha = 0;
    // 执行动画
    [UIView animateWithDuration:kDurationSpeed animations:^{
        rowView.frame = CGRectMake(0, rowY, 320, kRowH);
        rowView.alpha = 1;
    }];
}

#pragma mark 创建一行
- (UIView *)createRowView
{
    UIView *rowView = [[UIView alloc] init];
    rowView.backgroundColor = [UIColor redColor];
    
    // 添加名字
    UILabel *name = [[UILabel alloc] init];
    name.frame = CGRectMake(0, 0, 320, kRowH);
    
    int nameIndex = arc4random_uniform(_allNames.count);
    name.text = _allNames[nameIndex];
    
    name.backgroundColor = [UIColor clearColor];
    name.textAlignment = NSTextAlignmentCenter;
    [rowView addSubview:name];
    
    // 添加头像
    UIButton *icon = [UIButton buttonWithType:UIButtonTypeCustom];
    icon.frame = CGRectMake(20, 0, 50, kRowH);
    
    // 产生随机文件名
    int randomIndex = arc4random_uniform(9); // 0 ~ 8
    NSString *iconName = [NSString stringWithFormat:@"01%d.png",randomIndex];
    [icon setImage:[UIImage imageNamed:iconName] forState:UIControlStateNormal];
    [rowView addSubview:icon];
    return rowView;
}

#pragma mark 删除
- (IBAction)remove:(UIBarButtonItem *)sender {
    // 取出最后一个子控件
    UIView *last = [self.view.subviews lastObject];
    Class c = [UIToolbar class];
    if ([last isKindOfClass:c]) return;
    
    [UIView animateWithDuration:kDurationSpeed animations:^{
        CGRect tempF = last.frame;
        tempF.origin.x = 320;
        last.frame = tempF;
        
        last.alpha = 0;
    } completion:^(BOOL finished) {
        [last removeFromSuperview];
        
        _removeItem.enabled = self.view.subviews.count > 1;
    }];
}
@end
