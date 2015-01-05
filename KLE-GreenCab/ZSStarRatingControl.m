//
//  ZSStarRatingControl.m
//  KLE-GreenCab
//
//  Created by Kelvin Lee on 12/23/14.
//  Copyright (c) 2014 Kelvin. All rights reserved.
//

#import "ZSStarRatingControl.h"
#import "ZSStarRatingView.h"
#import "UIView+Subviews.h"


@implementation ZSStarRatingControl

//@synthesize star, highlightedStar, delegate, isFractionalRatingEnabled;

#pragma mark -
#pragma mark Initialization

- (void)setupView {
    self.clipsToBounds = YES;
    currentIdx = -1;
    _star = [UIImage imageNamed:@"star.png"];
    _highlightedStar = [UIImage imageNamed:@"star_highlighted.png"];
    
    for (int i=0; i<numberOfStars; i++) {
        ZSStarRatingView *v = [[ZSStarRatingView alloc] initWithDefault:self.star highlighted:self.highlightedStar position:i allowFractions:_isFractionalRatingEnabled];
        [self addSubview:v];
    }
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        numberOfStars = kDefaultNumberOfStars;
        if (_isFractionalRatingEnabled)
            numberOfStars *=kNumberOfFractions;
        [self setupView];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        numberOfStars = kDefaultNumberOfStars;
        if (isFractionalRatingEnabled)
            numberOfStars *=kNumberOfFractions;
        [self setupView];
        
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame andStars:(NSUInteger)_numberOfStars isFractional:(BOOL)isFract{
    self = [super initWithFrame:frame];
    if (self) {
        isFractionalRatingEnabled = isFract;
        numberOfStars = _numberOfStars;
        if (_isFractionalRatingEnabled)
            numberOfStars *=kNumberOfFractions;
        [self setupView];
    }
    return self;
}

- (void)layoutSubviews {
    for (int i=0; i < numberOfStars; i++) {
        [(ZSStarRatingView *)[self subViewWithTag:i] centerIn:self.frame with:numberOfStars];
    }
}

#pragma mark -
#pragma mark Customization

- (void)setStar:(UIImage*)defaultStarImage highlightedStar:(UIImage*)highlightedStarImage {
    for(NSInteger i = 0; i < numberOfStars; i++){
        [self setStar:defaultStarImage highlightedStar:highlightedStarImage atIndex:i];
    }
}

- (void)setStar:(UIImage*)defaultStarImage highlightedStar:(UIImage*)highlightedStarImage atIndex:(int)index {
    ZSStarRatingView *selectedStar = (ZSStarRatingView *)[self subViewWithTag:index];
    
    // check if star exists
    if (!selectedStar) return;
    
    // check images for nil else use default stars
    defaultStarImage = (defaultStarImage) ? defaultStarImage : star;
    highlightedStarImage = (highlightedStarImage) ? highlightedStarImage : highlightedStar;
    
    [selectedStar setStarImage:defaultStarImage highlightedStarImage:highlightedStarImage];
}

#pragma mark -
#pragma mark Touch Handling

- (UIButton*)starForPoint:(CGPoint)point {
    for (int i=0; i < numberOfStars; i++) {
        if (CGRectContainsPoint([self subViewWithTag:i].frame, point)) {
            return (UIButton*)[self subViewWithTag:i];
        }
    }
    return nil;
}

- (void)disableStarsDownToExclusive:(int)idx {
    for (int i=numberOfStars; i > idx; --i) {
        UIButton *b = (UIButton*)[self subViewWithTag:i];
        b.highlighted = NO;
    }
}

- (void)disableStarsDownTo:(int)idx {
    for (int i=numberOfStars; i >= idx; --i) {
        UIButton *b = (UIButton*)[self subViewWithTag:i];
        b.highlighted = NO;
    }
}


- (void)enableStarsUpTo:(int)idx {
    for (int i=0; i <= idx; i++) {
        UIButton *b = (UIButton*)[self subViewWithTag:i];
        b.highlighted = YES;
    }
}

- (BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
    CGPoint point = [touch locationInView:self];
    UIButton *pressedButton = [self starForPoint:point];
    if (pressedButton) {
        int idx = pressedButton.tag;
        if (pressedButton.highlighted) {
            [self disableStarsDownToExclusive:idx];
        } else {
            [self enableStarsUpTo:idx];
        }
        currentIdx = idx;
    }
    return YES;
}

- (void)cancelTrackingWithEvent:(UIEvent *)event {
    [super cancelTrackingWithEvent:event];
}

- (BOOL)continueTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
    CGPoint point = [touch locationInView:self];
    
    UIButton *pressedButton = [self starForPoint:point];
    if (pressedButton) {
        int idx = pressedButton.tag;
        UIButton *currentButton = (UIButton*)[self subViewWithTag:currentIdx];
        
        if (idx < currentIdx) {
            currentButton.highlighted = NO;
            currentIdx = idx;
            [self disableStarsDownToExclusive:idx];
        } else if (idx > currentIdx) {
            currentButton.highlighted = YES;
            pressedButton.highlighted = YES;
            currentIdx = idx;
            [self enableStarsUpTo:idx];
        }
    } else if (point.x < [self subViewWithTag:0].frame.origin.x) {
        ((UIButton*)[self subViewWithTag:0]).highlighted = NO;
        currentIdx = -1;
        [self disableStarsDownToExclusive:0];
    }
    return YES;
}

- (void)endTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
    [self.delegate newRating:self :self.rating];
    [super endTrackingWithTouch:touch withEvent:event];
}

#pragma mark -
#pragma mark Rating Property

- (void)setRating:(float)_rating {
    if (isFractionalRatingEnabled) {
        _rating *=kNumberOfFractions;
    }
    [self disableStarsDownTo:0];
    currentIdx = (int)_rating-1;
    [self enableStarsUpTo:currentIdx];
}

- (float)rating {
    if (isFractionalRatingEnabled) {
        return (float)(currentIdx+1)/kNumberOfFractions;
    }
    return (NSUInteger)currentIdx+1;
}


#pragma mark -
#pragma mark Memory Management

- (void)dealloc {
    self.star = nil;
    self.highlightedStar = nil;
    self.delegate = nil;
}

@end

