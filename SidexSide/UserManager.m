#import "UserManager.h"
#import <Parse/Parse.h>

@implementation UserManager

- (void)saveHeadshot:(UIImage *)headshot {
    UIBackgroundTaskIdentifier fileUploadBackgroundTaskId;
    NSData *imageData = UIImageJPEGRepresentation(headshot, 0.8f);
    PFFile *imageFile = [PFFile fileWithData:imageData];
    [[UIApplication sharedApplication] beginBackgroundTaskWithExpirationHandler: ^{
        [[UIApplication sharedApplication] endBackgroundTask:fileUploadBackgroundTaskId];
    }];
    [imageFile saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        [[UIApplication sharedApplication] endBackgroundTask:fileUploadBackgroundTaskId];
    }];
    [[PFUser currentUser] setObject:imageFile forKey:@"headshot"];
}

- (BOOL)profileIsComplete {
    return [[PFUser currentUser] objectForKey:@"profileComplete"]
    || [[PFUser currentUser] objectForKey:@"profileComplete"] == [NSNumber numberWithBool:NO];
}

@end
