//
//  ZSTripViewController.h
//  KLE-GreenCab
//
//  Created by Kelvin Lee on 1/3/15.
//  Copyright (c) 2015 Kelvin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZSTripViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *arrivalEstimate;
@property (strong, nonatomic) IBOutlet UILabel *clock;
@property (strong, nonatomic) IBOutlet UILabel *originAddress;
@property (strong, nonatomic) IBOutlet UILabel *destinationAddress;

@end
