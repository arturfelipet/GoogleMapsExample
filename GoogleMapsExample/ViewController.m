//
//  ViewController.m
//  GoogleMapsExample
//
//  Created by Chleba Agencia Digital on 12/13/12.
//  Copyright (c) 2012 Google Maps Example. All rights reserved.
//

#import "ViewController.h"
#import <GoogleMaps/GoogleMaps.h>

@implementation ViewController {
    GMSMapView *mapView_;
}

// You don't need to modify the default initWithNibName:bundle: method.

- (void)loadView {
    GMSCamera camera = GMSCameraMake(-33.8683, 151.2086, 6);
    mapView_ = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    mapView_.delegate = self;
    mapView_.myLocationEnabled = YES;
    
    // Map Types Available
    mapView_.mapType = kGMSTypeNormal;
//    mapView_.mapType = kGMSTypeHybrid;
//    mapView_.mapType = kGMSTypeSatellite;
//    mapView_.mapType = kGMSTypeTerrain;
    self.view = mapView_;
    
    
    // How to Add Markers
    GMSMarkerOptions *options = [[GMSMarkerOptions alloc] init];
    options.position = CLLocationCoordinate2DMake(-33.8683, 151.2086);
    options.title = @"Sydney";
    options.snippet = @"Australia"; //Description in Info Window
//    options.infoWindowAnchor = CGPointMake(0.5, 0.5); //Center Location Info Window
//    options.icon = [UIImage imageNamed:@"house"]; //Alter Marker Icon
    id<GMSMarker> myMarker = [mapView_ addMarkerWithOptions:options];
//    [myMarker remove];
    
    
    
    
    // How to Draw Lines
    GMSPolylineOptions *rectangle;
    
    rectangle = [GMSPolylineOptions options];
    [rectangle addVertex:CLLocationCoordinate2DMake(37.35, -122.0)];
    [rectangle addVertex:CLLocationCoordinate2DMake(37.45, -122.0)];
    [rectangle addVertex:CLLocationCoordinate2DMake(37.45, -122.2)];
    [rectangle addVertex:CLLocationCoordinate2DMake(37.35, -122.2)];
    [rectangle addVertex:CLLocationCoordinate2DMake(37.35, -122.0)];
    
    rectangle.color = [UIColor greenColor];
    rectangle.width = 10.f;
    
    id<GMSPolyline> myLine = [mapView_ addPolylineWithOptions:rectangle];
//    [myLine remove];
    
    
    
    // Change Camera Angle Animated
    [mapView_ animateToViewingAngle:45];
    // Change Location Animated
    [mapView_ animateToLocation:CLLocationCoordinate2DMake(-33.868, 151.208)];
    // Change Location Without Animation
    [mapView_ setCamera:GMSCameraMake(-33.8683, 151.2086, 6)];
    // Zoom
    [mapView_ animateToZoom:12];
    // Bearing (orientation)
    [mapView_ animateToBearing:0];
    
    
    
    
    
    UILongPressGestureRecognizer *lpgr = [[UILongPressGestureRecognizer alloc]
                                          initWithTarget:self action:@selector(handleLongPress:)];
    lpgr.minimumPressDuration = 2.0; //user needs to press for 2 seconds
    [mapView_ addGestureRecognizer:lpgr];
    
    
    
    
    // URL Schema
    // mapmode: standard or streetview
    // center: latitude,longitude.
    // zoom: Number
    // views: satellite, traffic, or transit
    // q: search term
    
    
//    [[UIApplication sharedApplication] canOpenURL:
//     [NSURL URLWithString:@"comgooglemaps://?center=37.788463,-122.392545&zoom=12&views=traffic"]];
//    
//    [[UIApplication sharedApplication] canOpenURL:
//     [NSURL URLWithString:@"comgooglemaps://?center=46.414382,10.013988&mapmode=streetview"]];
//    
//    [[UIApplication sharedApplication] canOpenURL:
//     [NSURL URLWithString:@"comgooglemaps://?q=Steamers+Lane+Santa+Cruz,+CA&center=37.782652,-122.410126&views=satellite,traffic&zoom=15"]];
    
}

- (void)handleLongPress:(UIGestureRecognizer *)gestureRecognizer
{
//    if (gestureRecognizer.state != UIGestureRecognizerStateBegan)
//        return;
//    
//    CGPoint touchPoint = [gestureRecognizer locationInView:mapView_];
//    CLLocationCoordinate2D touchMapCoordinate =
//    [mapView_ convertPoint:touchPoint toCoordinateFromView:mapView_];
//    
//    YourMKAnnotationClass *annot = [[YourMKAnnotationClass alloc] init];
//    annot.coordinate = touchMapCoordinate;
//    [self.mapView addAnnotation:annot];
//    [annot release];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [mapView_ startRendering];
}

- (void)viewWillDisappear:(BOOL)animated {
    [mapView_ stopRendering];
    [super viewDidDisappear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - GMSMapViewDelegate

- (void)mapView:(GMSMapView *)mapView
didTapAtCoordinate:(CLLocationCoordinate2D)coordinate {
    NSLog(@"You tapped at %f,%f", coordinate.latitude, coordinate.longitude);
}

@end
