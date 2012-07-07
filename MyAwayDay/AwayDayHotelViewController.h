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
