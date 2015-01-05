//
//  ZSPaymentViewController.h
//  KLE-GreenCab
//
//  Created by Kelvin Lee on 12/22/14.
//  Copyright (c) 2014 Kelvin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZSPaymentViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *tipAmount;
@property (strong, nonatomic) IBOutlet UILabel *basicFareAmount;
@property (strong, nonatomic) IBOutlet UILabel *totalFareAmount;
@property (strong, nonatomic) IBOutlet UILabel *travelTime;
@property (strong, nonatomic) IBOutlet UILabel *customerEmail;

@end
