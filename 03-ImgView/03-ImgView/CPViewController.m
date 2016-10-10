//
//  CPViewController.m
//  03-ImgView
//
//  Created by pan on 14-4-25.
//  Copyright (c) 2014年 pan. All rights reserved.
//

#import "CPViewController.h"

@interface CPViewController ()
{
    NSArray *_allDescs;
}
@end

@implementation CPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// 获取所有的描述（通过解析plist文件来创建数组对象）
    // 访问项目中资源包里面的资源，用mainBundle
    NSBundle *bundle = [NSBundle mainBundle];
    // 获取文件的全路径（传入文件名，后缀名）
    NSString *path = [bundle pathForResource:@"descs" ofType:@"plist"];
    _allDescs = [NSArray arrayWithContentsOfFile:path];
    
//    NSLog(@"%@",_allDescs);
    // 设置默认值
    _imageDesc.text = _allDescs[0];
}

#pragma mark 点击了setting
- (IBAction)btnSetting {
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    // 取出中点
    CGPoint tempCenter = _settingView.center;
    /*
      --改变改变控件宽/高度分三个步骤
        1.取出frame
        2.定义临时变量，修改frame
        3.重新赋值frame
     */
    if (_settingView.frame.origin.y == self.view.frame.size.height)
    { // 默认隐藏设置界面
        tempCenter.y -= _settingView.frame.size.height;
//      tempCenter.y -= _settingView.bounds.size.height;
//      以上两种方式都能实现改变控件宽/高度
    }
    else // 能看见设置界面
    {
        tempCenter.y += _settingView.bounds.size.height;
    }
    _settingView.center = tempCenter;
    
    [UIView commitAnimations];
}

#pragma mark 滑动条(slider)值改变
- (IBAction)sliderValueChange:(UISlider *)sender {
//    NSLog(@"slider.value=%.f",sender.value);
    // 设置中间的图片
    NSString *imageName = [NSString stringWithFormat:@"%.f.png",sender.value];
    _imageView.image = [UIImage imageNamed:imageName];
    
    // 设置序号（第几张）
    _imageNo.text = [NSString stringWithFormat:@"%.f/16",sender.value + 1];
    
    // 设置描述
    int no = (int)(sender.value + 0.5);
    _imageDesc.text = _allDescs[no];
}

#pragma mark 改变图片尺寸大小
- (IBAction)imageSizeChange:(UISlider *)sender {
    NSLog(@"imageSizeChange -> sender.value=%f",sender.value);
    // 改变图片尺寸大小，用transform形变属性
    _imageView.transform = CGAffineTransformMakeScale(sender.value, sender.value);
}

#pragma mark 夜间模式
- (IBAction)nigheMode:(UISwitch *)sender {
    if (sender.on)
    {
        self.view.backgroundColor = [UIColor darkGrayColor];
    }
    else
    {
        self.view.backgroundColor = [UIColor whiteColor];
    }
}

@end
