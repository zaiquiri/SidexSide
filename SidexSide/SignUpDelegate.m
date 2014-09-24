#import "SignUpDelegate.h"

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
    
    BOOL informationComplete = YES;
    for (id key in info) {
        NSString *field = [info objectForKey:key];
        if (!field || field.length == 0) {
            informationComplete = NO;
            break;
        }
    }
    
    BOOL passwordsMatch = YES;
    if (![[info objectForKey:@"password"] isEqualToString:[info objectForKey:@"additionalField"]]){
        passwordsMatch = NO;
    }
    
    BOOL emailIsValid = YES;
    email = [info objectForKey:@"username"];
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    if (![emailTest evaluateWithObject:email]) {
        emailIsValid = NO;
    }
    
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
    [user setEmail:email];
    [user saveInBackground];
}

- (void)signUpViewController:(PFSignUpViewController *)signUpController didFailToSignUpWithError:(NSError *)error {
    NSLog(@"Failed to sign up");
}

@end
