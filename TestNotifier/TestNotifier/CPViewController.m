//
//  CPViewController.m
//  TestNotifier
//
//  Created by pan on 14-7-18.
//  Copyright (c) 2014年 Org. All rights reserved.
//

#import "CPViewController.h"

@interface CPViewController ()

@end

@implementation CPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    NSLog(@">>进入应用");
    
    //发送通知
    UILocalNotification *notification=[[UILocalNotification alloc] init];
    if (notification!=nil) {//判断系统是否支持本地通知
        NSDate *now = [NSDate date];
        //从现在开始，5秒以后通知
        notification.fireDate=[now dateByAddingTimeInterval:5];
        //循环通知的周期
        notification.repeatInterval=kCFCalendarUnitSecond;
        //使用本地时区
        notification.timeZone=[NSTimeZone defaultTimeZone];
        notification.alertBody=@"顶部提示内容，通知时间到啦";
        //通知提示音 使用默认的
        notification.soundName= UILocalNotificationDefaultSoundName;
        notification.alertAction=NSLocalizedString(@"你锁屏啦，通知时间到啦", nil);
        //这个通知到时间时，应用程序右上角显示的数字
        notification.applicationIconBadgeNumber = 1;
        
        //add key  给这个通知增加key 便于半路取消。
        // 假如通知不会在还没到时间的时候手动取消,那下面的两行代码不用写
        //        NSDictionary *dict =[NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:notificationtag],@"nfkey",nil];
        //        [notification setUserInfo:dict];
        //执行通知注册
        [[UIApplication sharedApplication]   scheduleLocalNotification:notification];
        //手动清除
//        [notification release];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
