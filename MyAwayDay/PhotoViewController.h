#import <Foundation/Foundation.h>
#import <Three20/Three20.h>

@class PhotoSet;

@interface PhotoViewController : TTPhotoViewController {
    PhotoSet *_photoSet;
}

@property (nonatomic, retain) PhotoSet *photoSet;

@end