#import "SidexSideUser.h"
#import <Parse/Parse.h>

@implementation SidexSideUser

@synthesize headshot;
@synthesize name;
@synthesize unions;

- (id)initWithPFUser:(PFUser *)pfUser {
    if (self = [super init]) {
        name = [pfUser objectForKey:@"name"];
        unions = [pfUser objectForKey:@"unions"];
        [self loadHeadshotFor:pfUser];
        return self;
    }
    return nil;
}

- (void)loadHeadshotFor:(PFUser *)pfUser {
    PFFile *file = [pfUser objectForKey:@"headshot"];
    [file getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
        if (!error) {
            headshot = [UIImage imageWithData:data];
            dispatch_async(dispatch_get_main_queue(),^{
                [[NSNotificationCenter defaultCenter] postNotificationName:@"SidexSideUserReady"
                                                                    object:self];
            });
        }
    }];
}

@end
