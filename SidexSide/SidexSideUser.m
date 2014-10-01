#import "SidexSideUser.h"
#import <Parse/Parse.h>

@interface SidexSideUser ()

@property (strong, nonatomic) PFUser *pfUser;

@end

@implementation SidexSideUser

- (id)initWithPFUser:(PFUser *)pfUser {
    if (self = [super init]) {
        _pfUser = pfUser;
        return self;
    }
    return nil;
}

@end
