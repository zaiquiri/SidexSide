#import "ScenePartnerFoundViewController.h"

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

- (void)viewDidLoad {
    [headshotView setImage:scenePartner.headshot];
    [name setText:scenePartner.name];
    [unions setText:scenePartner.unions];
}

- (IBAction)newBreakdown:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
