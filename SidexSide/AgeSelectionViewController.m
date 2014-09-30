#import "AgeSelectionViewController.h"

@interface AgeSelectionViewController()

@property (strong, nonatomic) IBOutlet UIPickerView *picker;


@end

@implementation AgeSelectionViewController

@synthesize pickerDelegateDataSource;
@synthesize picker;
@synthesize selectedGender;

- (void)viewDidLoad {
    picker.delegate = pickerDelegateDataSource;
    picker.dataSource = pickerDelegateDataSource;
    [picker selectRow:[pickerDelegateDataSource defaultSelection] inComponent:0 animated:YES];
}

@end
