//
//  ZSPaymentView.m
//  KLE-GreenCab
//
//  Created by Kelvin Lee on 12/22/14.
//  Copyright (c) 2014 Kelvin. All rights reserved.
//

#import "ZSPaymentView.h"

@implementation ZSPaymentView

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        //
//        self.opaque = NO;
//        [self setBackgroundColor:[[UIColor blueColor] colorWithAlphaComponent:0.2]];
    }
    return self;
}

- (void)drawPaymentElements
{
    UIColor *darkBlueGreen = [UIColor colorWithRed:9/255.0f green:48/255.0f blue:74/255.0f alpha:1.0f];
    UIColor *lightBlueGreen = [UIColor colorWithRed:17/255.0f green:106/255.0f blue:131/255.0f alpha:1.0f];
    UIColor *darkBlueGreenAlt = [UIColor colorWithRed:19/255.0f green:59/255.0f blue:82/255.0f alpha:1.0f];
    UIColor *lightBlueGreenAlt = [UIColor colorWithRed:21/255.0f green:110/255.0f blue:137/255.0f alpha:1.0f];
    UIColor *buttonColor = [UIColor colorWithRed:32/255.0f green:116/255.0f blue:138/255.0f alpha:1.0f];
    UIColor *circleColor = [UIColor colorWithRed:114/255.0f green:152/255.0f blue:165/255.0f alpha:1.0f];
    UIColor *numberColor = [UIColor colorWithRed:14/255.0f green:109/255.0f blue:133/255.0f alpha:1.0f];
    
    // gradients
    CAGradientLayer *leftGradient = [CAGradientLayer layer];
    leftGradient.frame = CGRectMake(0, 0, (self.bounds.size.width / 1.85), self.bounds.size.height);
    leftGradient.colors = [NSArray arrayWithObjects:(id)[darkBlueGreen CGColor], (id)[lightBlueGreen CGColor], nil];
    leftGradient.opacity = 0.6;
    [self.layer insertSublayer:leftGradient atIndex:0];
    
    CAGradientLayer *rightGradient = [CAGradientLayer layer];
    rightGradient.frame = CGRectMake((self.bounds.size.width / 1.85), 0, (self.bounds.size.width / 2), self.bounds.size.height);
    rightGradient.colors = [NSArray arrayWithObjects:(id)[darkBlueGreenAlt CGColor], (id)[lightBlueGreenAlt CGColor], nil];
    rightGradient.opacity = 0.8;
    [self.layer insertSublayer:rightGradient atIndex:1];
    
    // lines
    CAShapeLayer *line = [CAShapeLayer layer];
    line.strokeColor = [[UIColor whiteColor] CGColor];
    line.lineWidth = 1.0;
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, nil, 0, 110);
    CGPathAddLineToPoint(path, nil, 280, 110);
    CGPathMoveToPoint(path, nil, 0, 540);
    CGPathAddLineToPoint(path, nil, 280, 540);
    line.path = path;
    [self.layer addSublayer:line];
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
//    [[UIColor lightGrayColor] setFill];
//    UIBezierPath *roundedRect = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(20, 20, 200, 200) byRoundingCorners:(UIRectCornerTopRight | UIRectCornerBottomRight) cornerRadii:CGSizeMake(12.0, 12.0)];
//    UIBezierPath *roundedRect = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(20, 20, 200, 200) byRoundingCorners:UIRectCornerTopLeft cornerRadii:CGSizeMake(12.0, 12.0)];
//    [roundedRect fillWithBlendMode:kCGBlendModeNormal alpha:1.0f];
    
    [self drawPaymentElements];
}


@end
