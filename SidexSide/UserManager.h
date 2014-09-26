#import <Foundation/Foundation.h>

@interface UserManager : NSObject

- (void)saveHeadshot:(UIImage *)headshot;
- (BOOL)profileIsComplete;

@end
