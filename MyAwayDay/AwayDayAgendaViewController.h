//
//  AwayDayFirstViewController.h
//  MyAwayDay
//
//  Created by 汉 秦 on 7/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/ADBannerView.h>

@interface AwayDayAgendaViewController : UIViewController<ADBannerViewDelegate>
{
    UIWebView *webView;
    id adBannerView;
    BOOL isAdBannerViewVisible;
}

@property (nonatomic, retain) IBOutlet UIWebView *webView;
@property (nonatomic, retain) id adBannerView;
@property (nonatomic) BOOL isAdBannerViewVisible;
@end
