#import <UIKit/UIKit.h>
#import "AgePickerDelegateDataSource.h"

@interface AgeSelectionViewController : UIViewController

@property (strong, nonatomic)AgePickerDelegateDataSource *pickerDelegateDataSource;
@property (strong, nonatomic) NSString *selectedGender;

@end
