#import <Foundation/Foundation.h>
#import "SidexSideUser.h"

@interface UserFinder : NSObject

@property (strong, nonatomic) SidexSideUser *bestScenePartner;
@property (strong, nonatomic) NSString *somethingBad;

- (void)findScenePartnerWithGender:(NSString *)gender age:(NSString *)age projectType:(NSString *)projectType;

@end
