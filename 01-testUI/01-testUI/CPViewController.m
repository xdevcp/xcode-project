//
//  CPViewController.m
//  01-testUI
//
//  Created by pan on 14-4-21.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "CPViewController.h"

@interface CPViewController ()

@end

@implementation CPViewController

- (void)btnClick:(UIButton *)btn
{
    if (0 == btn.tag)
    {
        NSString *text1 = _num1.text;
        NSString *text2 = _num2.text;
        
        NSLog(@"%@ + %@", text1, text2);
        
        // 将字符串转为整数
        int i1 = [text1 intValue];
        int i2 = [text2 intValue];
        int sum = i1 + i2;
        //NSLog(@"%d", i1 + i2);
        
        self.result.text = [NSString stringWithFormat:@"%d", sum];

    }
    else if(1 == btn.tag)
    {
        NSLog(@"%@", btn);
        
        NSLog(@"有%d个控件", self.view.subviews.count);

        NSLog(@"点我啊");
    }

}
@end
