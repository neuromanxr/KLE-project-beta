//
//  ZSRideViewController.m
//  Zuse
//
//  Created by Kelvin Lee on 12/1/14.
//
//
#import "Utility.h"
#import "UIImage+ImageEffects.h"

#import "AppDelegate.h"
#import "MCPanelViewController.h"
#import "ZSBillOfRightsViewController.h"
#import "ZSRideViewController.h"
#import "ZSPaymentViewController.h"
#import "ZSTripViewController.h"
#import "ZSMapAnnotation.h"

#define spanX 0.15
#define spanY 0.15
#define longMeters 1200
#define latMeters 1200

@interface ZSRideViewController ()

@end

@implementation ZSRideViewController

- (IBAction)refreshUserLocation:(id)sender
{
    [self startStandardUpdates];
    [self.locationManager stopUpdatingLocation];
}

- (void)startStandardUpdates
{
    if (self.locationManager == nil) {
        self.locationManager = [[CLLocationManager alloc] init];
    }
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyKilometer;
//    self.locationManager.distanceFilter = 500;
    if ([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [self.locationManager requestWhenInUseAuthorization];
    }
    [self.locationManager startUpdatingLocation];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.cancelButton addTarget:self action:@selector(cancel) forControlEvents:UIControlEventTouchUpInside];
    [self.paymentButton addTarget:self action:@selector(showPaymentView) forControlEvents:UIControlEventTouchUpInside];
    [self.tripButton addTarget:self action:@selector(showTripView) forControlEvents:UIControlEventTouchUpInside];
    [self.billOfRights addTarget:self action:@selector(showBORView) forControlEvents:UIControlEventTouchUpInside];
    
//    [self startStandardUpdates];
    self.mapView.delegate = self;
    self.mapView.showsUserLocation = YES;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getDestination) name:@"Destination" object:nil];
    
    [NSTimer scheduledTimerWithTimeInterval:4 target:self selector:@selector(postDestinationInAppDelegate) userInfo:nil repeats:NO];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    NSLog(@"Location updated %@", [locations lastObject]);
    
//    MKCoordinateRegion region = MKCoordinateRegionMake(CLLocationCoordinate2DMake(self.mapView.userLocation.coordinate.latitude, self.mapView.userLocation.coordinate.longitude), MKCoordinateSpanMake(spanX, spanY));
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(self.mapView.userLocation.coordinate, latMeters, longMeters);
    [self.mapView setRegion:[self.mapView regionThatFits:region] animated:YES];
    
    ZSMapAnnotation *destination = [self getDestinationPoint:self.mapView.userLocation.coordinate destinationTitle:@"Where am I" destinationAddress:@"Somewhere"];
    
    [self.mapView addAnnotation:destination];
}

- (void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated
{
    
}

- (void)getDestination
{
    NSLog(@"## GOT A DESTINATION");
}

- (ZSMapAnnotation *)getDestinationPoint:(CLLocationCoordinate2D)coordinate destinationTitle:(NSString *)title destinationAddress:(NSString *)address
{
    ZSMapAnnotation *destinationPoint = [[ZSMapAnnotation alloc] initWithName:title address:address coordinate:coordinate];
    
    return destinationPoint;
}

- (void)postDestinationInAppDelegate
{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    if ([appDelegate respondsToSelector:@selector(didReceiveDestination)]) {
        [appDelegate didReceiveDestination];
        [[NSNotificationCenter defaultCenter] removeObserver:self];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// not used
//- (void)updateBlur
//{
//    UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, YES, 1.0);
////    UIGraphicsBeginImageContext(self.view.bounds.size);
//    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
////    viewImage = [viewImage applyLightEffect];
//    UIGraphicsEndImageContext();
//}

- (void)cancel
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)showBORView
{
    ZSBillOfRightsViewController *billOfRightsViewController = [[ZSBillOfRightsViewController alloc] init];
    if (billOfRightsViewController) {
        [billOfRightsViewController setModalPresentationStyle:UIModalPresentationFormSheet];
        [billOfRightsViewController setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
        
        [self presentViewController:billOfRightsViewController animated:YES completion:nil];
    }
}

- (void)showTripView
{
    ZSTripViewController *tripView = [[ZSTripViewController alloc] init];
    MCPanelViewController *panelController = [[MCPanelViewController alloc] initWithRootViewController:tripView];
    tripView.preferredContentSize = CGSizeMake(260, 0);
    
    panelController.masking = NO;
    panelController.tintColor = LIGHTBLUEGREEN;
    panelController.backgroundStyle = MCPanelBackgroundStyleTinted;
    [panelController presentInViewController:self withDirection:MCPanelAnimationDirectionRight];
}

- (void)showPaymentView
{
    ZSPaymentViewController *paymentViewController = [[ZSPaymentViewController alloc] init];
    MCPanelViewController *panelController = [[MCPanelViewController alloc] initWithRootViewController:paymentViewController];
    paymentViewController.preferredContentSize = CGSizeMake(540, 0);
    panelController.masking = NO;
    panelController.tintColor = LIGHTBLUEGREEN;
    panelController.backgroundStyle = MCPanelBackgroundStyleTinted;
    [panelController presentInViewController:self withDirection:MCPanelAnimationDirectionLeft];
    
//    if (paymentViewController) {
//        [paymentViewController setModalPresentationStyle:UIModalPresentationOverCurrentContext];
//        [paymentViewController setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
    
//        UIGraphicsBeginImageContext(self.view.bounds.size);
//        CGContextRef c = UIGraphicsGetCurrentContext();
//        CGContextTranslateCTM(c, 0, 0);
//        [self.view.layer renderInContext:c];
//        UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
//        viewImage = [viewImage applyLightEffect];
//        UIGraphicsEndImageContext();
//        [self updateBlur];
    
//        [self presentViewController:paymentViewController animated:YES completion:nil];
//    }
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
