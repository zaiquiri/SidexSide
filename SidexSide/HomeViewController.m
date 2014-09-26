#import "HomeViewController.h"

@interface HomeViewController()

@end

@implementation HomeViewController

@synthesize logInAndSignUpHandler;
@synthesize pfUser;

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    if (![pfUser currentUser]) {
        [logInAndSignUpHandler showLoginFrom:self];
    }
}

@end
