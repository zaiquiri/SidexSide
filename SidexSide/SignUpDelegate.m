#import "SignUpDelegate.h"

static NSString *const usernameKey = @"username";
static NSString *const passwordKey = @"password";
static NSString *const passwordConfirmKey = @"additional";
static NSString *const emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}";

@interface SignUpDelegate()
@property (strong, nonatomic) MissingInformationAlert *missingInfoAlert;
@property (strong, nonatomic) MismatchPasswordAlert *mismatchPasswordAlert;
@property (strong, nonatomic) InvalidEmailAlert *invalidEmailAlert;
@property (strong, nonatomic) NSString *email;
@end

@implementation SignUpDelegate

@synthesize missingInfoAlert;
@synthesize mismatchPasswordAlert;
@synthesize invalidEmailAlert;
@synthesize email;

- (id)initWithMissingInformationAlert:(MissingInformationAlert *)missingInfoAlert mismatchPasswordAlert:(MismatchPasswordAlert *)mismatchPasswordAlert invalidEmailAlert:(InvalidEmailAlert *)invalidEmailAlert {
    if (self = [super init]) {
        self.missingInfoAlert = missingInfoAlert;
        self.mismatchPasswordAlert = mismatchPasswordAlert;
        self.invalidEmailAlert = invalidEmailAlert;
        return self;
    }
    return nil;
}

- (BOOL)signUpViewController:(PFSignUpViewController *)signUpController shouldBeginSignUp:(NSDictionary *)info {
    
    BOOL informationComplete = [self informationIsComplete:info];
    BOOL passwordsMatch = [self passwordsMatch:info];
    BOOL emailIsValid = [self emailIsValid:info];
    
    if (!informationComplete) {
        [missingInfoAlert show];
    } else if (!passwordsMatch) {
        [mismatchPasswordAlert show];
    } else if (!emailIsValid) {
        [invalidEmailAlert show];
    }
    
    return informationComplete && passwordsMatch && emailIsValid;
}

- (void)signUpViewController:(PFSignUpViewController *)signUpController didSignUpUser:(PFUser *)user {
    [signUpController.parentViewController dismissViewControllerAnimated:YES completion:nil];
    [user setValue:@"" forKey:@"additional"];
    [user setEmail:email];
    [user saveInBackground];
}

- (void)signUpViewController:(PFSignUpViewController *)signUpController didFailToSignUpWithError:(NSError *)error {
    NSLog(@"Failed to sign up");
}

- (void)signUpViewControllerDidCancelSignUp:(PFSignUpViewController *)signUpController {
    [signUpController.parentViewController dismissViewControllerAnimated:YES completion:nil];
}

- (BOOL)informationIsComplete:(NSDictionary *)info {
    BOOL informationComplete = YES;
    for (id key in info) {
        NSString *field = [info objectForKey:key];
        if (!field || field.length == 0) {
            informationComplete = NO;
            break;
        }
    }
    return informationComplete;
}

- (BOOL)passwordsMatch:(NSDictionary *)info {
    if (![[info objectForKey:passwordKey] isEqualToString:[info objectForKey:passwordConfirmKey]]){
        return NO;
    }
    return YES;
}

- (BOOL)emailIsValid:(NSDictionary *)info {
    email = [info objectForKey:usernameKey];
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    if (![emailTest evaluateWithObject:email]) {
        return NO;
    }
    return YES;
}

@end
