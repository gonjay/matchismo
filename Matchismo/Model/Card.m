//
//  Card.m
//  Matchismo
//
//  Created by Ussyer on 13-7-30.
//  Copyright (c) 2013年 MothinLab. All rights reserved.
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
        } else {
            score = 0;
        }
    }
    
    return score;
}

@end
