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

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Agenda", @"Agenda");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
    }
    return self;
}
							
- (void)viewDidLoad
{
    NSString* urlString = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html" inDirectory:@"assets/agenda"];

    
    NSURL *url = [NSURL fileURLWithPath:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
