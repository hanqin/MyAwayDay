//
//  AwayDayHotelViewControllerViewController.h
//  MyAwayDay
//
//  Created by 汉 秦 on 7/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotoViewController.h"

@interface AwayDayHotelViewController : UIViewController
{
    PhotoViewController *photoViewer;
    UITextView *textView;
}

@property (nonatomic, retain) PhotoViewController *photoViewer;
@property (nonatomic, retain) UITextView* textView;
@end
