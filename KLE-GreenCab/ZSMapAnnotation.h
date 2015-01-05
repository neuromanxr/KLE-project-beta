//
//  ZSMapAnnotation.h
//  Zuse
//
//  Created by Denny Kwon on 1/20/14.
//
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface ZSMapAnnotation : NSObject <MKAnnotation>


@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *address;
@property (nonatomic, assign) CLLocationCoordinate2D theCoordinate;
- (id)initWithName:(NSString *)n address:(NSString *)a coordinate:(CLLocationCoordinate2D)c;
- (MKMapItem *)mapItem;
@end
