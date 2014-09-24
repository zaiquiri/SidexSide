#import "InvalidEmailAlert.h"

@implementation InvalidEmailAlert

- (id)init {
    if (self = [super init]){
        self.title = @"Email is invalid!";
        self.message = @"Please enter a valid email address.";
        [self setCancelButtonIndex:[self addButtonWithTitle:@"ok"]];
        return self;
    }
    return nil;
}

@end
