#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@interface SidexSidePFUser : NSObject

- (id)initWithPFUser:(PFUser *)pfUser;
- (PFUser *)currentUser;

@end
