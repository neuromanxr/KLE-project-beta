//
//  ZSTipButton.m
//  KLE-GreenCab
//
//  Created by Kelvin Lee on 12/24/14.
//  Copyright (c) 2014 Kelvin. All rights reserved.
//

#import "ZSTipButton.h"

@implementation ZSTipButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
//        NSLog(@"INITWITHFRAME");
        
        // Must be set to NO so touch events can be caught in TipsControl
        self.userInteractionEnabled = NO;
        
        // Fires off the selector when UIControlEventTouchUpInside is sent from TipsControl
        [self addTarget:self action:@selector(highlightButton) forControlEvents:UIControlEventTouchUpInside];
//        if ([self respondsToSelector:@selector(highlightButton)]) {
//            NSLog(@"RESPONDS");
//        }
        
        self.tipAmountLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 15, 50, 50)];
        self.tipAmountLabel.textColor = [UIColor whiteColor];
        [self addSubview:self.tipAmountLabel];
    }
    return self;
}

// not used
- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
//        NSLog(@"INITWITHCODER");
    }
    return self;
}

- (void)highlightButton
{
    NSLog(@"HIGHLIGHTED");
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    self.layer.borderWidth = 0;
//    self.layer.cornerRadius = 10;
//    self.layer.masksToBounds = YES;
    
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

//- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    [super touchesBegan:touches withEvent:event];
//    NSLog(@"BUTTON TOUCHED %lu", self.tag);
//    [self setNeedsDisplay];
//}
//
//- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    [super touchesMoved:touches withEvent:event];
//    [self setNeedsDisplay];
//}
//
//- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    [super touchesCancelled:touches withEvent:event];
//    [self setNeedsDisplay];
//}
//
//- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    [super touchesEnded:touches withEvent:event];
//    [self setNeedsDisplay];
//}

@end
