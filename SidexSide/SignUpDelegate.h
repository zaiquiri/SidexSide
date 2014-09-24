#import <Foundation/Foundation.h>
#import <Parse/Parse.h>
#import "MissingInformationAlert.h"
#import "MismatchPasswordAlert.h"
#import "InvalidEmailAlert.h"

@interface SignUpDelegate : NSObject <PFSignUpViewControllerDelegate>

- (id)initWithMissingInformationAlert:(MissingInformationAlert *)missingInfoAlert
                mismatchPasswordAlert:(MismatchPasswordAlert *)mismatchPasswordAlert
                    invalidEmailAlert:(InvalidEmailAlert *)invalidEmailAlert;

@end
