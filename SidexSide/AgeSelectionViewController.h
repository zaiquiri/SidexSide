#import <UIKit/UIKit.h>
#import "AgePickerDelegateDataSource.h"
#import "ProjectTypeDelegateDataSource.h"
#import "UserFinder.h"

@interface AgeSelectionViewController : UIViewController

@property (strong, nonatomic)AgePickerDelegateDataSource *pickerDelegateDataSource;
@property (strong, nonatomic) NSString *selectedGender;
@property (strong, nonatomic) ProjectTypeDelegateDataSource *projectTypeDelegateDataSource;
@property (strong, nonatomic) UserFinder *userFinder;
@property (strong, nonatomic) UINavigationController *castingNavigationController;

@end
