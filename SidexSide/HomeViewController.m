#import "HomeViewController.h"
#import "AgeSelectionViewController.h"

@interface HomeViewController()
@property (strong, nonatomic) IBOutlet UIPickerView *picker;
@property (strong, nonatomic) NSString *selectedGender;
@end

@implementation HomeViewController

@synthesize picker;
@synthesize logInAndSignUpHandler;
@synthesize userManager;
@synthesize pickerDelegateDataSource;
@synthesize agePickerDelegateDataSource;
@synthesize projectTypeDelegateDataSource;

- (void)viewDidLoad {
    picker.delegate = pickerDelegateDataSource;
    picker.dataSource = pickerDelegateDataSource;
    [picker selectRow:[pickerDelegateDataSource defaultSelection] inComponent:0 animated:YES];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    if (![userManager isLoggedIn]) {
        [logInAndSignUpHandler showLoginFrom:self];
    }
}

- (IBAction)logout {
    [userManager logout];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    AgeSelectionViewController *destinationViewController = (AgeSelectionViewController *)segue.destinationViewController;
    destinationViewController.selectedGender = pickerDelegateDataSource.selectedGender;
    destinationViewController.pickerDelegateDataSource = agePickerDelegateDataSource;
    destinationViewController.projectTypeDelegateDataSource = projectTypeDelegateDataSource;
}

@end
