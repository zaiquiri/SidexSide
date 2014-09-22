#import "LogInDelegate.h"

@implementation LogInDelegate

- (BOOL)logInViewController:(PFLogInViewController *)logInController shouldBeginLogInWithUsername:(NSString *)username password:(NSString *)password {
    
    if (username && password && username.length != 0 && password.length != 0) {
        return YES;
    }
    
    [[[UIAlertView alloc] initWithTitle:@"Missing Information"
                                message:@"Please fill out all fields"
                               delegate:nil
                      cancelButtonTitle:@"ok"
                      otherButtonTitles:nil] show];

    return NO;
}

@end
