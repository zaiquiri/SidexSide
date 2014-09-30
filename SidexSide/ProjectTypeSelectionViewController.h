#import <UIKit/UIKit.h>
#import "ProjectTypeDelegateDataSource.h"
#import "UserFinder.h"

@interface ProjectTypeSelectionViewController : UIViewController

@property (strong, nonatomic) ProjectTypeDelegateDataSource *pickerDelegateDataSource;
@property (strong, nonatomic) NSString *selectedGender;
@property (strong, nonatomic) NSString *selectedAge;
@property (strong, nonatomic) UserFinder *userFinder;

@end
