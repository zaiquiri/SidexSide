#import "AgePickerDelegateDataSource.h"

#define DEFAULT_SELECTION ((int) 10)

@interface AgePickerDelegateDataSource()
@property (strong, nonatomic) NSArray *ages;
@end

@implementation AgePickerDelegateDataSource

@synthesize ages;
@synthesize selectedAge;

- (id)initWithAgesFrom:(int)lowAge through:(int)highAge {
    if (self = [super init]) {
        NSMutableArray *agesBuilder = [[NSMutableArray alloc] init];
        for (int i = lowAge; i <= highAge; i++){
            [agesBuilder addObject:[NSString stringWithFormat:@"%d",i]];
        }
        self.ages = [NSArray arrayWithArray:agesBuilder];
        self.selectedAge = ages[[self defaultSelection]];
        return self;
    }
    return nil;
}

- (int)defaultSelection {
    return DEFAULT_SELECTION;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    selectedAge = ages[row];
}

- (NSString *) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return ages[row];
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [ages count];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

@end
