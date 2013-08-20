//
//  GameResult.m
//  Matchismo
//
//  Created by Ussyer on 13-8-6.
//  Copyright (c) 2013年 MothinLab. All rights reserved.
//

#import "GameResult.h"

@interface GameResult()
@property (readwrite, nonatomic) NSDate *start;
@property (readwrite, nonatomic) NSDate *end;
@end

@implementation GameResult

#define START_KEY @"StartDate"
#define END_KEY @"EndDate"
#define SCORE_KEY @"Score"
#define ALL_RESULTS_KEY @"GameResult_All"

+ (NSArray *)allGameResults
{
    NSMutableArray *allGameReaults = [[NSMutableArray alloc] init];
    
    for (id plist in [[NSUserDefaults standardUserDefaults] dictionaryForKey:ALL_RESULTS_KEY]) {
        GameResult *result = [[GameResult alloc] initFromPropertyList:plist];
        NSLog([NSString stringWithFormat:@"%@ %d", result.start, result.score]);
        [allGameReaults addObject:result];
    }
    if (allGameReaults == nil) {
        return nil;
    }
    
    return allGameReaults;
}

- (id)initFromPropertyList:(id)plist
{
    self = [self init];
    if (self) {
        if ([plist isKindOfClass:[NSDictionary class]]) {
            NSDictionary *resultDictionary = (NSDictionary *)plist;
            _start = resultDictionary[START_KEY];
            _end = resultDictionary[END_KEY];
            _score = [resultDictionary[SCORE_KEY] intValue];
            NSLog([NSString stringWithFormat:@"Sssssss"]);
            if (!_start || !_end) {
                self = nil;
            }
        }
    }
    
    return self;
}

- (void)synchronize
{
    NSMutableDictionary *mutableGameResultsFromUserDefaults = [[[NSUserDefaults standardUserDefaults] dictionaryForKey:ALL_RESULTS_KEY] mutableCopy];
    if (!mutableGameResultsFromUserDefaults) {
        mutableGameResultsFromUserDefaults = [[NSMutableDictionary alloc] init];
    }
    mutableGameResultsFromUserDefaults[[self.start description]] = [self asPropertyList];
    NSLog([NSString stringWithFormat:@"%@\n%@",mutableGameResultsFromUserDefaults[[self.start description]][START_KEY], self.asPropertyList[START_KEY]]);
    [[NSUserDefaults standardUserDefaults] setObject:mutableGameResultsFromUserDefaults forKey:ALL_RESULTS_KEY];
    [[NSUserDefaults standardUserDefaults] synchronize];
    NSLog(@"Synchronize");
}



-(id)asPropertyList
{
    return @{ START_KEY : self.start, END_KEY : self.end, SCORE_KEY : @(self.score)};
}

- (id)init
{
    self = [super init];
    if (self) {
        _start = [NSDate date];
        _end = _start;
    }
    return self;
}

- (NSTimeInterval)duration
{
    return [self.end timeIntervalSinceDate:self.start];
}

- (void)setScore:(int)score
{
    _score = score;
    self.end = [NSDate date];
    [self synchronize]; 
}
@end
