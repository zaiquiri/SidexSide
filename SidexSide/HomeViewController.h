#import <UIKit/UIKit.h>
#import "LogInAndSignUpHandler.h"
#import "UserManager.h"
#import "GenderPickerDelegateDataSource.h"

@interface HomeViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>

@property (strong, nonatomic) LogInAndSignUpHandler *logInAndSignUpHandler;
@property (strong, nonatomic) UserManager *userManager;
@property (strong, nonatomic) GenderPickerDelegateDataSource *pickerDelegateDataSource;

@end
