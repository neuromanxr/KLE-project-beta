//
//  ZSTipsControl.m
//  KLE-GreenCab
//
//  Created by Kelvin Lee on 12/24/14.
//  Copyright (c) 2014 Kelvin. All rights reserved.
//

#import "ZSTipsControl.h"
#import "ZSTipButton.h"
#import "UIView+Subviews.h"

@interface ZSTipsControl () <UITextFieldDelegate>

@property (nonatomic, strong) ZSTipButton *tipButton;
@property (nonatomic, strong) NSArray *tipNumbers;

@end

@implementation ZSTipsControl

#pragma mark Initialization

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.tipNumbers = @[@"None",
                            @"10%",
                            @"15%",
                            @"20%",
                            @"30%",
                            @"Other"];
        [self setupView];
    }
    return self;
}

#pragma mark Drawing

- (void)drawRect:(CGRect)rect
{
//    [self setupView];

}

- (void)setupView
{
    // Make the view with rounded corners by using mask layer
    UIBezierPath *roundedRect = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(self.bounds.origin.x, self.bounds.origin.y, self.bounds.size.width, self.bounds.size.height) cornerRadius:12.0];
    CAShapeLayer *mask = [CAShapeLayer layer];
    mask.path = roundedRect.CGPath;
    self.layer.mask = mask;
    
    NSInteger buttonXPosition = -1;
    NSInteger buttonYPosition = -1;
    for (int i = 0; i < 6; i++) {
        if (i == 2) {
            buttonYPosition += 72;
            self.tipButton = [[ZSTipButton alloc] initWithFrame:CGRectMake(-1, buttonYPosition, 100, 70)];
            self.tipButton.tag = i;
            self.tipButton.tipAmountLabel.text = self.tipNumbers[i];
            [self addSubview:self.tipButton];
            buttonXPosition = -1;
        }
        else if (i == 4) {
            buttonYPosition += 72;
            self.tipButton = [[ZSTipButton alloc] initWithFrame:CGRectMake(-1, buttonYPosition, 100, 70)];
            self.tipButton.tag = i;
            self.tipButton.tipAmountLabel.text = self.tipNumbers[i];
            [self addSubview:self.tipButton];
            buttonXPosition = -1;
        } else {
            self.tipButton = [[ZSTipButton alloc] initWithFrame:CGRectMake(buttonXPosition, buttonYPosition, 100, 70)];
            self.tipButton.tag = i;
            self.tipButton.tipAmountLabel.text = self.tipNumbers[i];
            [self addSubview:self.tipButton];
        }
        buttonXPosition += 102;
        [self.tipButton addTarget:self action:@selector(updateTipValue:) forControlEvents:UIControlEventTouchUpInside];
        
//        NSLog(@"##TIP BUTTON bounds %@", NSStringFromCGRect(self.tipButton.bounds));
//        NSLog(@"##TIP BUTTON TAG %lu", self.tipButton.tag);
//        NSLog(@"##TIP AMOUNTS %@", self.tipNumbers);
    }
    NSLog(@"SUBVIEWS %@ AND COUNT %lu", [self subviews], [[self subviews] count]);
}

#pragma mark Touch Handling

- (ZSTipButton*)tipButtonForPoint:(CGPoint)point {
    for (int i = 0; i < 6; i++) {
        if (CGRectContainsPoint([self subViewWithTag:i].frame, point)) {
            NSLog(@"SUBVIEW %@", [self subViewWithTag:i]);
            return (ZSTipButton*)[self subViewWithTag:i];
        }
    }
    return nil;
}

- (void)updateTipValue:(ZSTipButton *)selectedTipButton
{
    self.selectedTipValue = selectedTipButton.tipAmountLabel.text;
    NSLog(@"TIP VALUE %@", self.selectedTipValue);
}

- (void)updateTipButtonState
{
    // clears out highlighted status for all buttons
    for (int i = 0; i < 6; i++) {
        ZSTipButton *tipButton = (ZSTipButton *)[self subViewWithTag:i];
        if (tipButton.state == UIControlStateHighlighted) {
            [tipButton setHighlighted:NO];
            [tipButton setNeedsDisplay];
            [UIView animateWithDuration:0.2f animations:^{
                tipButton.transform = CGAffineTransformIdentity;
            }];
            if (tipButton.tag == 5 && self.textField) {
                [UIView animateWithDuration:0.2f animations:^{
                    self.textField.frame = CGRectMake(100, 180, 0, 25);
                } completion:^(BOOL finished) {
                    self.textField = nil;
                }];
            }
            NSLog(@"TIP BUTTON STATE %lu", tipButton.state);
        }
    }
}

- (void)showTextField
{
    if (!self.textField) {
        self.textField = [[UITextField alloc] initWithFrame:CGRectMake(100, 180, 0, 25)];
        self.textField.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.textField];
        [UIView animateWithDuration:0.3f animations:^{
            self.textField.frame = CGRectMake(100, 180, 75, 25);
        } completion:^(BOOL finished) {
            self.textField.delegate = self;
        }];
    }
}

- (BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
    CGPoint point = [touch locationInView:self];
    NSLog(@"CGPOINT %@", NSStringFromCGPoint(point));
//    [self sendActionsForControlEvents:UIControlEventTouchUpInside];
    
    ZSTipButton *pressedButton = [self tipButtonForPoint:point];
    [pressedButton sendActionsForControlEvents:UIControlEventTouchUpInside];
    
    [self updateTipButtonState];
    
    if (pressedButton.state != UIControlStateHighlighted) {
        [pressedButton setHighlighted:YES];
        [UIView animateWithDuration:0.2f animations:^{
            pressedButton.transform = CGAffineTransformMakeScale(1.04f, 1.04f);
        }];
        if (pressedButton.highlighted) {
            [pressedButton setNeedsDisplay];
            if (pressedButton.tag == 5) {
                [self showTextField];
            }
        }
    }
    NSLog(@"IS HIGHLIGHTED %lu", pressedButton.state);
    
    NSLog(@"PRESSED BUTTON %lu", pressedButton.tag);

    return YES;
}

- (BOOL)continueTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
    [super continueTrackingWithTouch:touch withEvent:event];
    
    return YES;
}

- (void)endTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
    [super endTrackingWithTouch:touch withEvent:event];
}

- (void)cancelTrackingWithEvent:(UIEvent *)event {
    [super cancelTrackingWithEvent:event];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    NSLog(@"BEGAN EDITING");
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.textField resignFirstResponder];
    return YES;
}

@end