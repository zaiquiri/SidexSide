#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@interface LogInDelegate : NSObject <PFLogInViewControllerDelegate>

- (BOOL)logInViewController:(PFLogInViewController *)logInController shouldBeginLogInWithUsername:(NSString *)username password:(NSString *)password;

@end
