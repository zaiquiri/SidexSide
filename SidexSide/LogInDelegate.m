#import "LogInDelegate.h"

@interface LogInDelegate()
@property (strong, nonatomic) MissingInformationAlert *missingInfoAlert;
@property (strong, nonatomic) UIViewController *createProfileController;
@end

@implementation LogInDelegate

@synthesize missingInfoAlert;

- (id)initWithMissingInformationAlert:(MissingInformationAlert *)missingInfoAlert
              createProfileController:(UINavigationController *)createProfileController{
    if (self = [super init]) {
        self.missingInfoAlert = missingInfoAlert;
        self.createProfileController = createProfileController;
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
    UIViewController *presentingViewController = logInController.presentingViewController;
    
    [presentingViewController dismissViewControllerAnimated:YES completion:^{
        if ([self profileIsIncomplete]){
            [presentingViewController presentViewController:self.createProfileController animated:YES completion:nil];
        }
    }];
}

- (BOOL)profileIsIncomplete {
    return ![[PFUser currentUser] objectForKey:@"profileComplete"]
                || [[PFUser currentUser] objectForKey:@"profileComplete"] == [NSNumber numberWithBool:NO];
}

- (void)logInViewController:(PFLogInViewController *)logInController didFailToLogInWithError:(NSError *)error {
    NSLog(@"Failed to log in...");
}

- (void)logInViewControllerDidCancelLogIn:(PFLogInViewController *)logInController {
    [logInController.parentViewController.navigationController popViewControllerAnimated:YES];
}

@end
