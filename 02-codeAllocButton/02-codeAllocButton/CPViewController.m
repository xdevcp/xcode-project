//
//  CPViewController.m
//  02-codeAllocButton
//
//  Created by pan on 14-4-23.
//  Copyright (c) 2014年 pan. All rights reserved.
//

#import "CPViewController.h"

#define kLaberTag 999

@interface CPViewController ()

@end

@implementation CPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSLog(@"viewDidLoad()----控制器的view加载完毕后会调用一次");
    
    // 添加Lable
    UILabel *lab = [[UILabel alloc]init];
    NSLog(@"lab地址：%p", lab);
    
    lab.frame = CGRectMake(80, 60, 200, 40);
    lab.text = @"Hi Bitch!";
    //设置title的字体居中
    lab.textAlignment = NSTextAlignmentCenter;
    
    lab.backgroundColor = [UIColor lightGrayColor];
    // 中点的x,y
    CGFloat centerX = self.view.frame.size.width * 0.5;
    CGFloat centerY = self.view.frame.size.height * 0.5;
    lab.center = CGPointMake(centerX, centerY);
    [lab setTag:kLaberTag];
    lab.font = [UIFont systemFontOfSize:22];

    
    // 代码创建按钮
    UIButton *btn = [[UIButton alloc]init];
    NSLog(@"btn地址：%p", btn);
    
    // 设置按钮属性
    btn.frame = CGRectMake(100, 320, 111, 40);
    
    UIImage *normal = [UIImage imageNamed:@"button.png"];
    [btn setBackgroundImage:normal forState:UIControlStateNormal];
    
    // 监听按钮点击
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];

    // 添加控件到控制器的view中
    [self.view addSubview:lab];
    [self.view addSubview:btn];

}

#pragma mark 监听按钮点击
- (void)btnClick:(UILabel *)btn
{
//    NSLog(@"---地址：%p -btnClick", lab);
//    NSLog(@"点我干嘛！！");
    
    // 取得父控件，通过Tag取到Laber
    UILabel *laber = (UILabel *)[btn.superview viewWithTag:kLaberTag];
    NSLog(@"%d,%@",laber.tag,laber.text);
    if (![laber.text isEqual: @"Login Success"]) {
        laber.text = @"Login Success";
    }
    else
    {
        laber.text = @"Exit Success";
    }
}

@end
