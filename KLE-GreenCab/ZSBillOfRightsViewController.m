//
//  ZSBillOfRightsViewController.m
//  KLE-GreenCab
//
//  Created by Kelvin Lee on 12/17/14.
//  Copyright (c) 2014 Kelvin. All rights reserved.
//

#import "ZSExploreButton.h"
#import "ZSBillOfRightsView.h"
#import "ZSBillOfRightsViewController.h"

@interface ZSBillOfRightsViewController ()

@property (strong, nonatomic) IBOutlet ZSExploreButton *exploreButton;
@end

@implementation ZSBillOfRightsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.exploreButton addTarget:self action:@selector(explore) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)explore
{
    [self dismissViewControllerAnimated:YES completion:nil];
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
