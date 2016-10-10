//
//  main.m
//  arc & block
//
//  Created by pan on 14-4-17.
//  Copyright (c) 2014年 pan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

typedef int (^MyBlock)(int,int);
int main()
{
    // 用block输出n条横线
    
    void (^lineblock)(int) = ^(int n)
    {
        for (int i =0; i < n; i++) {
            NSLog(@"%d---------------",i+1);
        }
    };
    
    lineblock(1);
    
    
    MyBlock sumBlock = ^(int a,int b)
    {
        return a + b;
    };
    
    int sum = sumBlock(1,1);
    
    MyBlock minusBlock = ^(int a,int b)
    {
        return a - b;
    };
    
    int min = minusBlock(1,9);
    
    NSLog(@"%d---------------",sum);
    NSLog(@"%d---------------",min);
    
    return 0;
}

void testarc()
{
    Person *p = [[Person alloc] init];
    
    p = nil;
    
    NSLog(@"~~~~~~~~~~~~~");
}

