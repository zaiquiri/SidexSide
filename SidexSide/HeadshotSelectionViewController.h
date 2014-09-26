#import <UIKit/UIKit.h>
#import "HeadshotPicker.h"
#import "ImageResizer.h"

@interface HeadshotSelectionViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (strong, nonatomic) UIImagePickerController *imagePickerController;
@property (strong, nonatomic) ImageResizer *imageResizer;

@end
