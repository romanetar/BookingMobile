//
//  Vehicle.h
//  BookingMobile
//
//  Created by Roman AG on 06/07/13.
//  Copyright (c) 2013 Digital File. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface Vehicle : NSObject

@property (nonatomic,retain) NSString *LicencePlate;

@property (nonatomic,assign) CLLocationCoordinate2D *Location;

@end
