#import "HeadshotSelectionViewController.h"
#import <Parse/Parse.h>

@interface HeadshotSelectionViewController()
@property (strong, nonatomic) IBOutlet UIImageView *headshotDisplay;
@property (strong, nonatomic) UIImage *headshot;
@property (strong, nonatomic) IBOutlet UIButton *continueButton;
@property (nonatomic, assign) UIBackgroundTaskIdentifier fileUploadBackgroundTaskId;
@end

@implementation HeadshotSelectionViewController

@synthesize imagePickerController;
@synthesize imageResizer;

@synthesize headshotDisplay;
@synthesize headshot;
@synthesize fileUploadBackgroundTaskId;
@synthesize continueButton;

- (void)viewDidLoad {
    [headshotDisplay.layer setBorderColor:[[UIColor blackColor] CGColor]];
    [headshotDisplay.layer setBorderWidth:2.0];
    [continueButton setEnabled:NO];
}

- (IBAction)selectHeadshot {
    [self presentImagePicker];
}

- (IBAction)saveAndContinue {
    NSData *imageData = UIImageJPEGRepresentation(self.headshot, 0.8f);
    PFFile *imageFile = [PFFile fileWithData:imageData];
    [[UIApplication sharedApplication] beginBackgroundTaskWithExpirationHandler: ^{
        [[UIApplication sharedApplication] endBackgroundTask:self.fileUploadBackgroundTaskId];
    }];
    [imageFile saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        [[UIApplication sharedApplication] endBackgroundTask:self.fileUploadBackgroundTaskId];
    }];
    [[PFUser currentUser] setObject:imageFile forKey:@"headshot"];
}

- (void)presentImagePicker {
    [self presentViewController:imagePickerController animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info  {
    
    UIImage *originalImage = (UIImage *)[info objectForKey:UIImagePickerControllerOriginalImage];
    
    CGFloat horizontalRatio = headshotDisplay.bounds.size.width / originalImage.size.width;
    CGFloat verticalRatio = headshotDisplay.bounds.size.height / originalImage.size.height;
    CGFloat ratio = MIN(horizontalRatio, verticalRatio);
    CGSize newSize = CGSizeMake(originalImage.size.width * ratio, originalImage.size.height * ratio);
    
    UIImage *resizedImage = [imageResizer resizeImage:originalImage toSize:newSize];
    self.headshot = resizedImage;
    
    [headshotDisplay setImage:resizedImage];
    
    [continueButton setEnabled:YES];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void) imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
