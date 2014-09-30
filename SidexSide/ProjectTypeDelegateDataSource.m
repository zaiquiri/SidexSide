#import "ProjectTypeDelegateDataSource.h"

@interface ProjectTypeDelegateDataSource()

@property (strong, nonatomic) NSArray *projectTypes;

@end

@implementation ProjectTypeDelegateDataSource

@synthesize projectTypes;
@synthesize selectedProjectType;

- (id)initWithProjectTypes:(NSArray *)projectTypes {
    if (self = [super init]) {
        self.projectTypes = projectTypes;
        self.selectedProjectType = projectTypes[[self defaultSelection]];
        return self;
    }
    return nil;
}

- (int)defaultSelection {
    return (int)[projectTypes count]/2;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    selectedProjectType = projectTypes[row];
}

- (NSString *) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return projectTypes[row];
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [projectTypes count];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

@end
