//
//  ViewController.m
//  KLE-GreenCab
//
//  Created by Kelvin Lee on 12/17/14.
//  Copyright (c) 2014 Kelvin. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "ZSRideViewController.h"
#import "ZSBillOfRightsViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.BORButton addTarget:self action:@selector(showBORView) forControlEvents:UIControlEventTouchUpInside];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showRideView) name:@"Note" object:nil];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(postNotificationInAppDelegate) userInfo:nil repeats:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showBORView
{
    ZSBillOfRightsViewController *billOfRightsViewController = [[ZSBillOfRightsViewController alloc] init];
    if (billOfRightsViewController) {
        [billOfRightsViewController setModalPresentationStyle:UIModalPresentationFormSheet];
        [billOfRightsViewController setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
        
        [self presentViewController:billOfRightsViewController animated:YES completion:nil];
    }
}

- (void)showRideView
{
    ZSRideViewController *rideViewController = [[ZSRideViewController alloc] init];
    
    if (rideViewController)
    {
        [rideViewController setModalPresentationStyle:UIModalPresentationFormSheet];
        [rideViewController setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
        
        [self presentViewController:rideViewController animated:YES completion:nil];
    }
}

- (void)postNotificationInAppDelegate
{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    if ([appDelegate respondsToSelector:@selector(didReceiveNotification)]) {
        [appDelegate didReceiveNotification];
        [[NSNotificationCenter defaultCenter] removeObserver:self];
    }
}

@end
