#import "BasicProfileDetailsViewController.h"

@interface BasicProfileDetailsViewController()

@property (strong, nonatomic) IBOutlet UITextField *name;
@property (strong, nonatomic) IBOutlet UITextField *representation;
@property (strong, nonatomic) IBOutlet UITextField *unions;
@property (strong, nonatomic) IBOutlet UITextField *lowAge;
@property (strong, nonatomic) IBOutlet UITextField *highAge;
@property (strong, nonatomic) IBOutlet UITextField *gender;
@property (strong, nonatomic) IBOutlet UITextField *travelRadius;

@end

@implementation BasicProfileDetailsViewController

@synthesize userManager;

@synthesize name;
@synthesize representation;
@synthesize unions;
@synthesize lowAge;
@synthesize highAge;
@synthesize gender;
@synthesize travelRadius;

- (IBAction)finish:(id)sender {
    if ([self fieldsAreComplete]) {
        [userManager setProfileComplete:YES];
        [userManager setName:name.text];
        [userManager setRepresentation:representation.text];
        [userManager setUnions:unions.text];
        [userManager setLowAge:lowAge.text];
        [userManager setHighAge:highAge.text];
        [userManager setGender:gender.text];
        [userManager setTravelRadius:travelRadius.text];
        [userManager save];
        
        [self dismissViewControllerAnimated:YES completion:nil];
    } else {
        [[[UIAlertView alloc] initWithTitle:@"Missing Information" message:@"Please fill out all fields" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil] show];
    }
}

- (BOOL)fieldsAreComplete {
    return name.text.length > 0
            && representation.text.length > 0
            && unions.text.length > 0
            && lowAge.text.length > 0
            && highAge.text.length > 0
            && gender.text.length > 0
            && travelRadius.text.length > 0;
}

@end
