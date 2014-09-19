#import "LogInAndSignUpHandler.h"

@interface LogInAndSignUpHandler()

@property (strong, nonatomic) PFLogInViewController *logInViewController;
@property (strong, nonatomic) PFSignUpViewController *signUpViewController;
@property (strong, nonatomic) LogInDelegate *logInDelegate;
@property (strong, nonatomic) SignUpDelegate *signUpDelegate;

@end

@implementation LogInAndSignUpHandler

- (id)initWithLogInViewController:(PFLogInViewController *) logInViewController signUpViewController:(PFSignUpViewController *)signUpViewController logInDelegate:(LogInDelegate *) logInDelegate signUpDelegate:(SignUpDelegate *)signUpDelegate {
    
    if (self = [super init]) {
        _logInViewController = logInViewController;
        _signUpViewController = signUpViewController;
        _logInDelegate = logInDelegate;
        _signUpDelegate = signUpDelegate;
        
        [_logInViewController setDelegate:_logInDelegate];
        [_signUpViewController setDelegate:_signUpDelegate];
        [_logInViewController setSignUpController:_signUpViewController];
        
        return self;
    }
    
    return nil;
    
}

- (void)showLoginFrom:(UIViewController *) presentingViewController {
    [presentingViewController presentViewController:_logInViewController animated:YES completion:nil];
}

@end
