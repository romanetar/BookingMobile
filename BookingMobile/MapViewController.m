//
//  MapViewController.m
//  MAT1
//
//  Created by Roman AG on 30/06/13.
//  Copyright (c) 2013 Roman AG. All rights reserved.
//

#import "MapViewController.h"
#import "UIConfig.h"
#import "VehiclesManager.h"
#import "Vehicle.h"

@interface MapViewController ()

@end

#define DEFAULT_LATITUDE -34.634356
#define DEFAULT_LONGITUDE -58.399461
#define DEFAULT_SPAN 0.01f

@implementation MapViewController

@synthesize mapView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    UIConfig *uiConfig = [[UIConfig alloc] init];
    
    [uiConfig setUpButtonBackground:self.btBook];
    
    mapView.delegate = self;
    
    MKCoordinateRegion region;
    region.center.latitude = DEFAULT_LATITUDE;
    region.center.longitude = DEFAULT_LONGITUDE;
    region.span.latitudeDelta = DEFAULT_SPAN;
    region.span.longitudeDelta = DEFAULT_SPAN;
    
    [mapView setRegion:region animated:YES];
    [mapView regionThatFits:region];
    
    CLLocationCoordinate2D markerLocation = CLLocationCoordinate2DMake(region.center.latitude, region.center.longitude);
    MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
    [annotation setCoordinate:markerLocation];
    [annotation setTitle:@"Taxi"];
    [annotation setSubtitle:@"Este es su taxi"];
    [mapView addAnnotation:annotation];
    
    self.txtAddress.text = @"Localizando...";
    
    self.locationManager.delegate = self;
    [self.locationManager startUpdatingLocation];
    
    
    UIPanGestureRecognizer* panRec = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(didDragMap:)];
    [panRec setDelegate:self];
    [self.mapView addGestureRecognizer:panRec];
}

-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    MKPinAnnotationView *pinView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"current"];
    
    pinView.canShowCallout = YES;
    
    //UIImageView *pinImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"map-marker.png"]];
    
    return pinView;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)locationManager:(CLLocationManager *)manager
   didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    [manager stopUpdatingLocation];
    
    /*
    NSLog(@"%f", newLocation.coordinate.latitude);
    
    CLGeocoder * geoCoder = [[CLGeocoder alloc] init];
    [geoCoder reverseGeocodeLocation:newLocation completionHandler:^(NSArray *placemarks, NSError *error) {
        for (CLPlacemark * placemark in placemarks) {
            NSLog(@"%@", [placemark locality]);
        }
    }];
     */
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer
    shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}

- (void)didDragMap:(UIGestureRecognizer*)gestureRecognizer
{
    if (gestureRecognizer.state == UIGestureRecognizerStateEnded)
    {
        CLGeocoder * geoCoder = [[CLGeocoder alloc] init];

        CLLocationCoordinate2D center = [self.mapView centerCoordinate];
        
        CLLocation *centerLocation = [[CLLocation alloc]initWithLatitude:center.latitude longitude:center.longitude];
        
        [geoCoder reverseGeocodeLocation:centerLocation
                       completionHandler:^(NSArray *placemarks, NSError *error) {
                           
                           if (error) {
                               NSLog(@"Geocode failed with error: %@", error);
                               return;
                           }
                           
                           if (placemarks && placemarks.count > 0)
                           {
                               CLPlacemark *placemark = placemarks[0];
                               
                               NSDictionary *addressDictionary = placemark.addressDictionary;
                               
                               //NSLog(@"%@ ", addressDictionary);
                               NSString *address = [addressDictionary objectForKey:@"Name"];
                               self.txtAddress.text = address;
                           }
                           
                       }];

    }
}

- (IBAction)btBookClick:(id)sender {
    
    //[self.imgMarker setHidden:YES];
    
}


@end
