//
//  ZSBillOfRightsViewController.h
//  KLE-GreenCab
//
//  Created by Kelvin Lee on 12/17/14.
//  Copyright (c) 2014 Kelvin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZSBillOfRightsViewController : UIViewController

@property (strong, nonatomic) NSString *TLCLicenseFrontImageName;
@property (strong, nonatomic) NSString *TLCLicenseBackImageName;
@property (strong, nonatomic) IBOutlet UIImageView *TLCLicenseFront;
@property (strong, nonatomic) IBOutlet UIImageView *TLCLicenseBack;
@property (strong, nonatomic) IBOutlet UILabel *baseLicense;

@end
