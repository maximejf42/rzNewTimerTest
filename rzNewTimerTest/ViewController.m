//
//  ViewController.m
//  rzNewTimerTest
//
//  Created by Robert Zimmelman on 10/28/15.
//  Copyright © 2015 Robert Zimmelman. All rights reserved.
//

#import "ViewController.h"

int timeTick = 0;

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *myLabel;

- (IBAction)myStart:(id)sender;
@end

@implementation ViewController
@synthesize myLabel;
@synthesize myTimer;
- (void)viewDidLoad {
    [super viewDidLoad];
    [myLabel setText:[NSString stringWithFormat:@"%d",timeTick]];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)myTick {
    timeTick++;
    [myLabel setText:[NSString stringWithFormat:@"Time = %d",timeTick] ];
    NSLog(@"Tick... %d",timeTick);
}


- (IBAction)myStart:(id)sender {
    [myTimer invalidate];
    myTimer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(myTick) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:myTimer forMode: NSDefaultRunLoopMode];
    [myLabel setText:[NSString stringWithFormat:@"Time = %d",timeTick] ];
}
@end

