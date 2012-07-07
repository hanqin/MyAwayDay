#import "Photo.h"

@implementation Photo 

@synthesize caption;
@synthesize imageName;
@synthesize photoSource;
@synthesize index;
@synthesize size;

- (void) dealloc {
    self.caption = nil;
    self.imageName = nil;
    [super dealloc];
}

- (id)initWithImage:(NSString *)name caption:(NSString *)imageCaption size:(CGSize)imageSize
{
    self = [super init];
    if (self) 
    {
        self.imageName = name;
        self.caption = imageCaption;      
        self.size = imageSize;
        self.photoSource = nil;
        self.index = NSIntegerMax;
    }
    return self;
}

- (NSString *)URLForVersion:(TTPhotoVersion)version
{
    NSString *imageFullPath = [NSString stringWithFormat:@"bundle://assets/hotel/images/%@", imageName];
    
    return imageFullPath;
}

@end
