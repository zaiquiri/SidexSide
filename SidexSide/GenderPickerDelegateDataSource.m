#import "GenderPickerDelegateDataSource.h"

@interface GenderPickerDelegateDataSource()

@property (strong, nonatomic) NSArray *genders;


@end

@implementation GenderPickerDelegateDataSource

@synthesize genders;
@synthesize selectedGender;

- (id)initWithGenders:(NSArray *)genders {
    if (self = [super init]) {
        self.genders = genders;
        selectedGender = genders[[self defaultSelection]];
        return self;
    }
    return nil;
}

- (int)defaultSelection {
    return (int)[genders count]/2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [genders count];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    selectedGender = genders[row];
}

- (NSString *) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return genders[row];
}

@end
