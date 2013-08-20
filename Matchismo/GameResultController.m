//
//  GameResultController.m
//  Matchismo
//
//  Created by Ussyer on 13-8-6.
//  Copyright (c) 2013年 MothinLab. All rights reserved.
//

#import "GameResultController.h"
#import "GameResult.h"

@interface GameResultController ()
@property (weak, nonatomic) IBOutlet UITextView *display;
@end

@implementation GameResultController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self updateUI];
}

- (void)updateUI
{
    NSString *displayText = @"";
    for (GameResult *result in [GameResult allGameResults]) {
        displayText = [displayText stringByAppendingFormat:@"Score: %d (%@, %0g)\n", result.score, result.end, result.duration];
    }
self.display.text = displayText;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
