#import <Foundation/Foundation.h>

@interface HeadshotPicker : NSObject <UINavigationControllerDelegate, UIImagePickerControllerDelegate>


- (void)presentImagePickerFrom:(UIViewController *)presentingController;

@end
