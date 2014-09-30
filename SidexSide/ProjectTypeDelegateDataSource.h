#import <Foundation/Foundation.h>
#import "ProjectTypeDelegateDataSource.h"

@interface ProjectTypeDelegateDataSource : NSObject <UIPickerViewDataSource, UIPickerViewDelegate>

@property (strong, nonatomic) NSString *selectedProjectType;

- (int)defaultSelection;
- (id)initWithProjectTypes:(NSArray *)projectTypes;

@end
