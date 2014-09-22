#import "SidexSideAppDelegate.h"
#import <Parse/Parse.h>
#import "SidexSideLoginViewController.h"
#import "SidexSideSignUpViewController.h"
#import "LogInAndSignUpHandler.h"
#import "LogInDelegate.h"
#import "SignUpDelegate.h"
#import "HomeViewController.h"
#import "SidexSidePFUser.h"

@implementation SidexSideAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [Parse setApplicationId:@"xMsrdzqyWstkeR2tiGr0xaMNso6Qhl8lTfSJO2QS"
                  clientKey:@"hEiLNnGFjDOu62b0cIKRqLJGgp9FjN7GyDSNLODF"];
    
    SidexSideLoginViewController *logInViewController = [[SidexSideLoginViewController alloc] init];
    SidexSideSignUpViewController *signUpViewController = [[SidexSideSignUpViewController alloc] init];
    LogInDelegate *logInDelegate = [[LogInDelegate alloc] init];
    SignUpDelegate *signUpDelegate =[[SignUpDelegate alloc] init];
    
    LogInAndSignUpHandler *logInAndSignUpHandler = [[LogInAndSignUpHandler alloc] initWithLogInViewController:logInViewController signUpViewController:signUpViewController logInDelegate:logInDelegate signUpDelegate:signUpDelegate];
    
    SidexSidePFUser *pfUser = [[SidexSidePFUser alloc] init];
    
    UINavigationController *rootNavigationController = (UINavigationController *) self.window.rootViewController;
    HomeViewController *homeViewController = (HomeViewController *)rootNavigationController.viewControllers[0];
    
    homeViewController.logInAndSignUpHandler = logInAndSignUpHandler;
    homeViewController.pfUser = pfUser;
    
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
