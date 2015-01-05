//
//  ZSBillOfRightsView.m
//  KLE-GreenCab
//
//  Created by Kelvin Lee on 12/18/14.
//  Copyright (c) 2014 Kelvin. All rights reserved.
//

#import "ZSBillOfRightsView.h"
#import "ZSExploreButton.h"

@interface ZSBillOfRightsView ()

@property (nonatomic, strong) NSArray *billOfRightsArray;

@end

@implementation ZSBillOfRightsView

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
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 2.0);
//    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
//    CGFloat components[] = {0.0, 0.0, 1.0, 1.0};
//    CGColorRef color = CGColorCreate(colorSpace, components);
//    CGContextSetStrokeColorWithColor(context, color);
    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
    CGContextMoveToPoint(context, 30, 30);
    CGContextAddLineToPoint(context, 300, 400);
    CGContextAddLineToPoint(context, 200, 100);
    CGContextStrokePath(context);
    
//    CGColorSpaceRelease(colorSpace);
//    CGColorRelease(color);
    
    CGContextRef contexta = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(contexta, 10.0);
    CGContextSetStrokeColorWithColor(contexta, [UIColor redColor].CGColor);
    CGContextAddArc(contexta, self.frame.size.width / 4, self.frame.size.height / 4, (self.frame.size.width - 10) / 2, 0.0, M_PI * 2.0, 1);
    CGContextStrokePath(contexta);
    NSAttributedString *string = [[NSAttributedString alloc] initWithString:@"TEST"];
    [string drawInRect:CGRectMake(10, 20, 300, 40)];
    
    [self drawBillOfRights];
}

- (void)drawBillOfRights
{
    UIColor *darkBlueGreen = [UIColor colorWithRed:9/255.0f green:48/255.0f blue:74/255.0f alpha:1.0f];
    UIColor *lightBlueGreen = [UIColor colorWithRed:17/255.0f green:106/255.0f blue:131/255.0f alpha:1.0f];
    UIColor *darkBlueGreenAlt = [UIColor colorWithRed:19/255.0f green:59/255.0f blue:82/255.0f alpha:1.0f];
    UIColor *lightBlueGreenAlt = [UIColor colorWithRed:21/255.0f green:110/255.0f blue:137/255.0f alpha:1.0f];
    UIColor *buttonColor = [UIColor colorWithRed:32/255.0f green:116/255.0f blue:138/255.0f alpha:1.0f];
    UIColor *circleColor = [UIColor colorWithRed:114/255.0f green:152/255.0f blue:165/255.0f alpha:1.0f];
    UIColor *numberColor = [UIColor colorWithRed:14/255.0f green:109/255.0f blue:133/255.0f alpha:1.0f];
    
    
    CAGradientLayer *leftGradient = [CAGradientLayer layer];
    leftGradient.frame = CGRectMake(0, 0, (self.bounds.size.width / 1.85), self.bounds.size.height);
    leftGradient.colors = [NSArray arrayWithObjects:(id)[darkBlueGreen CGColor], (id)[lightBlueGreen CGColor], nil];
    [self.layer insertSublayer:leftGradient atIndex:0];
    
    CAGradientLayer *rightGradient = [CAGradientLayer layer];
    rightGradient.frame = CGRectMake((self.bounds.size.width / 1.85), 0, (self.bounds.size.width / 2), self.bounds.size.height);
    rightGradient.colors = [NSArray arrayWithObjects:(id)[darkBlueGreenAlt CGColor], (id)[lightBlueGreenAlt CGColor], nil];
    [self.layer insertSublayer:rightGradient atIndex:1];
    
    CAShapeLayer *line = [CAShapeLayer layer];
    line.strokeColor = [[UIColor whiteColor] CGColor];
    line.lineWidth = 1.0;
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, nil, 540, 100);
    CGPathAddLineToPoint(path, nil, 300, 100);
    line.path = path;
    [self.layer addSublayer:line];
    
    self.TLCLicenseFront.image = [UIImage imageNamed:@"license_1.png"];
    self.TLCLicenseBack.image = [UIImage imageNamed:@"license_2.png"];
    
    _billOfRightsArray = @[@"Ride in a car that is clean, in good condition, and has passed off all required inspections",
                           @"Be driven by a TLC-licensed driver in good standing whose license is clearly displayed",
                           @"A safe and courteous driver who obeys all traffic laws",
                           @"A quiet trip, free of horn honking and audio/radio",
                           @"Receive a fare quote from the dispatcher and pay that amount for your ride (unless the tip changes)",
                           @"A driver who does not use a cell phone while driving (hands-free phones are not permitted)",
                           @"A smoke and scent free ride",
                           @"Air conditioning or heat on request",
                           @"Working seatbelts for all passengers. Please use them!",
                           @"Not share a ride, unless you want to",
                           @"Be accompanied by a service animal"];
    
    float space = 150.0;
    int numbers = 1;
    for (NSString *right in _billOfRightsArray) {
        CAShapeLayer *circle = [CAShapeLayer layer];
        circle.name = @"circleLayer";
        circle.bounds = CGRectMake(0, 0, 20, 20);
        circle.position = CGPointMake(20, space);
        circle.fillColor = [circleColor CGColor];
        circle.strokeColor = [circleColor CGColor];
        circle.lineWidth = 1.0;
        CGMutablePathRef path = CGPathCreateMutable();
        CGPathAddEllipseInRect(path, nil, circle.bounds);
        circle.path = path;
        [self.layer addSublayer:circle];
        
        CABasicAnimation *fadeIn = [CABasicAnimation animationWithKeyPath:@"opacity"];
        fadeIn.duration = 1.0;
        fadeIn.fromValue = @0;
        circle.opacity = 1.0;
        [circle addAnimation:fadeIn forKey:@"fade in slowly"];
        
        CATextLayer *numberText = [CATextLayer layer];
        numberText.string = [NSString stringWithFormat:@"%i", numbers];
        numberText.alignmentMode = @"center";
        numberText.fontSize = 13.0;
        numberText.font = (__bridge CFTypeRef)(@"Helvetica");
        numberText.foregroundColor = [darkBlueGreenAlt CGColor];
        numberText.bounds = CGRectMake(0, 0, 20, 16);
        numberText.position = circle.position;
        [self.layer addSublayer:numberText];
        numbers++;
        
        CATextLayer *rights = [CATextLayer layer];
        rights.string = right;
        rights.alignmentMode = @"left";
        rights.fontSize = 10.0;
        rights.wrapped = YES;
        rights.foregroundColor = [[UIColor whiteColor] CGColor];
        rights.bounds = CGRectMake(0, 0, 260, 40);
        rights.position = CGPointMake(170, space + 10);
        [self.layer addSublayer:rights];
        space += 30.0;
//        [right drawInRect:CGRectMake(0, space, 250, 500) withAttributes:nil];
    }
}


@end
