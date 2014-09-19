#import <UIKit/UIKit.h>
#import "LogInAndSignUpHandler.h"
#import "SidexSidePFUser.h"

@interface HomeViewController : UIViewController

@property (strong, nonatomic) LogInAndSignUpHandler *logInAndSignUpHandler;
@property (strong, nonatomic) SidexSidePFUser *pfUser;

@end
