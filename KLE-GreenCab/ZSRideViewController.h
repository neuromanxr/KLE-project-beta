//
//  ZSRideViewController.h
//  Zuse
//
//  Created by Kelvin Lee on 12/1/14.
//
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface ZSRideViewController : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate>

@property (strong, nonatomic) IBOutlet UIButton *cancelButton;
@property (strong, nonatomic) IBOutlet UIButton *paymentButton;
@property (strong, nonatomic) IBOutlet MKMapView *mapView;
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) IBOutlet UIButton *tripButton;
@property (strong, nonatomic) IBOutlet UIButton *billOfRights;

@end
