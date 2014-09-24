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

- (void) logInViewController:(PFLogInViewController *)logInController didLogInUser:(PFUser *)user {
    [logInController.parentViewController dismissViewControllerAnimated:YES completion:nil];
}

- (void)logInViewController:(PFLogInViewController *)logInController didFailToLogInWithError:(NSError *)error {
    NSLog(@"Failed to log in...");
}

- (void)logInViewControllerDidCancelLogIn:(PFLogInViewController *)logInController {
    [logInController.parentViewController.navigationController popViewControllerAnimated:YES];
}

@end
