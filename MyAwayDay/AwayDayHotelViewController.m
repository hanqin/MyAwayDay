//
//  AwayDayHotelViewControllerViewController.m
//  MyAwayDay
//
//  Created by 汉 秦 on 7/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AwayDayHotelViewController.h"

@interface AwayDayHotelViewController ()

@end

@implementation AwayDayHotelViewController
@synthesize photoViewer;
@synthesize textView;

- (id)init
{
    self = [super init];
    if (self) {
        self.title = NSLocalizedString(@"Hotel", @"Hotel");
        self.tabBarItem.image = [UIImage imageNamed:@"Apple"];
    }
    return self;
}

- (void)viewDidLoad
{
    [self.view setBackgroundColor:[UIColor blackColor]];
    
    photoViewer = [[PhotoViewController alloc] init];
    
    UIView *imageGallery = photoViewer.view;
    [imageGallery setFrame:CGRectMake(0, 0, 320, 240)];
    
    [imageGallery release];
        
    textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 241, 320, 170)];
    [textView setText:@"Your Desire, Ultimate Relaxation\n你的祈愿，极致休闲\n\n- 酒店概况\n青城（豪生）国际酒店坐落于世界文化遗产、国家5A风景区四川省都江堰市青城山风景区，毗邻青城前山山门，是青城山景区首家国际五星级酒店、由美国排名第一的温德姆酒店管理集团管理，曾多次出色完成国家领导人的接待任务。酒店地理位置优越，交通便捷，有多条高速公路和快速通道直达成都市区及双流国际机场。 酒店占地400余亩，建筑秉承青城山道家思想理念，环境优美。建筑气势恢弘，与古木参天、幽静秀美的青城山遥相呼应，装饰独具匠心，配套设施齐全，人性化服务细致入微，充分体现建筑与环境、产品与服务、人与自然的高度和谐统一。 远离城市喧嚣，和着鸟语蝉鸣，吸纳人间仙境飘来的习习新风，细细品味宁静致远、天人合一的超然境界，一切都从这里开始……\n\n- 地理位置\n位于素有“青城天下幽”美誉，世界文化遗产地、国家5A级风景区的青城山山脚。毗邻青城山游客服务中心、青城前山牌坊。交通便捷，环境优美，气候宜人，常年温度15.2℃，负氧离子丰富。是您商务会议、休闲度假、避暑养生的首选。"];
    [textView setEditable:NO];
    [textView setTextColor:[UIColor colorWithRed:243 green:119 blue:55 alpha:200]];
    [textView setBackgroundColor:[UIColor blackColor]];

    [self.view addSubview:imageGallery];    
    [self.view addSubview:textView];

    [photoViewer showBars: NO animated: NO];
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{    
    [self.photoViewer updateView];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    [self.photoViewer release];
    self.photoViewer = nil;
    [self.textView release];
    self.textView = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
