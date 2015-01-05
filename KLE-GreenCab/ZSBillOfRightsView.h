//
//  ZSBillOfRightsView.h
//  KLE-GreenCab
//
//  Created by Kelvin Lee on 12/18/14.
//  Copyright (c) 2014 Kelvin. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE

@interface ZSBillOfRightsView : UIView

@property (strong, nonatomic) NSString *TLCLicenseFrontImageName;
@property (strong, nonatomic) NSString *TLCLicenseBackImageName;
@property (strong, nonatomic) IBOutlet UIImageView *TLCLicenseFront;
@property (strong, nonatomic) IBOutlet UIImageView *TLCLicenseBack;
@property (strong, nonatomic) IBOutlet UILabel *baseLicense;

@end
