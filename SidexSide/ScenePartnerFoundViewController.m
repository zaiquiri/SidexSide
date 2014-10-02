#import "ScenePartnerFoundViewController.h"
#import "AppointmentLogisticsViewController.h"

@interface ScenePartnerFoundViewController()

@property (strong, nonatomic) IBOutlet UIView *flipContainer;
@property (strong, nonatomic) IBOutlet UIImageView *headshotView;
@property (strong, nonatomic) IBOutlet UILabel *name;
@property (strong, nonatomic) IBOutlet UIScrollView *additionalInformationView;
@property (strong, nonatomic) IBOutlet UILabel *unions;
@end

@implementation ScenePartnerFoundViewController

@synthesize scenePartner;
@synthesize flipContainer;
@synthesize headshotView;
@synthesize additionalInformationView;
@synthesize name;
@synthesize unions;
@synthesize timePickerDelegateDataSource;
@synthesize dateHelper;

- (void)viewDidLoad {
    [headshotView setImage:scenePartner.headshot];
    [name setText:scenePartner.name];
    [unions setText:scenePartner.unions];
}

- (IBAction)newBreakdown:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    AppointmentLogisticsViewController *destinationViewController = (AppointmentLogisticsViewController *)segue.destinationViewController;
    destinationViewController.scenePartner = scenePartner;
    destinationViewController.dateHelper = dateHelper;
    destinationViewController.pickerDelegateDataSource = timePickerDelegateDataSource;
}

@end
