//
//  AwayDaySecondViewController.h
//  MyAwayDay
//
//  Created by 汉 秦 on 7/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface AwayDayLocationsViewController : UIViewController
{
    MKMapView *mapView;
}

@property (nonatomic, retain) IBOutlet MKMapView *mapView;
@end
