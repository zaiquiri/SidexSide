#import "TimePickerDelegateDataSource.h"

@interface TimePickerDelegateDataSource()

@property (strong, nonatomic) NSArray *hours;
@property (strong, nonatomic) NSArray *minutes;
@property (strong, nonatomic) NSArray *meridiems;

@end

@implementation TimePickerDelegateDataSource

@synthesize hours;
@synthesize minutes;
@synthesize meridiems;
@synthesize selectedHour;
@synthesize selectedMinute;
@synthesize selectedMeridiem;

- (id)init {
    if (self = [super init]) {
        meridiems = @[@"AM", @"PM"];
        hours = [self createHours];
        minutes = [self createMinutes];
        return self;
    }
    return nil;
}

- (NSArray *)createHours {
    NSMutableArray *temp = [[NSMutableArray alloc] init];
    for (int i=1; i<=12; i++){
        [temp addObject:[NSString stringWithFormat:@"%d", i]];
    }
    return [NSArray arrayWithArray:temp];
}

- (NSArray *)createMinutes {
    NSMutableArray *temp = [[NSMutableArray alloc] init];
    for (int i=0; i<=59; i++){
        NSString *minute = [NSString stringWithFormat:@"%d", i];
        if ([minute length] ==1){
            minute = [NSString stringWithFormat:@"0%@", minute];
        }
        [temp addObject:minute];
    }
    return [NSArray arrayWithArray:temp];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 3;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    switch (component) {
        case 0:
            return [hours count];
        case 1:
            return [minutes count];
        case 2:
            return [meridiems count];
        default:
            return 0;
    }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    switch (component) {
        case 0:
            selectedHour = hours[row];
            break;
        case 1:
            selectedMinute = minutes[row];
            break;
        case 2:
            selectedMeridiem = meridiems[row];
            break;
        default:
            break;
    }

}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    switch (component) {
        case 0:
            return hours[row];
        case 1:
            return minutes[row];
        case 2:
            return meridiems[row];
        default:
            return 0;
    }
}

@end
