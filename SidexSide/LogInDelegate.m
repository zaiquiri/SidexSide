#import "LogInDelegate.h"

@interface LogInDelegate()
@property (strong, nonatomic) MissingInformationAlert *missingInfoAlert;
@end

@implementation LogInDelegate

@synthesize missingInfoAlert;

- (id)initWithMissingInformationAlert:(MissingInformationAlert *)missingInfoAlert {
    if (self = [super init]) {
        self.missingInfoAlert = missingInfoAlert;
        return self;
    }
    return nil;
}

- (BOOL)logInViewController:(PFLogInViewController *)logInController shouldBeginLogInWithUsername:(NSString *)username password:(NSString *)password {
    
    if (username && password
        && username.length != 0
        && password.length != 0) {
        return YES;
    }
    
    [missingInfoAlert show];
    return NO;
}

@end
