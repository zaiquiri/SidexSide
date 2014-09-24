#import <XCTest/XCTest.h>
#import "OCMock.h"
#import "SignUpDelegate.h"
#import "SidexSideSignUpViewController.h"
#import "MissingInformationAlert.h"

@interface SignUpDelegateTest : XCTestCase

@property (strong, nonatomic) NSString *username;
@property (strong, nonatomic) NSString *password;
@property (strong, nonatomic) SignUpDelegate *signUpDelegate;
@property (strong, nonatomic) SidexSideSignUpViewController *signUpViewController;
@property (strong, nonatomic) id missingInfoAlert;
@property (strong, nonatomic) id mismatchPasswordAlert;
@property (strong, nonatomic) id invalidEmailAlert;

@end

@implementation SignUpDelegateTest

@synthesize username;
@synthesize password;
@synthesize signUpDelegate;
@synthesize signUpViewController;
@synthesize missingInfoAlert;
@synthesize mismatchPasswordAlert;
@synthesize invalidEmailAlert;

- (void)setUp
{
    [super setUp];
    username = @"email@domain.com";
    password = @"password";
    missingInfoAlert = OCMClassMock([MissingInformationAlert class]);
    mismatchPasswordAlert = OCMClassMock([MismatchPasswordAlert class]);
    invalidEmailAlert = OCMClassMock([InvalidEmailAlert class]);
    signUpViewController = OCMClassMock([SidexSideSignUpViewController class]);
    signUpDelegate = [[SignUpDelegate alloc] initWithMissingInformationAlert:missingInfoAlert mismatchPasswordAlert:mismatchPasswordAlert invalidEmailAlert:invalidEmailAlert];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testShouldReturnYESAndNotShowAnyAlertWhenAllInformationIsCorrect {
    [[missingInfoAlert reject] show];
    [[mismatchPasswordAlert reject] show];
    [[invalidEmailAlert reject] show];
    
    NSDictionary *info = [[NSDictionary alloc] initWithObjectsAndKeys:username, @"username", password, @"password", password, @"additionalField", nil];
    
    BOOL shouldBeginSignUp = [signUpDelegate signUpViewController:signUpViewController shouldBeginSignUp:info];
    
    XCTAssertTrue(shouldBeginSignUp);
    [missingInfoAlert verify];
    [mismatchPasswordAlert verify];
    [invalidEmailAlert verify];
}

- (void)testShouldReturnNOAndOnlyShowMissingInfoAlertWhenThereIsNoUsername {
    [[mismatchPasswordAlert reject] show];
    [[invalidEmailAlert reject] show];
    
    NSDictionary *info = [[NSDictionary alloc] initWithObjectsAndKeys: @"", @"username", password, @"password", password, @"additionalField", nil];
    
    BOOL shouldBeginSignUp = [signUpDelegate signUpViewController:signUpViewController shouldBeginSignUp:info];
    
    XCTAssertFalse(shouldBeginSignUp);
    OCMVerify([missingInfoAlert show]);
    [mismatchPasswordAlert verify];
    [invalidEmailAlert verify];
}

- (void)testShouldReturnNOAndOnlyShowMIssingInfoAlertWhenThereIsNoPassword {
    [[mismatchPasswordAlert reject] show];
    [[invalidEmailAlert reject] show];
    
    NSDictionary *info = [[NSDictionary alloc] initWithObjectsAndKeys: username, @"username", @"", @"password", password, @"additionalField", nil];
    
    BOOL shouldBeginSignUp = [signUpDelegate signUpViewController:signUpViewController shouldBeginSignUp:info];
    
    XCTAssertFalse(shouldBeginSignUp);
    OCMVerify([missingInfoAlert show]);
    [mismatchPasswordAlert verify];
    [invalidEmailAlert verify];
}

- (void)testShouldReturnNOAndOnlyShowMissingInfoAlertWhenThereIsNoConfirmPassword {
    [[mismatchPasswordAlert reject] show];
    [[invalidEmailAlert reject] show];
    
    NSDictionary *info = [[NSDictionary alloc] initWithObjectsAndKeys: username, @"username", password, @"password", @"", @"additionalField", nil];
    
    BOOL shouldBeginSignUp = [signUpDelegate signUpViewController:signUpViewController shouldBeginSignUp:info];
    
    XCTAssertFalse(shouldBeginSignUp);
    OCMVerify([missingInfoAlert show]);
    [mismatchPasswordAlert verify];
    [invalidEmailAlert verify];
}

- (void)testShouldReturnNOAndOnlyShowMismatchPasswordAlertWhenPasswordsDoNotMatch {
    [[missingInfoAlert reject] show];
    [[invalidEmailAlert reject] show];
    
    NSDictionary *info = [[NSDictionary alloc] initWithObjectsAndKeys: username, @"username", password, @"password", @"differentPassword", @"additionalField", nil];
    
    BOOL shouldBeginSignUp = [signUpDelegate signUpViewController:signUpViewController shouldBeginSignUp:info];
    
    XCTAssertFalse(shouldBeginSignUp);
    OCMVerify([mismatchPasswordAlert show]);
    [missingInfoAlert verify];
    [invalidEmailAlert verify];
}

- (void)testShouldReturnNOAndOnlyShowInvalidEmailAlertWhenEmailIsInvalid {
    [[missingInfoAlert reject] show];
    [[mismatchPasswordAlert reject] show];
    
    NSDictionary *info = [[NSDictionary alloc] initWithObjectsAndKeys: @"invalid-email", @"username", password, @"password", password, @"additionalField", nil];
    
    BOOL shouldBeginSignUp = [signUpDelegate signUpViewController:signUpViewController shouldBeginSignUp:info];
    
    XCTAssertFalse(shouldBeginSignUp);
    OCMVerify([invalidEmailAlert show]);
    [missingInfoAlert verify];
    [mismatchPasswordAlert verify];
}

- (void)testShouldDismissSignUpViewControllerWhenUserHasSignedUpSuccesfully {
    id parentViewController = OCMClassMock([UIViewController class]);
    OCMStub([signUpViewController parentViewController]).andReturn(parentViewController);
    
    [signUpDelegate signUpViewController:signUpViewController didSignUpUser:[PFUser currentUser]];
    
    OCMVerify([parentViewController dismissViewControllerAnimated:YES completion:nil]);
}

- (void)testShouldSetUsersEmailFromUsernameValueWhenSignUpWasSuccessful {
    id user = OCMClassMock([PFUser class]);
    NSDictionary *info = [[NSDictionary alloc] initWithObjectsAndKeys:username, @"username", password, @"password", password, @"additionalField", nil];
   
    [signUpDelegate signUpViewController:signUpViewController shouldBeginSignUp:info];
    [signUpDelegate signUpViewController:signUpViewController didSignUpUser:user];
    
    OCMVerify([user setEmail:username]);
    OCMVerify([user saveInBackground]);
}

@end
