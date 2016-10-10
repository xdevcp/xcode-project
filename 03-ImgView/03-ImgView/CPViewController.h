//
//  CPViewController.h
//  03-ImgView
//
//  Created by pan on 14-4-25.
//  Copyright (c) 2014年 pan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CPViewController : UIViewController

- (IBAction)btnSetting;
- (IBAction)sliderValueChange:(UISlider *)sender;

- (IBAction)imageSizeChange:(UISlider *)sender;
- (IBAction)nigheMode:(UISwitch *)sender;


@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *imageNo;
@property (weak, nonatomic) IBOutlet UILabel *imageDesc;
@property (weak, nonatomic) IBOutlet UIView *settingView;


@end
