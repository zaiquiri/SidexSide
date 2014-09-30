#import "ReviewBreakdownViewController.h"

@interface ReviewBreakdownViewController()

@property (strong, nonatomic) IBOutlet UILabel *breakdown;

@end

@implementation ReviewBreakdownViewController

@synthesize selectedAge;
@synthesize selectedGender;
@synthesize selectedProjectType;
@synthesize breakdown;
@synthesize userFinder;

- (void)viewDidLoad{
    [breakdown setText:[self breakdownText]];
}

- (NSString *)breakdownText {
    return [NSString stringWithFormat:@"Seeking a %@ scene partner around %@ years of age to read with me for a %@ project", selectedGender, selectedAge, selectedProjectType];
}

- (IBAction)sendBreakdown:(id)sender {
    //Show finding in progress
    [userFinder findScenePartnerAndPresentFrom:self.navigationController completion:^{
        [self.navigationController popToRootViewControllerAnimated:NO];
    }];
}

@end
