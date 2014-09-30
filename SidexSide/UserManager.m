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

- (void)setName:(NSString *)name{
    [[PFUser currentUser] setObject:name forKey:@"name"];
}

- (void)setRepresentation:(NSString *)representation{
    [[PFUser currentUser] setObject:representation forKey:@"representation"];
}

- (void)setUnions:(NSString *)unions{
    [[PFUser currentUser] setObject:unions forKey:@"unions"];
}

- (void)setLowAge:(NSString *)lowAge{
    [[PFUser currentUser] setObject:lowAge forKey:@"lowAge"];
}

- (void)setHighAge:(NSString *)highAge{
    [[PFUser currentUser] setObject:highAge forKey:@"highAge"];
}

- (void)setGender:(NSString *)gender{
    [[PFUser currentUser] setObject:gender forKey:@"gender"];
}

- (void)setTravelRadius:(NSString *)travelRadius{
    [[PFUser currentUser] setObject:travelRadius forKey:@"travelRadius"];
}

- (void)setProfileComplete:(BOOL)complete{
    [[PFUser currentUser] setObject:[NSNumber numberWithBool:complete] forKey:@"profileComplete"];
}

- (void)save {
    [[PFUser currentUser] saveInBackground];
}

- (BOOL)isLoggedIn {
    return [PFUser currentUser] ? YES : NO;
}
@end
