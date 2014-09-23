#import <Foundation/Foundation.h>
#import <Parse/Parse.h>
#import "MissingInformationAlert.h"

@interface LogInDelegate : NSObject <PFLogInViewControllerDelegate>

- (BOOL)logInViewController:(PFLogInViewController *)logInController shouldBeginLogInWithUsername:(NSString *)username password:(NSString *)password;

- (id)initWithMissingInformationAlert:(MissingInformationAlert *) missingInfoAlert;

@end
