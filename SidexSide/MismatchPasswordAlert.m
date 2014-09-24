#import "MismatchPasswordAlert.h"

@implementation MismatchPasswordAlert

- (id)init {
    if (self = [super init]){
        self.title = @"Passwords Do Not Match!";
        self.message = @"The passwords you entered are different";
        [self setCancelButtonIndex:[self addButtonWithTitle:@"ok"]];
        return self;
    }
    return nil;
}

@end
