#import "LogInDelegate.h"

@interface LogInDelegate()
@property (strong, nonatomic) MissingInformationAlert *missingInfoAlert;
@property (strong, nonatomic) UIViewController *createProfileController;
@property (strong, nonatomic) UserManager *userManager;
@end

@implementation LogInDelegate

@synthesize missingInfoAlert;
@synthesize userManager;

- (id)initWithMissingInformationAlert:(MissingInformationAlert *)missingInfoAlert
              createProfileController:(UINavigationController *)createProfileController
                          userManager:(UserManager *)userManager{
    if (self = [super init]) {
        self.missingInfoAlert = missingInfoAlert;
        self.createProfileController = createProfileController;
        self.userManager = userManager;
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
        if (![userManager profileIsComplete]){
            [presentingViewController presentViewController:self.createProfileController animated:YES completion:nil];
        }
    }];
}

- (void)logInViewController:(PFLogInViewController *)logInController didFailToLogInWithError:(NSError *)error {
    NSLog(@"Failed to log in...");
}

- (void)logInViewControllerDidCancelLogIn:(PFLogInViewController *)logInController {
    [logInController.parentViewController.navigationController popViewControllerAnimated:YES];
}

@end
