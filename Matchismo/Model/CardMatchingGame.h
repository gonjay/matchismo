//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Ussyer on 13-7-31.
//  Copyright (c) 2013年 MothinLab. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject

- (id)initWithCardCount:(NSUInteger)cardcount
              usingDeck:(Deck *)deck;

- (void)flipCardAtIndex:(NSUInteger)index;

- (Card *)cardAtIndex:(NSUInteger)index;

@property (nonatomic,readonly) int score;

@end
