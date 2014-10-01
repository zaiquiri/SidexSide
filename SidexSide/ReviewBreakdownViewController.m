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
@synthesize castingNavigationController;

- (void)viewDidLoad{
    [breakdown setText:[self breakdownText]];
}

- (NSString *)breakdownText {
    return [NSString stringWithFormat:@"Seeking a %@ scene partner around %@ years of age to read with me for a %@ project", selectedGender, selectedAge, selectedProjectType];
}

- (IBAction)sendBreakdown:(id)sender {
    //Show finding in progress
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(scenePartnerFound) name:@"scenePartnerFound" object:userFinder];
    
    [userFinder findScenePartnerWithGender:selectedGender
                                       age:selectedAge
                               projectType:selectedProjectType];
}

- (void)scenePartnerFound {
    
    if (!userFinder.somethingBad){
        [[[UIAlertView alloc] initWithTitle:@"Yaay!"
                                    message:@"I got the notification!"
                                   delegate:nil
                          cancelButtonTitle:@"WOOT"
                          otherButtonTitles:nil, nil] show];
        //dismiss finding in progress visual
        //Inject info from userFinder into scenePartnerFoundViewController;
        //[self presentViewController:castingNavigationController animated:YES completion:nil];
        //[self.navigationController popToRootViewControllerAnimated:NO];
    } else {
        //dismiss finding in progress visual
        NSLog(@"%@", userFinder.somethingBad);
        [[[UIAlertView alloc] initWithTitle:@"Oops!"
                                    message:@"There was an error finding your scene partner!"
                                   delegate:nil
                          cancelButtonTitle:@"Try again"
                          otherButtonTitles:nil, nil] show];
    }
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"scenePartnerFound" object:nil];
}

@end
