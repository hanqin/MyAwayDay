//
//  AwayDaySecondViewController.m
//  MyAwayDay
//
//  Created by 汉 秦 on 7/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AwayDayLocationsViewController.h"
#import "MapAnnotation.h"

@interface AwayDayLocationsViewController ()

@end

@implementation AwayDayLocationsViewController
@synthesize mapView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Locations", @"Locations");
        self.tabBarItem.image = [UIImage imageNamed:@"second"];
    }
    return self;
}
							
- (void)viewDidLoad
{
    [mapView setScrollEnabled:YES];
    [mapView setZoomEnabled:YES];
    [mapView setMapType:MKMapTypeHybrid];
    

    CLLocationCoordinate2D airport = { 30.581395, 103.967956 };
    CLLocationCoordinate2D mountain = { 30.904029, 103.600712 };
    CLLocationCoordinate2D hotel = { 30.900527, 103.606952 };    
    CLLocationCoordinate2D street = { 30.651026, 104.056386 };
    CLLocationCoordinate2D xiangZi = { 30.669257, 104.062419 };
    CLLocationCoordinate2D duFu = { 30.668105, 104.033851 };
    CLLocationCoordinate2D duJiangyan = { 31.039124, 103.637342 };
    CLLocationCoordinate2D panda = { 30.739446, 104.153553 };
    
    NSInteger len = 8;
    CLLocationCoordinate2D points[len];
    NSInteger i = 0;
    points[i++] = mountain;
    points[i++] = hotel;
    points[i++] = street;    
    points[i++] = xiangZi;    
    points[i++] = duFu;    
    points[i++] = duJiangyan;    
    points[i++] = panda;    
    points[i++] = airport;    
    
    CLLocationCoordinate2D coordinate;
    coordinate.latitude = 30.9;
    coordinate.longitude = 103.9003;
    mapView.region = MKCoordinateRegionMakeWithDistance(coordinate, 80000, 80000);
    
    for (NSInteger index = 0; index < len; index++) {
        MapAnnotation* annotation = [[MapAnnotation alloc] initWithCoordinate:points[index]];
        [mapView addAnnotation:annotation];
        [annotation release];
    }
    
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    [mapView release];
    self.mapView = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
