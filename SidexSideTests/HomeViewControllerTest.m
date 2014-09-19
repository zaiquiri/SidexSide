#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "LogInAndSignUpHandler.h"
#import "HomeViewController.h"
#import "SidexSidePFUser.h"

@interface HomeViewControllerTest : XCTestCase

@property (strong, nonatomic) HomeViewController *homeViewController;

@end

@implementation HomeViewControllerTest

@synthesize homeViewController;

- (void)setUp
{
    [super setUp];
    homeViewController = [[HomeViewController alloc] init];
}

- (void)tearDown
{
    [super tearDown];
}

- (void) testShouldCallShowLoginWhenNoUserIsLoggedIn {
    id pfUser = OCMClassMock([SidexSidePFUser class]);
    OCMStub([pfUser currentUser]).andReturn(nil);
    id logInAndSignUpHandler = OCMClassMock([LogInAndSignUpHandler class]);
    homeViewController.pfUser = pfUser;
    homeViewController.logInAndSignUpHandler = logInAndSignUpHandler;
    
    [homeViewController viewDidAppear:true];
    
    OCMVerify([logInAndSignUpHandler showLogin]);
    
}

- (void) testShouldNotCallShowLoginWhenAUserIsLoggedIn {
    SidexSidePFUser *user = [[SidexSidePFUser alloc] init];
    id pfUser = OCMClassMock([SidexSidePFUser class]);
    OCMStub([pfUser currentUser]).andReturn(user);
    id logInAndSignUpHandler = OCMClassMock([LogInAndSignUpHandler class]);
    homeViewController.pfUser = pfUser;
    homeViewController.logInAndSignUpHandler = logInAndSignUpHandler;
    
    [[logInAndSignUpHandler reject] showLogin];
    
    [homeViewController viewDidAppear:true];
    
    [logInAndSignUpHandler verify];
    
}


@end
