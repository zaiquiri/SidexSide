#import <UIKit/UIKit.h>
#import "ImageResizer.h"
#import "UserManager.h"

@interface HeadshotSelectionViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (strong, nonatomic) UIImagePickerController *imagePickerController;
@property (strong, nonatomic) ImageResizer *imageResizer;
@property (strong, nonatomic) UserManager *userManager;

@end
