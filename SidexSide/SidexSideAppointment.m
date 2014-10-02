#import "SidexSideAppointment.h"
#import <Parse/Parse.h>

@interface SidexSideAppointment()

@property (strong, nonatomic) PFObject *appointment;
@property (nonatomic) BOOL saveWasSuccessful;
@end

@implementation SidexSideAppointment

@synthesize appointment;

- (id)initWithSenderId:(NSString *)senderId
              readerId:(NSString *)readerId
                  hour:(NSString *)hour
                minute:(NSString *)minute
              meridiem:(NSString *)meridiem
              location:(NSString *)location
           projectType:(NSString *)projectType {
    
    if (self = [super init]){
        appointment = [PFObject objectWithClassName:@"Appointment"];
        [appointment setObject:senderId forKey:@"senderId"];
        [appointment setObject:readerId forKey:@"readerId"];
        [appointment setObject:hour forKey:@"hour"];
        [appointment setObject:minute forKey:@"minute"];
        [appointment setObject:meridiem forKey:@"meridiem"];
        [appointment setObject:location forKey:@"location"];
        [appointment setObject:projectType forKey:@"projectType"];
        return self;
    }
    return nil;
}

- (void)save {
    [appointment saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (error) {
            [[[UIAlertView alloc] initWithTitle:@"Error"
                                        message:@"There was a problem sending your request."
                                       delegate:nil
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil] show];
        } else {
            dispatch_async(dispatch_get_main_queue(),^{
                [[NSNotificationCenter defaultCenter] postNotificationName:@"appointmentCreatedSuccesfully" object:self];
            });
        }
    }];
}

- (void)pushToScenePartner {
    NSDictionary *data = @{@"alert":@"Someone wants to read with you!",
                           @"badge":@"Increment",
                           @"appointmentId":[appointment objectId],
                           @"type":@"request"};
    
    PFQuery *pushQuery = [PFInstallation query];
    [pushQuery whereKey:@"installationUser" equalTo:[appointment objectForKey:@"readerId"]];
    
    NSTimeInterval interval = 60000; //1 minutes in ms
    
    PFPush *push = [[PFPush alloc] init];
    [push expireAfterTimeInterval:interval];
    [push setQuery:pushQuery];
    [push setData:data];
    [push sendPushInBackground];
}

@end
