#import <XCTest/XCTest.h>
#import "OCMock.h"
#import "LogInDelegate.h"
#import "SidexSideLoginViewController.h"

@interface LogInDelegateTest : XCTestCase

@property (strong, nonatomic) NSString *username;
@property (strong, nonatomic) NSString *password;
@property (strong, nonatomic) LogInDelegate *logInDelegate;
@property (strong, nonatomic) SidexSideLoginViewController *logInViewController;

@end

@implementation LogInDelegateTest

@synthesize username;
@synthesize password;
@synthesize logInDelegate;
@synthesize logInViewController;

- (void)setUp
{
    [super setUp];
    username = @"username";
    password = @"password";
    logInDelegate = [[LogInDelegate alloc] init];
    logInViewController = [[SidexSideLoginViewController alloc] init];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testShouldReturnNOWhenThereIsNoPassword
{
    XCTAssertFalse([logInDelegate logInViewController:logInViewController shouldBeginLogInWithUsername:username password:nil]);
}

- (void)testShouldReturnNOWhenThereIsNoUsername
{
    XCTAssertFalse([logInDelegate logInViewController:logInViewController shouldBeginLogInWithUsername:nil password:password]);
}

- (void)testShouldReturnNOWhenPasswordLengthIsZero
{
    XCTAssertFalse([logInDelegate logInViewController:logInViewController shouldBeginLogInWithUsername:username password:@""]);
}

- (void)testShouldReturnNOWhenUsernameLengthIsZero
{
    XCTAssertFalse([logInDelegate logInViewController:logInViewController shouldBeginLogInWithUsername:@"" password:password]);

}

- (void)testShouldReturnYESWhenPasswordAndUsernameAreComplete
{
    XCTAssertTrue([logInDelegate logInViewController:logInViewController shouldBeginLogInWithUsername:username password:password]);
}

@end
