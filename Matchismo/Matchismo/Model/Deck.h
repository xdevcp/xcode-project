//
//  Deck.h
//  Matchismo
//
//  Created by houzq on 15/5/14.
//  Copyright (c) 2014 iOSLearning. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void)addCard:(Card *)card atTop:(BOOL)atTop;
- (void)addCard:(Card *)card;

- (Card *)drawRandomCard;
@end
