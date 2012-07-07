#import <Foundation/Foundation.h>
#import <Three20/Three20.h>

@interface Photo : NSObject <TTPhoto>
{
    NSString *caption;
    NSString *imageName;
    id <TTPhotoSource> photoSource;
    CGSize size;
    NSInteger index;
}

@property (nonatomic, copy) NSString *caption;
@property (nonatomic, copy) NSString *imageName;
@property (nonatomic, assign) id <TTPhotoSource> photoSource;
@property (nonatomic) CGSize size;
@property (nonatomic) NSInteger index;

- (id) initWithImage: (NSString*) name caption:(NSString*) caption size:(CGSize) size;
@end
