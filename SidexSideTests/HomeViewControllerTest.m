#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "LogInAndSignUpHandler.h"
#import "HomeViewController.h"
#import "SidexSideUser.h"

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
    id pfUser = OCMClassMock([SidexSideUser class]);
    OCMStub([pfUser currentUser]).andReturn(nil);
    id logInAndSignUpHandler = OCMClassMock([LogInAndSignUpHandler class]);
    homeViewController.userManager = pfUser;
    homeViewController.logInAndSignUpHandler = logInAndSignUpHandler;
    
    [homeViewController viewDidAppear:true];
    
    OCMVerify([logInAndSignUpHandler showLoginFrom:homeViewController]);
    
}

- (void) testShouldNotCallShowLoginWhenAUserIsLoggedIn {
    SidexSideUser *user = [[SidexSideUser alloc] init];
    id pfUser = OCMClassMock([SidexSideUser class]);
    OCMStub([pfUser currentUser]).andReturn(user);
    id logInAndSignUpHandler = OCMClassMock([LogInAndSignUpHandler class]);
    homeViewController.pfUser = pfUser;
    homeViewController.logInAndSignUpHandler = logInAndSignUpHandler;
    
    [[logInAndSignUpHandler reject] showLoginFrom:homeViewController];
    
    [homeViewController viewDidAppear:true];
    
    [logInAndSignUpHandler verify];
    
}


@end
