//
//  CPViewController.h
//  02-button
//
//  Created by pan on 14-4-22.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CPViewController : UIViewController


@property (weak, nonatomic) IBOutlet UIButton *btn;

- (IBAction)run:(id)sender;

- (IBAction)rotate:(id)sender;

- (IBAction)zoom:(id)sender;

@end
