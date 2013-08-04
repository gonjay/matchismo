//
//  PlayingCard.m
//  Matchismo
//
//  Created by Ussyer on 13-7-30.
//  Copyright (c) 2013年 MothinLab. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

- (int)match:(NSArray *)otherCards
{
    int score = 0;
    
    if ([otherCards count]) {
        for (id otherCard in otherCards) {
            if ([otherCard isKindOfClass:[PlayingCard class]]) {
                PlayingCard *otherPlayingCard = (PlayingCard *)otherCard;
                if ([otherPlayingCard.suit isEqualToString:self.suit]) {
                    score += 1;
                } else if (otherPlayingCard.rank == self.rank) {
                    score += 4;
                } else {
                    score = 0;
                    break;
                }
            }
        }
    }
    
//    if (otherCards.count == 1) {
//        PlayingCard *otherCard = [otherCards lastObject];
//        if ([otherCard.suit isEqualToString:self.suit]) {
//            score = 1;
//        } else if (otherCard.rank == self.rank) {
//            score = 4;
//        }
//    } else {
//        for (PlayingCard *otherCard in otherCards) {
//            if ([otherCard.suit isEqualToString:self.suit]) {
//                score = 1;
//            } else if (otherCard.rank == self.rank) {
//                score = 4;
//            } else {
//                score = 0;
//            }
//        }
//    }
    
    return score;
}

- (NSString *)contents
{
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

@synthesize suit = _suit;

+ (NSArray *)validSuits
{
    return @[@"♥",@"♦",@"♠",@"♣"];
}

- (void)setSuit:(NSString *)suit
{
    if ([[PlayingCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}

- (NSString *)suit
{
    return _suit ?_suit :@"?";
}

+ (NSArray *)rankStrings
{
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

+ (NSUInteger)maxRank
{
    return [PlayingCard rankStrings].count - 1;
}

- (void)setRank:(NSUInteger)rank
{
    if (rank <= [PlayingCard maxRank]) {
        _rank = rank;
    }
}
@end
