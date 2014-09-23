#import <XCTest/XCTest.h>
#import "OCMock.h"
#import "LogInDelegate.h"
#import "SidexSideLoginViewController.h"

@interface LogInDelegateTest : XCTestCase

@property (strong, nonatomic) NSString *username;
@property (strong, nonatomic) NSString *password;
@property (strong, nonatomic) LogInDelegate *logInDelegate;
@property (strong, nonatomic) SidexSideLoginViewController *logInViewController;
@property (strong, nonatomic) id missingInfoAlert;

@end

@implementation LogInDelegateTest

@synthesize username;
@synthesize password;
@synthesize logInDelegate;
@synthesize logInViewController;
@synthesize missingInfoAlert;

- (void)setUp
{
    [super setUp];
    username = @"username";
    password = @"password";
    missingInfoAlert = OCMClassMock([MissingInformationAlert class]);
    logInViewController = OCMClassMock([SidexSideLoginViewController class]);
    logInDelegate = [[LogInDelegate alloc] initWithMissingInformationAlert:missingInfoAlert];

    
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testShouldReturnNOAndShowAlertWhenThereIsNoPassword
{
    BOOL returnValue = [logInDelegate logInViewController:logInViewController shouldBeginLogInWithUsername:username password:nil];
    
    XCTAssertFalse(returnValue);
    OCMVerify([missingInfoAlert show]);
}

- (void)testShouldReturnNOAndShowAlertWhenThereIsNoUsername
{
    BOOL returnValue = [logInDelegate logInViewController:logInViewController shouldBeginLogInWithUsername:nil password:password];
    
    XCTAssertFalse(returnValue);
    OCMVerify([missingInfoAlert show]);
}

- (void)testShouldReturnNOAndShowAlertWhenPasswordLengthIsZero
{
    BOOL returnValue = [logInDelegate logInViewController:logInViewController shouldBeginLogInWithUsername:username password:@""];
    
    XCTAssertFalse(returnValue);
    OCMVerify([missingInfoAlert show]);
}

- (void)testShouldReturnNOAndShowAlertWhenUsernameLengthIsZero
{
    BOOL returnValue = [logInDelegate logInViewController:logInViewController shouldBeginLogInWithUsername:@"" password:password];
    
    XCTAssertFalse(returnValue);
    OCMVerify([missingInfoAlert show]);
}

- (void)testShouldReturnYESAndNotShowAlertWhenPasswordAndUsernameAreComplete
{
    [[missingInfoAlert reject] show];
    
    BOOL returnValue = [logInDelegate logInViewController:logInViewController shouldBeginLogInWithUsername:username password:password];
    
    XCTAssertTrue(returnValue);
    [missingInfoAlert verify];
}

- (void)testShouldDismissLogInViewControllerWhenUserSignsInSuccesfully {
    PFUser *user = [[PFUser alloc] init];
    id homeViewController = OCMClassMock([UIViewController class]);
    OCMStub([logInViewController parentViewController]).andReturn(homeViewController);
    
    [logInDelegate logInViewController:logInViewController didLogInUser:user];
    
    OCMVerify([homeViewController dismissViewControllerAnimated:YES completion:nil]);
}

- (void)testShouldDismissLogInViewWhenUserCancelsLogIn {
    id homeViewController = OCMClassMock([UIViewController class]);
    id navigationController = OCMClassMock([UINavigationController class]);
    OCMStub([logInViewController parentViewController]).andReturn(homeViewController);
    OCMStub([homeViewController navigationController]).andReturn(navigationController);
    
    [logInDelegate logInViewControllerDidCancelLogIn:logInViewController];
    
    OCMVerify([navigationController popViewControllerAnimated:YES]);
}

@end
