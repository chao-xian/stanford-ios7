//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Kelv on 13/12/2013.
//  Copyright (c) 2013 Kelv. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Card.h"

@interface CardMatchingGame : NSObject

// designated initialiser - is this because of the (instancetype)?
- (instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck;

- (void)chooseCardAtIndex:(NSUInteger)index;
- (Card *)cardAtIndex:(NSUInteger)index;

@property (nonatomic, readonly) NSInteger score;

@end
