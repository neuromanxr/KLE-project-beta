//
//  ZSStarRatingView.h
//  KLE-GreenCab
//
//  Created by Kelvin Lee on 12/23/14.
//  Copyright (c) 2014 Kelvin. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE

#define kEdgeInsetBottom 20
#define kStarSpacing 5

@interface ZSStarRatingView : UIButton {
    
}

- (id)initWithDefault:(UIImage*)star highlighted:(UIImage*)highlightedStar position:(int)index allowFractions:(BOOL)fractions;
- (void)centerIn:(CGRect)_frame with:(int)numberOfStars;
- (void)setStarImage:(UIImage*)starImage highlightedStarImage:(UIImage*)highlightedImage;
- (UIImage *)croppedImage:(UIImage*)image;
@end
