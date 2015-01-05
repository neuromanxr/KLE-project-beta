//
//  ZSStarRatingControl.h
//  KLE-GreenCab
//
//  Created by Kelvin Lee on 12/23/14.
//  Copyright (c) 2014 Kelvin. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kDefaultNumberOfStars 5
#define kNumberOfFractions 10

@protocol ZSStarRatingDelegate;

@interface ZSStarRatingControl : UIControl {
    NSUInteger numberOfStars;
    int currentIdx;
    UIImage *star;
    UIImage *highlightedStar;
    //	IBOutlet id<DLStarRatingDelegate> delegate;
    BOOL isFractionalRatingEnabled;
}

- (id)initWithFrame:(CGRect)frame;
- (id)initWithFrame:(CGRect)frame andStars:(NSUInteger)_numberOfStars isFractional:(BOOL)isFract;
- (void)setStar:(UIImage*)defaultStarImage highlightedStar:(UIImage*)highlightedStarImage;
- (void)setStar:(UIImage*)defaultStarImage highlightedStar:(UIImage*)highlightedStarImage atIndex:(int)index;

@property (retain,nonatomic) UIImage *star;
@property (retain,nonatomic) UIImage *highlightedStar;
@property (nonatomic) float rating;
@property (assign, nonatomic) id<ZSStarRatingDelegate> delegate;
@property (nonatomic,assign) BOOL isFractionalRatingEnabled;

@end

@protocol ZSStarRatingDelegate

-(void)newRating:(ZSStarRatingControl *)control :(float)rating;

@end
