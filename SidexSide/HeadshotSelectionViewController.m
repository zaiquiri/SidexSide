#import "HeadshotSelectionViewController.h"
#import <Parse/Parse.h>
#import "BasicProfileDetailsViewController.h"

@interface HeadshotSelectionViewController()
@property (strong, nonatomic) IBOutlet UIImageView *headshotDisplay;
@property (strong, nonatomic) UIImage *headshot;
@property (strong, nonatomic) IBOutlet UIButton *continueButton;
@end

@implementation HeadshotSelectionViewController

@synthesize imagePickerController;
@synthesize imageResizer;
@synthesize userManager;
@synthesize headshotDisplay;
@synthesize headshot;
@synthesize continueButton;

- (void)viewDidLoad {
    [headshotDisplay.layer setBorderColor:[[UIColor blackColor] CGColor]];
    [headshotDisplay.layer setBorderWidth:2.0];
    [continueButton setEnabled:NO];
}

- (IBAction)selectHeadshot {
    [self presentViewController:imagePickerController animated:YES completion:nil];
}

- (IBAction)saveAndContinue {
    [userManager saveHeadshot:self.headshot];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info  {
    
    UIImage *originalImage = (UIImage *)[info objectForKey:UIImagePickerControllerOriginalImage];
    UIImage *resizedImage = [imageResizer resizeImage:originalImage forRect:headshotDisplay.bounds];
    
    self.headshot = resizedImage;
    [headshotDisplay setImage:resizedImage];
    
    [continueButton setEnabled:YES];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void) imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    BasicProfileDetailsViewController *destinationViewController = (BasicProfileDetailsViewController *) segue.destinationViewController;
    destinationViewController.userManager = userManager;
}

@end
