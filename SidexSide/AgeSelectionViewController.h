#import <UIKit/UIKit.h>
#import "AgePickerDelegateDataSource.h"
#import "ProjectTypeDelegateDataSource.h"

@interface AgeSelectionViewController : UIViewController

@property (strong, nonatomic)AgePickerDelegateDataSource *pickerDelegateDataSource;
@property (strong, nonatomic) NSString *selectedGender;
@property (strong, nonatomic) ProjectTypeDelegateDataSource *projectTypeDelegateDataSource;

@end
