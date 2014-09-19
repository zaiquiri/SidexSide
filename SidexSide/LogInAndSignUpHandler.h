#import <Foundation/Foundation.h>
#import <Parse/Parse.h>
#import "LogInDelegate.h"
#import "SignUpDelegate.h"

@interface LogInAndSignUpHandler : NSObject

- (id)initWithLogInViewController:(PFLogInViewController *) logInViewController signUpViewController:(PFSignUpViewController *)signUpViewController logInDelegate:(LogInDelegate *) logInDelegate signUpDelegate:(SignUpDelegate *)signUpDelegate;

- (void)showLoginFrom:(UIViewController *) presentingViewController;

@end
