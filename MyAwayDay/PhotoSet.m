#import "PhotoSet.h"
#import "Photo.h"

@implementation PhotoSet
@synthesize title = _title;
@synthesize photos = _photos;

- (id) initWithTitle:(NSString *)title photos:(NSArray *)photos {
    if ((self = [super init])) {
        self.title = title;
        self.photos = photos;
        for(int i = 0; i < _photos.count; ++i) {
            Photo *photo = [_photos objectAtIndex:i];
            photo.photoSource = self;
            photo.index = i;
        }        
    }
    return self;
}

- (void) dealloc {
    self.title = nil;
    self.photos = nil;    
    [super dealloc];
}

#pragma mark TTModel

- (BOOL)isLoading { 
    return FALSE;
}

- (BOOL)isLoaded {
    return TRUE;
}

#pragma mark TTPhotoSource

- (NSInteger)numberOfPhotos {
    return _photos.count;
}

- (NSInteger)maxPhotoIndex {
    return _photos.count-1;
}

- (id<TTPhoto>)photoAtIndex:(NSInteger)photoIndex {
    if (photoIndex < _photos.count) {
        return [_photos objectAtIndex:photoIndex];
    } else {
        return nil;
    }
}

static PhotoSet *samplePhotoSet = nil;

+ (PhotoSet *) samplePhotoSet {
    @synchronized(self) {
        if (samplePhotoSet == nil) {
            Photo *mathNinja = [[[Photo alloc] initWithImage:@"hotel_0.jpg" 
                                                         caption:@"Meeting Room" 
                                                         size:CGSizeMake(1024, 748)] autorelease];
            
            Photo *instantPoetry = [[[Photo alloc] initWithImage:@"hotel_1.jpg" 
                                                             caption:@"Dinning Room" 
                                                                size:CGSizeMake(1024, 748)] autorelease];
            Photo *levelMeUp = [[[Photo alloc] initWithImage:@"hotel_2.jpg" 
                                                       caption:@"Vote Room" 
                                                          size:CGSizeMake(1024, 748)] autorelease];
            NSArray *photos = [NSArray arrayWithObjects:mathNinja, instantPoetry, levelMeUp, nil];
            samplePhotoSet = [[self alloc] initWithTitle:@"My Apps" photos:photos];
        }
    }
    return samplePhotoSet;
}
@end