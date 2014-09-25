#import "SidexSideSignUpViewController.h"

@implementation SidexSideSignUpViewController

- (id)init {
    if (self = [super init]) {
        self.fields = PFSignUpFieldsUsernameAndPassword | PFSignUpFieldsAdditional | PFSignUpFieldsSignUpButton | PFSignUpFieldsDismissButton;
        return self;
    }
    return nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.signUpView.usernameField.placeholder = @"Email";
    self.signUpView.additionalField.placeholder = @"Confirm Password";
    
    [self.signUpView setLogo:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo.png"]]];

}

@end
