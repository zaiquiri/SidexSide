#import "SidexSideLoginViewController.h"

@interface SidexSideLoginViewController()

@end

@implementation SidexSideLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.logInView setLogo:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo.png"]]];
}

@end
