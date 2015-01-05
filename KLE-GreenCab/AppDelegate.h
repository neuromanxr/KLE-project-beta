//
//  AppDelegate.h
//  KLE-GreenCab
//
//  Created by Kelvin Lee on 12/17/14.
//  Copyright (c) 2014 Kelvin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

- (void)didReceiveNotification;
- (void)didReceiveDestination;

@end

