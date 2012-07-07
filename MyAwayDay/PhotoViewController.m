#import "PhotoViewController.h"
#import "PhotoSet.h"

@implementation PhotoViewController
@synthesize photoSet = _photoSet;

- (id)init
{
    self = [super init];
    if (self) {
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