//
//  Card.m
//  Matchismo
//
//  Created by houzq on 10/5/14.
//  Copyright (c) 2014 iOSLearning. All rights reserved.
//

#import "Card.h"

@implementation Card

- (int)match:(NSArray *)otherCards{
    
    int score = 0;
    
    for (Card *card in otherCards){
        if ([card.contents isEqualToString:self.contents]) {
            score = 1;
        }
    }
    
    return score;
}

@end
