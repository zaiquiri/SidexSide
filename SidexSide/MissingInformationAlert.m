#import "MissingInformationAlert.h"

@implementation MissingInformationAlert

- (id)init {
    if (self = [super init]){
        self.title = @"Missing information!";
        self.message = @"Please fill out all fields";
        [self setCancelButtonIndex:[self addButtonWithTitle:@"ok"]];
        return self;
    }
    return nil;
}

@end
