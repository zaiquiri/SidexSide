#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "HeadshotSelectionViewController.h"

@interface HeadshotSelectionViewControllerTest : XCTestCase
@property (strong, nonatomic) HeadshotSelectionViewController *headshotSelectionViewController;
@end

@implementation HeadshotSelectionViewControllerTest

@synthesize headshotSelectionViewController;

- (void)setUp
{
    [super setUp];
    headshotSelectionViewController = [[HeadshotSelectionViewController alloc] init];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testShouldPresentImagePickerWhen
{
    
}

@end
