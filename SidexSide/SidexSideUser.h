#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@interface SidexSideUser : NSObject

@property (strong, nonatomic) UIImage *headshot;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *unions;

- (id)initWithPFUser:(PFUser *)user;

@end
