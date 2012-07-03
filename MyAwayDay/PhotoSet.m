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
            Photo *mathNinja = [[[Photo alloc] initWithCaption:@"Meeting Room" 
                                                      urlLarge:@"bundle://assets/hotel/images/hotel_0.jpg"  
                                                      urlSmall:@"bundle://assets/hotel/thumbs/hotel_0.jpg" 
                                                      urlThumb:@"bundle://assets/hotel/thumbs/hotel_0.jpg" 
                                                          size:CGSizeMake(1024, 768)] autorelease];
            Photo *instantPoetry = [[[Photo alloc] initWithCaption:@"Dinning Room" 
                                                          urlLarge:@"bundle://assets/hotel/images/hotel_1.jpg"  
                                                          urlSmall:@"bundle://assets/hotel/thumbs/hotel_1.jpg" 
                                                          urlThumb:@"bundle://assets/hotel/thumbs/hotel_1.jpg" 
                                                              size:CGSizeMake(1024, 748)] autorelease];
            Photo *levelMeUp = [[[Photo alloc] initWithCaption:@"Vote Room" 
                                                      urlLarge:@"bundle://assets/hotel/images/hotel_2.jpg"  
                                                      urlSmall:@"bundle://assets/hotel/thumbs/hotel_2.jpg" 
                                                      urlThumb:@"bundle://assets/hotel/thumbs/hotel_2.jpg" 
                                                          size:CGSizeMake(1024, 768)] autorelease];
            NSArray *photos = [NSArray arrayWithObjects:mathNinja, instantPoetry, levelMeUp, nil];
            samplePhotoSet = [[self alloc] initWithTitle:@"My Apps" photos:photos];
        }
    }
    return samplePhotoSet;
}
@end