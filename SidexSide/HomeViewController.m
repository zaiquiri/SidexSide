#import "HomeViewController.h"

@implementation HomeViewController

@synthesize logInAndSignUpHandler;
@synthesize pfUser;

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    if (![pfUser currentUser]) {
        [logInAndSignUpHandler showLogin];
    }
}

@end
