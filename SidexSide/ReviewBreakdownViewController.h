#import <UIKit/UIKit.h>
#import "UserFinder.h"

@interface ReviewBreakdownViewController : UIViewController

@property (strong, nonatomic) NSString *selectedGender;
@property (strong, nonatomic) NSString *selectedAge;
@property (strong, nonatomic) NSString *selectedProjectType;
@property (strong, nonatomic) UserFinder *userFinder;

@end
