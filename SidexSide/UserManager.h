#import <Foundation/Foundation.h>

@interface UserManager : NSObject

- (void)saveHeadshot:(UIImage *)headshot;
- (BOOL)profileIsComplete;
- (void)setName:(NSString *)name;
- (void)setRepresentation:(NSString *)representation;
- (void)setUnions:(NSString *)unions;
- (void)setLowAge:(NSString *)lowAge;
- (void)setHighAge:(NSString *)highAge;
- (void)setGender:(NSString *)gender;
- (void)setTravelRadius:(NSString *)travelRadius;
- (void)setProfileComplete:(BOOL)complete;
- (void)save;
- (BOOL) isLoggedIn;
- (void)logout;
- (NSString *)userId;


@end
