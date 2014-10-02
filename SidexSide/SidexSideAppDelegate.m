#import "SidexSideAppDelegate.h"
#import <Parse/Parse.h>
#import "SidexSideLoginViewController.h"
#import "SidexSideSignUpViewController.h"
#import "LogInAndSignUpHandler.h"
#import "LogInDelegate.h"
#import "SignUpDelegate.h"
#import "HomeViewController.h"
#import "SidexSideUser.h"
#import "MismatchPasswordAlert.h"
#import "HeadshotSelectionViewController.h"
#import "ImageResizer.h"
#import "BasicProfileDetailsViewController.h"
#import "AgeSelectionViewController.h"
#import "AgePickerDelegateDataSource.h"
#import "ProjectTypeDelegateDataSource.h"
#import "ProjectTypeSelectionViewController.h"
#import "UserFinder.h"
#import "ScenePartnerFoundViewController.h"
#import "TimePickerDelegateDataSource.h"
#import "DateHelper.h"

@implementation SidexSideAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [Parse setApplicationId:@"xMsrdzqyWstkeR2tiGr0xaMNso6Qhl8lTfSJO2QS"
                  clientKey:@"hEiLNnGFjDOu62b0cIKRqLJGgp9FjN7GyDSNLODF"];
    
    

    MissingInformationAlert *missingInfoAlert = [[MissingInformationAlert alloc] init];
    MismatchPasswordAlert *mismatchPasswordAlert = [[MismatchPasswordAlert alloc] init];
    InvalidEmailAlert *invalidEmailAlert = [[InvalidEmailAlert alloc] init];
    
    UserManager *userManager = [[UserManager alloc] init];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UINavigationController *createProfileController = [storyboard instantiateViewControllerWithIdentifier:@"createProfileNavigationController"];
    HeadshotSelectionViewController *headshotSelectionController = createProfileController.viewControllers[0];
    
    UIImagePickerController *headshotImagePicker = [[UIImagePickerController alloc] init];
    headshotImagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    headshotImagePicker.allowsEditing = NO;
    headshotImagePicker.delegate = headshotSelectionController;
    
    headshotSelectionController.imagePickerController = headshotImagePicker;
    headshotSelectionController.imageResizer = [[ImageResizer alloc] init];
    headshotSelectionController.userManager = userManager;
    
    LogInDelegate *logInDelegate = [[LogInDelegate alloc] initWithMissingInformationAlert:missingInfoAlert
                                                                  createProfileController:createProfileController
                                                                              userManager:userManager];
    
    SignUpDelegate *signUpDelegate =[[SignUpDelegate alloc] initWithMissingInformationAlert:missingInfoAlert
                                                                      mismatchPasswordAlert:mismatchPasswordAlert
                                                                          invalidEmailAlert:invalidEmailAlert];
    
    SidexSideSignUpViewController *signUpViewController = [[SidexSideSignUpViewController alloc] init];
    [signUpViewController setDelegate:signUpDelegate];
    SidexSideLoginViewController *logInViewController = [[SidexSideLoginViewController alloc] init];
    
    LogInAndSignUpHandler *logInAndSignUpHandler = [[LogInAndSignUpHandler alloc] initWithLogInViewController:logInViewController signUpViewController:signUpViewController logInDelegate:logInDelegate signUpDelegate:signUpDelegate];
    
    UINavigationController *rootNavigationController = (UINavigationController *) self.window.rootViewController;
    HomeViewController *homeViewController = (HomeViewController *)rootNavigationController.viewControllers[0];
    
    homeViewController.logInAndSignUpHandler = logInAndSignUpHandler;
    homeViewController.userManager = userManager;

    GenderPickerDelegateDataSource *genderPickerDelegateDataSource = [[GenderPickerDelegateDataSource alloc] initWithGenders:@[@"Male", @"Female", @"Doesn't Matter"]];
    
    homeViewController.pickerDelegateDataSource = genderPickerDelegateDataSource;
    
    AgePickerDelegateDataSource *agePickerDelegateDataSource = [[AgePickerDelegateDataSource alloc] initWithAgesFrom:18 through:99];
    
    homeViewController.agePickerDelegateDataSource = agePickerDelegateDataSource;
    
    ProjectTypeDelegateDataSource *projectTypeDelegateDataSource = [[ProjectTypeDelegateDataSource alloc] initWithProjectTypes:@[@"Theatre", @"Film", @"Television", @"Voiceover"]];
    
    homeViewController.projectTypeDelegateDataSource = projectTypeDelegateDataSource;
    
    UINavigationController *castingNavigationController = [storyboard instantiateViewControllerWithIdentifier:@"CastingNavigationController"];
    
    ScenePartnerFoundViewController *scenePartnerFoundViewController = castingNavigationController.viewControllers[0];
    
    DateHelper *dateHelper = [[DateHelper alloc] init];
    TimePickerDelegateDataSource *timePickerDelegateDataSource = [[TimePickerDelegateDataSource alloc] init];
    
    scenePartnerFoundViewController.dateHelper = dateHelper;
    scenePartnerFoundViewController.timePickerDelegateDataSource = timePickerDelegateDataSource;
    
    homeViewController.castingNavigationController = castingNavigationController;
    
    UserFinder *userFinder = [[UserFinder alloc] init];
    
    homeViewController.userFinder = userFinder;
    
    
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
