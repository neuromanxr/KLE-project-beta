//
//  ZSPaymentViewController.m
//  KLE-GreenCab
//
//  Created by Kelvin Lee on 12/22/14.
//  Copyright (c) 2014 Kelvin. All rights reserved.
//
#import "MCPanelViewController.h"
#import "ZSPayButton.h"
#import "ZSTipsControl.h"
#import "ZSStarRatingView.h"
#import "ZSStarRatingControl.h"
#import "ZSPaymentViewController.h"

@interface ZSPaymentViewController () <ZSStarRatingDelegate, ZSTipsDelegate>

@property (strong, nonatomic) ZSStarRatingControl *ratingControl;
@property (strong, nonatomic) IBOutlet UILabel *rateLabel;
@property (strong, nonatomic) IBOutlet ZSTipsControl *tipsControl;
@property (strong, nonatomic) IBOutlet ZSPayButton *payButton;

@end

@implementation ZSPaymentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.payButton addTarget:self action:@selector(dismissPaymentView) forControlEvents:UIControlEventTouchUpInside];
    
    self.ratingControl = [[ZSStarRatingControl alloc] initWithFrame:CGRectMake(0, 370, 180, 50) andStars:5 isFractional:NO];
    self.ratingControl.rating = 0.0;
    [self.view addSubview:self.ratingControl];
    
    self.ratingControl.delegate = self;
    self.tipsControl.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tipAdded:(ZSTipsControl *)control with:(NSString *)amount
{
    // delegate method
    NSLog(@"DELEGATE TIP VALUE %@", amount);
    self.tipAmount.text = amount;
}

- (void)dismissPaymentView
{
    [self.panelViewController dismiss];
//    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)newRating:(ZSStarRatingControl *)control :(float)rating
{
    NSLog(@"NEW RATING");
    self.rateLabel.text = [NSString stringWithFormat:@"Rating: %f", rating];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
