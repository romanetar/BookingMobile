//
//  MapViewController.h
//  MAT1
//
//  Created by Roman AG on 30/06/13.
//  Copyright (c) 2013 Roman AG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface MapViewController : UIViewController<MKMapViewDelegate, UIGestureRecognizerDelegate, CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet UITextField *txtAddress;

@property (weak, nonatomic) IBOutlet UIImageView *imgMarker;

@property (weak, nonatomic) IBOutlet UIButton *btBook;

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@property (strong, nonatomic) IBOutlet CLLocationManager *locationManager;

- (IBAction)btBookClick:(id)sender;

@end
