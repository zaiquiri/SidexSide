#import "SidexSidePFUser.h"
#import <Parse/Parse.h>

@interface SidexSidePFUser ()

@property (strong, nonatomic) PFUser *pfUser;

@end

@implementation SidexSidePFUser

- (id)init {
    if (self = [super init]) {
        _pfUser = [PFUser currentUser];
        return self;
    }
    return nil;
}

- (id)initWithPFUser:(PFUser *)pfUser {
    if (self = [super init]) {
        _pfUser = pfUser;
        return self;
    }
    return nil;
}

- (instancetype)currentUser {
    return [PFUser currentUser] ? [[SidexSidePFUser alloc]initWithPFUser:[PFUser currentUser]] : nil;
}

@end
