//
//  CPViewController.h
//  06-联系人管理
//
//  Created by pan on 14-5-11.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CPViewController : UIViewController
- (IBAction)add:(UIBarButtonItem *)sender;
- (IBAction)remove:(UIBarButtonItem *)sender;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *removeItem;
@end
