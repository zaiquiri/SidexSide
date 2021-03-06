#import <UIKit/UIKit.h>
#import "LogInAndSignUpHandler.h"
#import "UserManager.h"
#import "GenderPickerDelegateDataSource.h"
#import "AgePickerDelegateDataSource.h"
#import "ProjectTypeDelegateDataSource.h"
#import "UserFinder.h"

@interface HomeViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>

@property (strong, nonatomic) LogInAndSignUpHandler *logInAndSignUpHandler;
@property (strong, nonatomic) UserManager *userManager;
@property (strong, nonatomic) GenderPickerDelegateDataSource *pickerDelegateDataSource;
@property (strong, nonatomic) AgePickerDelegateDataSource *agePickerDelegateDataSource;
@property (strong, nonatomic) ProjectTypeDelegateDataSource *projectTypeDelegateDataSource;
@property (strong, nonatomic) UserFinder *userFinder;
@property (strong, nonatomic) UINavigationController *castingNavigationController;

@end
