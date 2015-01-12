//
//  ZSTipsControl.h
//  KLE-GreenCab
//
//  Created by Kelvin Lee on 12/24/14.
//  Copyright (c) 2014 Kelvin. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE

@protocol ZSTipsDelegate;

@interface ZSTipsControl : UIControl

@property (assign, nonatomic) id<ZSTipsDelegate>delegate;
@property (nonatomic, strong) NSString *selectedTipValue;
@property (nonatomic, strong) UITextField *textField;

@end

@protocol ZSTipsDelegate

- (void)tipAdded:(ZSTipsControl *)control with:(NSString *)amount;

@end
