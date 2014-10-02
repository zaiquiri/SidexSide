#import <UIKit/UIKit.h>
#import "SidexSideUser.h"
#import "TimePickerDelegateDataSource.h"
#import "DateHelper.h"

@interface ScenePartnerFoundViewController : UIViewController

@property (strong, nonatomic) SidexSideUser *scenePartner;
@property (strong, nonatomic) TimePickerDelegateDataSource *timePickerDelegateDataSource;
@property (strong, nonatomic) DateHelper *dateHelper;
@property (strong, nonatomic) NSString *projectType;

@end
