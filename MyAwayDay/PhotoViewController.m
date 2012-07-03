#import "PhotoViewController.h"
#import "PhotoSet.h"

@implementation PhotoViewController
@synthesize photoSet = _photoSet;

- (id)init
{
    self = [super init];
    if (self) {
        self.title = NSLocalizedString(@"Photos", @"Photos");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
    }
    return self;
}

- (void) viewDidLoad {
    self.photoSource = [PhotoSet samplePhotoSet];
}

- (void) dealloc {
    self.photoSet = nil;    
    [super dealloc];
}

@end