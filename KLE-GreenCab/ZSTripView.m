//
//  ZSTripView.m
//  KLE-GreenCab
//
//  Created by Kelvin Lee on 1/4/15.
//  Copyright (c) 2015 Kelvin. All rights reserved.
//

#import "ZSTripView.h"

@implementation ZSTripView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    // lines
    CAShapeLayer *line = [CAShapeLayer layer];
    line.strokeColor = [[UIColor whiteColor] CGColor];
    line.lineWidth = 1.0;
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, nil, 540, 110);
    CGPathAddLineToPoint(path, nil, 10, 110);
    CGPathMoveToPoint(path, nil, 540, 540);
    CGPathAddLineToPoint(path, nil, 10, 540);
    line.path = path;
    [self.layer addSublayer:line];
}


@end
