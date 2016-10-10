//
//  CPViewController.h
//  01-testUI
//
//  Created by pan on 14-4-21.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CPViewController : UIViewController

// 声明一个方法来监听按钮点击
- (IBAction)btnClick:(UIButton *)btn;

@property (nonatomic, weak) IBOutlet UITextField *num1;
@property (nonatomic, weak) IBOutlet UITextField *num2;

@property (nonatomic, weak) IBOutlet UILabel *result;

@end
