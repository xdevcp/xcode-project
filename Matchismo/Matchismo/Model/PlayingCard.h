//
//  PlayingCard.h
//  Matchismo
//
//  Created by houzq on 10/5/14.
//  Copyright (c) 2014 iOSLearning. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;

@end
