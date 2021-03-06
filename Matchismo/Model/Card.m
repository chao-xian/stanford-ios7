//
//  Card.m
//  Matchismo
//
//  Created by Kelv on 28/11/2013.
//  Copyright (c) 2013 Kelv. All rights reserved.
//

#import "Card.h"

@interface Card()

@end

@implementation Card

- (int)match:(NSArray *)otherCards
{
    int score = 0;
    
    for (Card *card in otherCards) {
        if ([card.contents isEqualToString:self.contents]) {
            score = 1;
        }
    }
    
    return score;
}

@end
