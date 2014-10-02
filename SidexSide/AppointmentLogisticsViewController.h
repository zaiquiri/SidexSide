#import <UIKit/UIKit.h>
#import "SidexSideUser.h"
#import "DateHelper.h"
#import "TimePickerDelegateDataSource.h"
#import "UserManager.h"

@interface AppointmentLogisticsViewController : UIViewController
@property (strong, nonatomic) SidexSideUser *scenePartner;
@property (strong, nonatomic) DateHelper *dateHelper;
@property (strong, nonatomic) TimePickerDelegateDataSource *pickerDelegateDataSource;
@property (strong, nonatomic) UserManager *userManager;
@property (strong, nonatomic) NSString *projectType;
@end
