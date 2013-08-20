//
//  GameResult.h
//  Matchismo
//
//  Created by Ussyer on 13-8-6.
//  Copyright (c) 2013年 MothinLab. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameResult : NSObject
+ (NSArray *)allGameResults;
@property (readonly, nonatomic) NSDate *start;
@property (readonly, nonatomic) NSDate *end;
@property (readonly, nonatomic) NSTimeInterval duration;
@property (nonatomic) int score;

@end
