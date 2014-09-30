#import "ProjectTypeSelectionViewController.h"

@interface ProjectTypeSelectionViewController()

@property (strong, nonatomic) IBOutlet UIPickerView *picker;

@end

@implementation ProjectTypeSelectionViewController

@synthesize pickerDelegateDataSource;
@synthesize picker;

- (void)viewDidLoad {
    self.picker.delegate = pickerDelegateDataSource;
    self.picker.dataSource = pickerDelegateDataSource;
    [self.picker selectRow:[pickerDelegateDataSource defaultSelection] inComponent:0 animated:YES];
}

@end
