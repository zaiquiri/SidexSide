#import <Foundation/Foundation.h>

@interface AgePickerDelegateDataSource : NSObject <UIPickerViewDelegate, UIPickerViewDataSource>

@property (strong, nonatomic) NSString *selectedAge;

- (id)initWithAgesFrom:(int)lowAge through:(int)highAge;
- (int)defaultSelection;

@end
