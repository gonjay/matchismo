//
//  PlayingCard.h
//  Matchismo
//
//  Created by Ussyer on 13-7-30.
//  Copyright (c) 2013年 MothinLab. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card
@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;
- (int)match:(NSArray *)card1
        with:(NSArray *)card2;

+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;
@end
