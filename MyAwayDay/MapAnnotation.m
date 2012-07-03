#import "MapAnnotation.h"

@implementation MapAnnotation
@synthesize coordinate = _coordinate;

- (id)initWithCoordinate:(CLLocationCoordinate2D)coordinate
{
    self = [super init];
    
    if (self != nil)
    {
        _coordinate = coordinate;
    }
    
    return self;
}

@end