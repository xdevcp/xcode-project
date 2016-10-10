//
//  CPViewController.m
//  02-button
//
//  Created by pan on 14-4-22.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "CPViewController.h"

#define kDelta 20       // 宏定义常量
const int DELTA = 30;   // C++定义常量

@interface CPViewController ()
//{
//    CGFloat _angle;
//}
@end

@implementation CPViewController

// 声明一个带int类型参数的方法
- (void) sum:(int)num
{
    
}
//声明一个带block类型参数的方法
- (void) sumWithBlock:(void (^)())block
{
    // void (^myblock)();  声明block
    // void (^)()block
}


- (void) btnClickWithBlock:(void (^)())block
{
    // 动画 - 开始
    [UIView beginAnimations:nil context:nil];
    // 设置动画时间
    [UIView setAnimationDuration:1.0];
    
    block();
    
    // 动画 - 提交（执行动画）
    [UIView commitAnimations];

}

#pragma mark 控制按钮走动
- (IBAction)run:(id)sender {
    NSLog(@"%@",sender);
    
    [self btnClickWithBlock:^{
        CGRect tmpframe = _btn.frame;
        
        int tag = [sender tag];
        
        switch (tag) {
            case 1:
                tmpframe.origin.y -= DELTA;
                break;
            case 2:
                tmpframe.origin.x += DELTA;
                break;
            case 3:
                tmpframe.origin.y += DELTA;
                break;
            case 4:
                tmpframe.origin.x -= DELTA;
                break;
            default:
                break;
        }
        
        _btn.frame = tmpframe;
    }];
}

#pragma mark 左旋转/又旋转
- (IBAction)rotate:(id)sender {
//    _angle -= M_PI_4;
//    _btn.transform = CGAffineTransformMakeRotation(_angle);
    [self btnClickWithBlock:^{
        int tag = [sender tag];
        NSLog(@"%d",tag);
        
        int var = (5 == tag?-1:1);
        
        _btn.transform = CGAffineTransformRotate(_btn.transform, - M_PI_4 * var);
    }];
}

#pragma mark 放大/缩小
- (IBAction)zoom:(id)sender {
//    _btn.transform = CGAffineTransformMakeScale(1.2, 1.2);
    
    [self btnClickWithBlock:^{
        CGFloat scale = (7 == [sender tag] ? 1.2 : 0.8);
        _btn.transform = CGAffineTransformScale(_btn.transform, scale, scale);
        
    }];
}

@end
