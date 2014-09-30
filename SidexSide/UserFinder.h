#import <Foundation/Foundation.h>

@interface UserFinder : NSObject

- (id)initWithCastingNavigationController:(UINavigationController *)castingNavigationController;
- (void)findScenePartnerAndPresentFrom:(UIViewController *)presentingViewController completion:(void(^)())completion;

@end
