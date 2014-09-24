#import <XCTest/XCTest.h>
#import "OCMock.h"
#import "LogInAndSignUpHandler.h"
#import "LogInDelegate.h"
#import "SignUpDelegate.h"

@interface LogInAndSignUpHandlerTest : XCTestCase
@property (strong, nonatomic) LogInAndSignUpHandler *logInAndSignUpHandler;
@property (strong, nonatomic) PFLogInViewController *logInViewController;
@end

@implementation LogInAndSignUpHandlerTest

@synthesize logInAndSignUpHandler;
@synthesize logInViewController;

- (void)setUp
{
    [super setUp];
    logInViewController = [[PFLogInViewController alloc] init];
    id signUpViewController = [[PFSignUpViewController alloc] init];
    id logInDelegate = [[LogInDelegate alloc] init];
    id signUpDelegate = [[SignUpDelegate alloc] init];
    
    logInAndSignUpHandler = [[LogInAndSignUpHandler alloc] initWithLogInViewController:logInViewController
                                                                  signUpViewController:signUpViewController
                                                                         logInDelegate:logInDelegate
                                                                        signUpDelegate:signUpDelegate];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testShouldPresentLogInViewWhenShowLoginIsCalled
{
    id homeViewController = [[UIViewController alloc] init];
    
    [logInAndSignUpHandler showLoginFrom:homeViewController];
    
    OCMVerify([homeViewController presentViewController:logInViewController animated:YES completion:nil]);
}

@end
