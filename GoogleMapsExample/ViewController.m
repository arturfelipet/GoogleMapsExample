//
//  ViewController.m
//  GoogleMapsExample
//
//  Created by Artur Felipe on 12/13/12.
//  Copyright (c) 2012 Google Maps Example. All rights reserved.
//

#import "ViewController.h"
#import <GoogleMaps/GoogleMaps.h>

@implementation ViewController {
    GMSMapView *mapView_;
}

// You don't need to modify the default initWithNibName:bundle: method.

- (void)loadView {
	
	GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:-33.8683 longitude:151.2086 zoom:6];
	
    mapView_ = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    [mapView_ setDelegate:self];
    [mapView_ setMyLocationEnabled:YES];
    
    // Map Types Available
    mapView_.mapType = kGMSTypeNormal;
//    mapView_.mapType = kGMSTypeHybrid;
//    mapView_.mapType = kGMSTypeSatellite;
//    mapView_.mapType = kGMSTypeTerrain;
    self.view = mapView_;
    
    
    // How to Add Markers
    GMSMarker *marker = [[GMSMarker alloc] init];
    [marker setPosition:CLLocationCoordinate2DMake(-33.8683, 151.2086)];
    [marker setTitle:@"Sydney"];
    [marker setSnippet:@"Australia"]; //Description in Info Window

	[marker setMap:mapView_];
    
    // Change Camera Angle Animated
    [mapView_ animateToViewingAngle:45];
    // Change Location Animated
    [mapView_ animateToLocation:CLLocationCoordinate2DMake(-33.868, 151.208)];
    // Change Location Without Animation
    [mapView_ setCamera:[GMSCameraPosition cameraWithLatitude:-33.8683 longitude:151.2086 zoom:6]];
    // Zoom
    [mapView_ animateToZoom:12];
    // Bearing (orientation)
    [mapView_ animateToBearing:0];
    
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
