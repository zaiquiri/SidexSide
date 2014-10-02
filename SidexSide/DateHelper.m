#import "DateHelper.h"

@implementation DateHelper

@synthesize nowHour;
@synthesize nowMeridiem;
@synthesize nowMinute;

- (NSInteger)nowHour {
    NSDateComponents *components = [self currentDateComponents];
    return ([components hour] % 12) == 0 ? 12 : [components hour] % 12;
}

- (NSInteger)nowMinute {
    return [[self currentDateComponents] minute];
}

- (NSInteger)nowMeridiem {
    return [[self currentDateComponents] hour] >= 12 ? 1 : 0;
}

- (NSDateComponents *)currentDateComponents {
    return [[NSCalendar currentCalendar] components:(NSHourCalendarUnit | NSMinuteCalendarUnit)
                                           fromDate:[NSDate date]];
}

@end
