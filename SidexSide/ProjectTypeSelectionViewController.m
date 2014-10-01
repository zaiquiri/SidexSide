#import "ProjectTypeSelectionViewController.h"
#import "ReviewBreakdownViewController.h"

@interface ProjectTypeSelectionViewController()

@property (strong, nonatomic) IBOutlet UIPickerView *picker;

@end

@implementation ProjectTypeSelectionViewController

@synthesize pickerDelegateDataSource;
@synthesize picker;
@synthesize selectedAge;
@synthesize selectedGender;
@synthesize userFinder;
@synthesize castingNavigationController;

- (void)viewDidLoad {
    self.picker.delegate = pickerDelegateDataSource;
    self.picker.dataSource = pickerDelegateDataSource;
    [self.picker selectRow:[pickerDelegateDataSource defaultSelection] inComponent:0 animated:YES];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    ReviewBreakdownViewController *destinationViewController = (ReviewBreakdownViewController *)segue.destinationViewController;
    destinationViewController.selectedGender = selectedGender;
    destinationViewController.selectedAge = selectedAge;
    destinationViewController.selectedProjectType = [pickerDelegateDataSource selectedProjectType];
    destinationViewController.userFinder = userFinder;
    destinationViewController.castingNavigationController = castingNavigationController;
}

@end
