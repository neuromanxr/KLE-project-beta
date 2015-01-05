//
//  ZSMapAnnotation.m
//  Zuse
//
//  Created by Denny Kwon on 1/20/14.
//
//

#import "ZSMapAnnotation.h"

@implementation ZSMapAnnotation
@synthesize name;
@synthesize address;
@synthesize theCoordinate;


- (id)initWithName:(NSString*)n address:(NSString*)a coordinate:(CLLocationCoordinate2D)c
{
    
    if ((self = [super init])) {
        self.name = n;
        self.address = a;
        self.theCoordinate = c;
    }
    return self;
}

- (NSString *)title
{
    return self.name;
}

- (NSString *)subtitle {
    
    return self.address;
}

- (CLLocationCoordinate2D)coordinate
{
    return self.theCoordinate;
}

- (MKMapItem *)mapItem
{
    
//    MKPlacemark *placemark = [[MKPlacemark alloc]
//                              initWithCoordinate:self.coordinate
//                              addressDictionary:addressDict];
    
    MKPlacemark *placemark = [[MKPlacemark alloc] initWithCoordinate:self.theCoordinate addressDictionary:@{@"key":self.address}];
    MKMapItem *mapItem = [[MKMapItem alloc] initWithPlacemark:placemark];
    mapItem.name = self.title;
    return mapItem;
}


@end
