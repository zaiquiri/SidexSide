#import "UserFinder.h"
#import <Parse/Parse.h>
#import "ScenePartnerFoundViewController.h"

@interface UserFinder()

@property (strong, nonatomic) UINavigationController *castingNavigationController;

@end

@implementation UserFinder

@synthesize castingNavigationController;

- (id)initWithCastingNavigationController:(UINavigationController *)castingNavigationController {
    if (self = [super init]){
        self.castingNavigationController = castingNavigationController;
        return self;
    }
    return nil;
}

- (void)findScenePartnerAndPresentFrom:(UIViewController *)presentingViewController completion:(void(^)())completion{
    PFQuery *query = [PFUser query];
    //TODO: put conditions on query
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            int random = arc4random() % [objects count];
            PFUser *user = objects[random];
            
            ScenePartnerFoundViewController *scenePartnerFoundViewController = [castingNavigationController.viewControllers objectAtIndex:0];
            
            //inject found user into scenePartnerFoundViewController
            //inject breakdown information into scenePartnerFoundViewController
            
            [presentingViewController presentViewController:castingNavigationController animated:YES completion:nil];
            
            completion();
        } else {
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
        
    }];

}

@end
