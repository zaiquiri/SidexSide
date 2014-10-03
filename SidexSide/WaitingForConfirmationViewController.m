#import "WaitingForConfirmationViewController.h"

#define FLIP_WAIT_TIME 2.0

@interface WaitingForConfirmationViewController()

@property (strong, nonatomic) IBOutlet UIView *flipContainer;
@property (strong, nonatomic) IBOutlet UIView *infoView;
@property (strong, nonatomic) IBOutlet UILabel *additionalInfoMessage;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *spinner;
@property (strong, nonatomic) IBOutlet UILabel *waitingMessage;
@property (strong, nonatomic) IBOutlet UIView *waitingView;
@property (nonatomic) BOOL flipped;

@end

@implementation WaitingForConfirmationViewController

@synthesize waitingMessage;
@synthesize scenePartner;
@synthesize spinner;
@synthesize infoView;
@synthesize additionalInfoMessage;
@synthesize flipped;
@synthesize flipContainer;
@synthesize waitingView;

- (void)viewDidLoad {
    [waitingMessage setText:[NSString stringWithFormat:@"Request sent! Waiting got %@ to comfirm...", scenePartner.name]];
    [additionalInfoMessage setText:[NSString stringWithFormat:@"Give %@ some more info about your appointment", scenePartner.name]];
    [spinner startAnimating];
    [infoView setHidden:YES];
    flipped = NO;
    [self performSelector:@selector(flip) withObject:nil afterDelay:FLIP_WAIT_TIME];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    for (UIView * txt in self.view.subviews){
        if ([txt isKindOfClass:[UITextField class]] && [txt isFirstResponder]) {
            [txt resignFirstResponder];
        }
    }
}

- (IBAction)sendInfo:(id)sender {
    [self flip];
}

- (void)flip {
    [UIView transitionWithView:flipContainer duration:1 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
        if (!flipped){
            [waitingView setHidden:YES];
            [infoView setHidden:NO];
            flipped = YES;
        } else {
            [infoView setHidden:YES];
            [waitingView setHidden:NO];
        }
        
    } completion:nil];
}

@end
