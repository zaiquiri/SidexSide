#import <Foundation/Foundation.h>

@interface GenderPickerDelegateDataSource : NSObject <UIPickerViewDataSource, UIPickerViewDelegate>

@property (strong, nonatomic) NSString *selectedGender;

- (int)defaultSelection;
- (id)initWithGenders:(NSArray *)genders;

@end
