//
//  CPViewController.m
//  04-Segmented
//
//  Created by pan on 14-4-26.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "CPViewController.h"
/*
 1.adjust....方法去掉第2个参数----add:(BOOL)add （不能增加全局变量或者成员变量）
 2.在表情最后面增加一个“+”按钮，添加按钮在尾部添加一个表情（表情图片随机）
 */

#define kImgWH 60       // 图片宽度
#define kInitCount 9    // 初始图片数量

@interface CPViewController ()

@end

@implementation CPViewController

#pragma mark 控制器的view加载完毕就调用一次
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 创建表情（图片）
//    UIImageView *imageView = [[UIImageView alloc]init];
//    imageView.image = [UIImage imageNamed:@"010.png"];
//    imageView.frame = CGRectMake(30, 80, 40, 40);
//    [self.view addSubview:imageView];
//    [self addImg:@"010.png" x:30 y:80];
    
    [self adjustImagePosWithColumns:2 andAddStyle:YES];
}

#pragma mark 调整图片的位置
- (void)adjustImagePosWithColumns:(int)columns andAddStyle:(BOOL)add
{
    // 每个表情之间间距 = (控制器view的宽度 - 列数 * 表情的宽度) / (列数 + 1)
    CGFloat margin = (self.view.frame.size.width - columns * kImgWH) / (columns + 1);
    // 2.定义第一个表情的位置
    // 第一个表情的Y值
    CGFloat oneY = 100;
    // 第一个表情的x值
    CGFloat oneX = margin;
    
    // 3.创建所有的表情
    for (int i = 0; i<kInitCount; i++) {
        // i这个位置对应的列数
        int col = i % columns;
        // i这个位置对应的行数
        int row = i / columns;
        
        // 列数（col）决定了x
        CGFloat x = oneX + col * (kImgWH + margin);
        // 行数（row）决定了y
        CGFloat y = oneY + row * (kImgWH + margin);
        
//#warning 不一样
        if (add) { // 添加新的imageView
            int no = i % 9; // no == [0, 8]
            NSString *imgName = [NSString stringWithFormat:@"01%d.png", no];
            [self addImg:imgName x:x y:y];
        } else { // 取出旧的imageview 设置x、y
            // 取出i + 1位置对应的imageView，设置x、y值
            // + 1是为了跳过最前面的UISegmentControl
            UIView *child = self.view.subviews[i + 1];
            // 取出frame
            CGRect tempF = child.frame;
            // 修改x、y
            tempF.origin = CGPointMake(x, y);
            // 重新赋值
            child.frame = tempF;
        }
    }
}

#pragma mark 添加表情 icon:表情图片名
- (void)addImg:(NSString *)icon x:(CGFloat)x y:(CGFloat)y
{
    UIImageView *imageView = [[UIImageView alloc]init];
    imageView.image = [UIImage imageNamed:icon];
    imageView.frame = CGRectMake(x, y, kImgWH, kImgWH);
    [self.view addSubview:imageView];
}

#pragma mark 更改表情的列数（碎片）
- (IBAction)indexChange:(UISegmentedControl *)sender {
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    
//    NSLog(@"%d",sender.selectedSegmentIndex);
    
    int columns = sender.selectedSegmentIndex + 2;
    [self adjustImagePosWithColumns:columns andAddStyle:NO];
    
    [UIView commitAnimations];
}
@end
