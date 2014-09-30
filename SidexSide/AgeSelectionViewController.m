#import "AgeSelectionViewController.h"
#import "ProjectTypeSelectionViewController.h"

@interface AgeSelectionViewController()

@property (strong, nonatomic) IBOutlet UIPickerView *picker;


@end

@implementation AgeSelectionViewController

@synthesize pickerDelegateDataSource;
@synthesize picker;
@synthesize selectedGender;
@synthesize projectTypeDelegateDataSource;

- (void)viewDidLoad {
    picker.delegate = pickerDelegateDataSource;
    picker.dataSource = pickerDelegateDataSource;
    [picker selectRow:[pickerDelegateDataSource defaultSelection] inComponent:0 animated:YES];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    ProjectTypeSelectionViewController *destinationViewController = (ProjectTypeSelectionViewController *)segue.destinationViewController;
    destinationViewController.pickerDelegateDataSource = projectTypeDelegateDataSource;
}

@end
