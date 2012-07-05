//
//  AwayDayFirstViewController.m
//  MyAwayDay
//
//  Created by 汉 秦 on 7/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AwayDayAgendaViewController.h"

@interface AwayDayAgendaViewController ()

@end

@implementation AwayDayAgendaViewController
@synthesize webView;
@synthesize adBannerView;
@synthesize isAdBannerViewVisible;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Agenda", @"Agenda");
        self.tabBarItem.image = [UIImage imageNamed:@"Android"];
    }
    return self;
}
							
- (void)viewDidLoad
{
    NSString* urlString = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html" inDirectory:@"assets/agenda"];

    NSURL *url = [NSURL fileURLWithPath:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
    [self createAdBannerView];
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    [webView release];
    self.webView = nil;
    [adBannerView release];
    self.adBannerView = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [self fixupAdView:[UIDevice currentDevice].orientation];
}

- (void)bannerViewDidLoadAd:(ADBannerView *)banner
{
    if (!isAdBannerViewVisible)
    {
        isAdBannerViewVisible = YES;
        [self fixupAdView:[UIDevice currentDevice].orientation];
    }
}

- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error
{
    if (isAdBannerViewVisible)
    {
        isAdBannerViewVisible = NO;
        [self fixupAdView:[UIDevice currentDevice].orientation];
    }
}

- (void)createAdBannerView
{
    Class clazz = NSClassFromString(@"ADBannerView");
    if (clazz != nil) 
    {
        self.adBannerView = [[[clazz alloc] initWithFrame:CGRectZero] autorelease];
        [adBannerView setRequiredContentSizeIdentifiers:[NSSet setWithObject:ADBannerContentSizeIdentifierPortrait]];
        [adBannerView setCurrentContentSizeIdentifier:ADBannerContentSizeIdentifierPortrait];
        [adBannerView setFrame:CGRectOffset([adBannerView frame], 0, -[self getAdBannerViewHeight])];
        [adBannerView setDelegate:self];
        [self.view addSubview:adBannerView];
    }
}

- (NSInteger) getAdBannerViewHeight
{
    return 50;
}

- (void)fixupAdView: (UIInterfaceOrientation)toInterfaceOrientation 
{
    if (adBannerView != nil)
    {
        [UIView beginAnimations:@"fixupViews" context:nil];
        if (isAdBannerViewVisible)
        {
            CGRect adBannerViewFrame = [adBannerView frame];
            adBannerViewFrame.origin.x = 0;
            adBannerViewFrame.origin.y = 0;
            [adBannerView setFrame:adBannerViewFrame];
            
            CGRect webViewFrame = [webView frame];
            webViewFrame.origin.y = [self getAdBannerViewHeight];
            webViewFrame.size.height = self.view.frame.size.height - [self getAdBannerViewHeight];
            [webView setFrame:webViewFrame];
        } else {
            CGRect adBannerViewFrame = [adBannerView frame];
            adBannerViewFrame.origin.x = 0;
            adBannerViewFrame.origin.y = - [self getAdBannerViewHeight];
            [adBannerView setFrame:adBannerViewFrame];
            
            CGRect webViewFrame = [webView frame];
            webViewFrame.origin.y = 0;
            webViewFrame.size.height = self.view.frame.size.height;
            [webView setFrame:webViewFrame];            
        }
        [UIView commitAnimations];
    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
