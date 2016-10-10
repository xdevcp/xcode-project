//
//  NotifierAppDelegate.h
//  Notifier
//
//  Created by Brandon Trebitowski on 7/29/10.
//  Copyright RightSprite 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NotifierViewController;

@interface NotifierAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    NotifierViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet NotifierViewController *viewController;

@end

