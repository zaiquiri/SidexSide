#import "HomeViewController.h"

@interface HomeViewController()
@property (strong, nonatomic) IBOutlet UIPickerView *picker;
@property (strong, nonatomic) NSString *selectedGender;
@end

@implementation HomeViewController

@synthesize picker;
@synthesize logInAndSignUpHandler;
@synthesize userManager;
@synthesize pickerDelegateDataSource;

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

@end
