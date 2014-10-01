#import "UserFinder.h"
#import <Parse/Parse.h>
#import "ScenePartnerFoundViewController.h"
#import "SidexSideUser.h"

@implementation UserFinder

@synthesize bestScenePartner;
@synthesize somethingBad;

- (void)findScenePartnerWithGender:(NSString *)gender age:(NSString *)age projectType:(NSString *) projectType {
    
    bestScenePartner = nil;
    somethingBad = nil;
    
    PFQuery *query = [PFUser query];
    //put conditions on query here
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            PFUser *found = objects[(arc4random() % [objects count])]; //random user
            bestScenePartner = [[SidexSideUser alloc] initWithPFUser:found];
            dispatch_async(dispatch_get_main_queue(),^{
                [[NSNotificationCenter defaultCenter] postNotificationName:@"scenePartnerFound"
                                                                    object:self];
            });
        } else {
            somethingBad = [NSString stringWithFormat:@"Error: %@ %@", error, [error userInfo]];
        }
        
    }];

}

@end
