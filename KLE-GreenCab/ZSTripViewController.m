//
//  ZSTripViewController.m
//  KLE-GreenCab
//
//  Created by Kelvin Lee on 1/3/15.
//  Copyright (c) 2015 Kelvin. All rights reserved.
//

#import "ZSTripViewController.h"

@interface ZSTripViewController ()

@end

@implementation ZSTripViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    // get time from server?
    self.clock.text = [self getLocalTime];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString *)getLocalTime
{
    NSDate *today = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    NSString *currentTime = [formatter stringFromDate:today];
    NSLog(@"TIME %@", currentTime);
    return currentTime;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
