#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@interface SidexSideUser : NSObject

@property (strong, nonatomic) UIImage *headshot;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *unions;
@property (strong, nonatomic) NSString *userId;

- (id)initWithPFUser:(PFUser *)user;
- (NSString *)userId;

@end
