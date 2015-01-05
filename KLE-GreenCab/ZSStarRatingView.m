//
//  ZSStarRatingView.m
//  KLE-GreenCab
//
//  Created by Kelvin Lee on 12/23/14.
//  Copyright (c) 2014 Kelvin. All rights reserved.
//

#import "ZSStarRatingView.h"
#import "ZSStarRatingControl.h"

@implementation ZSStarRatingView

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        //
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
//    UIColor *buttonColor = [UIColor colorWithRed:32/255.0f green:116/255.0f blue:138/255.0f alpha:1.0f];
//    UIColor *buttonSelectColor = [UIColor colorWithRed:9/255.0f green:48/255.0f blue:74/255.0f alpha:1.0f];
    
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    CGContextSetFillColorWithColor(context, buttonSelectColor.CGColor);
//    CGContextFillRect(context, self.bounds);
    
//    int aSize = 100.0;
//    const CGFloat color[4] = { 0.0, 0.0, 1.0, 1.0 }; // Blue
//    CGColorRef aColor = CGColorCreate(CGColorSpaceCreateDeviceRGB(), color);
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    CGContextSetLineWidth(context, aSize);
//    CGFloat xCenter = 100.0;
//    CGFloat yCenter = 100.0;
//    
//    float  w = 100.0;
//    double r = w / 2.0;
//    float flip = -1.0;
//    
//    CGContextSetFillColorWithColor(context, aColor);
//    CGContextSetStrokeColorWithColor(context, aColor);
//        
//    double theta = 2.0 * M_PI * (2.0 / 5.0); // 144 degrees
//        
//    CGContextMoveToPoint(context, xCenter, r*flip+yCenter);
//        
//    for (NSUInteger k=1; k<5; k++)
//    {
//        float x = r * sin(k * theta);
//        float y = r * cos(k * theta);
//        CGContextAddLineToPoint(context, x+xCenter, y*flip+yCenter);
//    }
//    xCenter += 150.0;
//
//    CGContextClosePath(context);
//    CGContextFillPath(context);
}

- (void)drawStar
{
    int aSize = 100.0;
    const CGFloat color[4] = { 0.0, 0.0, 1.0, 1.0 }; // Blue
    CGColorRef aColor = CGColorCreate(CGColorSpaceCreateDeviceRGB(), color);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, aSize);
    CGFloat xCenter = 100.0;
    CGFloat yCenter = 100.0;
    
    float  w = 100.0;
    double r = w / 2.0;
    float flip = -1.0;
    
    CGContextSetFillColorWithColor(context, aColor);
    CGContextSetStrokeColorWithColor(context, aColor);
    
    double theta = 2.0 * M_PI * (2.0 / 5.0); // 144 degrees
    
    CGContextMoveToPoint(context, xCenter, r*flip+yCenter);
    
    for (NSUInteger k=1; k<5; k++)
    {
        float x = r * sin(k * theta);
        float y = r * cos(k * theta);
        CGContextAddLineToPoint(context, x+xCenter, y*flip+yCenter);
    }
    xCenter += 150.0;
    
    CGContextClosePath(context);
    CGContextFillPath(context);
}

- (void)drawHighlightedStar
{
    int aSize = 100.0;
    const CGFloat color[4] = { 0.0, 0.0, 0.0, 1.0 }; // Blue
    CGColorRef aColor = CGColorCreate(CGColorSpaceCreateDeviceRGB(), color);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, aSize);
    CGFloat xCenter = 100.0;
    CGFloat yCenter = 100.0;
    
    float  w = 100.0;
    double r = w / 2.0;
    float flip = -1.0;
    
    CGContextSetFillColorWithColor(context, aColor);
    CGContextSetStrokeColorWithColor(context, aColor);
    
    double theta = 2.0 * M_PI * (2.0 / 5.0); // 144 degrees
    
    CGContextMoveToPoint(context, xCenter, r*flip+yCenter);
    
    for (NSUInteger k=1; k<5; k++)
    {
        float x = r * sin(k * theta);
        float y = r * cos(k * theta);
        CGContextAddLineToPoint(context, x+xCenter, y*flip+yCenter);
    }
    xCenter += 150.0;
    
    CGContextClosePath(context);
    CGContextFillPath(context);
}

#pragma mark -
#pragma mark Initialization

- (id)initWithDefault:(UIImage*)star highlighted:(UIImage*)highlightedStar position:(int)index allowFractions:(BOOL)fractions {
    self = [super initWithFrame:CGRectZero];
    
    if (self) {
        [self setTag:index];
        if (fractions) {
            highlightedStar = [self croppedImage:highlightedStar];
            star = [self croppedImage:star];
        }
        self.frame = CGRectMake((star.size.width * index), 0, (star.size.width * 0.50), (star.size.height * 0.50 + kEdgeInsetBottom));
        [self setStarImage:star highlightedStarImage:highlightedStar];
        [self setImageEdgeInsets:UIEdgeInsetsMake(0, 0, kEdgeInsetBottom, 0)];
        [self setBackgroundColor:[UIColor clearColor]];
        if (index == 0) {
   	        [self setAccessibilityLabel:@"1 star"];
        } else {
   	        [self setAccessibilityLabel:[NSString stringWithFormat:@"%d stars", index+1]];
        }
    }
    return self;
}


- (UIImage *)croppedImage:(UIImage*)image {
    float partWidth = image.size.width/kNumberOfFractions * image.scale;
    int part = (self.tag+kNumberOfFractions)%kNumberOfFractions;
    float xOffset = partWidth*part;
    CGRect newFrame = CGRectMake(xOffset, 0, partWidth , image.size.height * image.scale);
    CGImageRef resultImage = CGImageCreateWithImageInRect([image CGImage], newFrame);
    UIImage *result = [UIImage imageWithCGImage:resultImage scale:image.scale orientation:image.imageOrientation];
    CGImageRelease(resultImage);
    return result;
}



#pragma mark -
#pragma mark UIView methods

- (UIView*)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    return self.superview;
}

#pragma mark -
#pragma mark Layouting

- (void)centerIn:(CGRect)_frame with:(int)numberOfStars {
    CGSize size = self.frame.size;
    
    float height = self.frame.size.height;
    float frameHeight = _frame.size.height;
    float newY = (frameHeight-height)/2;
    
    float widthOfStars = self.frame.size.width * numberOfStars;
    float frameWidth = _frame.size.width;
    float gapToApply = (frameWidth-widthOfStars)/2;
    
    self.frame = CGRectMake((size.width*self.tag) + gapToApply, newY, size.width, size.height);
}

- (void)setStarImage:(UIImage*)starImage highlightedStarImage:(UIImage*)highlightedImage {
    [self setImage:starImage forState:UIControlStateNormal];
    [self setImage:highlightedImage forState:UIControlStateSelected];
    [self setImage:highlightedImage forState:UIControlStateHighlighted];
}

@end
