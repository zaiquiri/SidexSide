#import "SidexSidePFUser.h"
#import <Parse/Parse.h>

@interface SidexSidePFUser ()

@property (strong, nonatomic) PFUser *pfUser;

@end

@implementation SidexSidePFUser

- (id)initWithPFUser:(PFUser *)pfUser {
    if (self = [super init]) {
        _pfUser = pfUser;
        return self;
    }
    return nil;
}


- (instancetype)currentUser {
    return [[SidexSidePFUser alloc]initWithPFUser:[PFUser currentUser]];
}

@end
