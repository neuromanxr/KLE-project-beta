//
//  ZSExploreButton.m
//  KLE-GreenCab
//
//  Created by Kelvin Lee on 12/21/14.
//  Copyright (c) 2014 Kelvin. All rights reserved.
//

#import "ZSExploreButton.h"

@implementation ZSExploreButton

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        //
        self.opaque = NO;
//        self.backgroundColor = [UIColor blueColor];
        self.layer.borderWidth = 0;
        self.layer.cornerRadius = 8;
        self.layer.masksToBounds = YES;
    }
    return self;
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    UIColor *buttonColor = [UIColor colorWithRed:32/255.0f green:116/255.0f blue:138/255.0f alpha:1.0f];
    UIColor *buttonSelectColor = [UIColor colorWithRed:9/255.0f green:48/255.0f blue:74/255.0f alpha:1.0f];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, buttonSelectColor.CGColor);
    CGContextFillRect(context, self.bounds);
    
    if (self.state != UIControlStateHighlighted) {
        CGContextSaveGState(context);
        CGContextSetFillColorWithColor(context, buttonColor.CGColor);
        CGContextFillRect(context, self.bounds);
        CGContextRestoreGState(context);
    }
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    [self setNeedsDisplay];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesMoved:touches withEvent:event];
    [self setNeedsDisplay];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesCancelled:touches withEvent:event];
    [self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent:event];
    [self setNeedsDisplay];
}




@end
