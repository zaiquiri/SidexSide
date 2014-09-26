#import "HeadshotPicker.h"

@interface HeadshotPicker()
@property (strong, nonatomic) UIImagePickerController *imagePicker;
@property (strong, nonatomic) UIImage *headshot;
@end

@implementation HeadshotPicker

@synthesize imagePicker;
@synthesize headshot;

- (id)initWithImagePicker:(UIImagePickerController *)imagePicker {
    if (self = [super init]){
        self.imagePicker = imagePicker;
        self.headshot = nil;
        return self;
    }
    return nil;
}

- (void)presentImagePickerFrom:(UIViewController *)presentingController {
    
    imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    imagePicker.allowsEditing = NO;
    imagePicker.delegate = self;
    
    [presentingController presentViewController:imagePicker animated:YES completion:nil];
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info  {
    
    headshot = (UIImage *)[info objectForKey:UIImagePickerControllerOriginalImage];
    
    [picker.parentViewController dismissViewControllerAnimated:YES completion:nil];
}

@end
