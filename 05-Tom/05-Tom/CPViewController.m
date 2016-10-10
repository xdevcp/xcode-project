//
//  CPViewController.m
//  05-Tom
//
//  Created by pan on 14-5-4.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "CPViewController.h"

@interface CPViewController ()
{
    NSDictionary *_dist; // 保存所有图片的个数
}
@end

@implementation CPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    // 获取tom.plist的全路径
    NSBundle *bundle = [NSBundle mainBundle];
    NSString * path = [bundle pathForResource:@"tom" ofType:@"plist"];
    
    //  根据文件路径加载字典
    _dist = [NSDictionary dictionaryWithContentsOfFile:path];
}

//- (IBAction)fangpi:(UIButton *)sender {
//    [self playAnim:28 andFlieName:@"fart"];
//}
//
//- (IBAction)cynbals:(UIButton *)sender {
//    [self playAnim:13 andFlieName:@"cymbal"];
//}

- (void)playAnim:(int)count andFlieName:(NSString *)filemame
{
    // 1.创建可变数组
    NSMutableArray *images = [NSMutableArray array];
    
    // 2.添加图片
    for (int i = 0; i<count; i++) {
        // 图片名 name
        NSString *name = [NSString stringWithFormat:@"%@_%02d.jpg",filemame,i];
        // 全路径 path
        NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:nil];
        
        // 加载图片（有缓存）
//        UIImage *img = [UIImage imageNamed:name];
        
        // 加载图片（没有缓存）
        UIImage *img = [[UIImage alloc] initWithContentsOfFile:path];
        
        [images addObject:img];
    }
    
    // 3.设置动画图片
    _tom.animationImages = images;
    
    // 4.设置只播放一次（序列帧动画）
    _tom.animationRepeatCount = 1;
    
    // 5.设置动画的持续时间
    _tom.animationDuration = 0.1 * count;
    
    // 动画开始
    [_tom startAnimating];
}
#pragma mark 监听所有的按钮点击
- (IBAction)btnClick:(UIButton *)sender {
    if (_tom.isAnimating) return;   // 动画是否运行
    
    // 取出按钮文字
    NSString *title = [sender titleForState:UIControlStateNormal];
    
    // NSLog(@"%@",_dist);
    
    // 获得图片数量
    int count = [_dist[title] intValue];
    
    // 调用方法播放动画
    [self playAnim:count andFlieName:title];
}
@end
