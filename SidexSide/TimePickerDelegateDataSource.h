#import <Foundation/Foundation.h>

@interface TimePickerDelegateDataSource : NSObject <UIPickerViewDataSource, UIPickerViewDelegate>

@property (strong, nonatomic) NSString *selectedHour;
@property (strong, nonatomic) NSString *selectedMinute;
@property (strong, nonatomic) NSString *selectedMeridiem;

@end
