#import <Foundation/Foundation.h>

@interface SidexSideAppointment : NSObject

- (id)initWithSenderId:(NSString *)senderId
              readerId:(NSString *)readerId
                  hour:(NSString *)hour
                minute:(NSString *)minute
              meridiem:(NSString *)meridiem
              location:(NSString *)location
           projectType:(NSString *)projectType;

- (void)save;

- (void)pushToScenePartner;

@end
