#import "AppointmentLogisticsViewController.h"
#import <MapKit/MapKit.h>
#import "SidexSideAppointment.h"

@interface AppointmentLogisticsViewController()

@property (strong, nonatomic) IBOutlet UIButton *confirmButton;
@property (strong, nonatomic) IBOutlet UIPickerView *timePicker;
@property (strong, nonatomic) IBOutlet MKMapView *mapView;
@property (strong, nonatomic) IBOutlet UITextField *addressBox;


@end

@implementation AppointmentLogisticsViewController

@synthesize scenePartner;
@synthesize confirmButton;
@synthesize dateHelper;
@synthesize timePicker;
@synthesize pickerDelegateDataSource;
@synthesize mapView;
@synthesize userManager;
@synthesize addressBox;
@synthesize projectType;

- (void)viewDidLoad {
    NSString *confirmButtonText = [NSString stringWithFormat:@"Get confirmation from %@", scenePartner.name];
    [confirmButton setTitle:confirmButtonText forState:UIControlStateNormal];
    
    timePicker.delegate = pickerDelegateDataSource;
    timePicker.dataSource = pickerDelegateDataSource;
    
    [self setPickerToCurrentTime];
    [self setUpMapView];

}

- (void)setPickerToCurrentTime {
    [timePicker selectRow:(dateHelper.nowHour -1) inComponent:0 animated:YES];
    [timePicker selectRow:(dateHelper.nowMinute -1) inComponent:1 animated:YES];
    [timePicker selectRow:dateHelper.nowMeridiem inComponent:2 animated:YES];
}

- (void)setUpMapView {
    self.mapView.showsUserLocation = YES;
    [self.mapView.userLocation addObserver:self
                                forKeyPath:@"location"
                                   options:(NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld)
                                   context:NULL];
}

- (IBAction)sendConfirm:(id)sender {
    SidexSideAppointment *appointment = [[SidexSideAppointment alloc] initWithSenderId:[userManager userId]
                                                                              readerId:scenePartner.userId
                                                                                  hour:pickerDelegateDataSource.selectedHour
                                                                                minute:pickerDelegateDataSource.selectedMinute
                                                                              meridiem:pickerDelegateDataSource.selectedMeridiem
                                                                              location:addressBox.text
                                                                           projectType:projectType];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(appointmentSaved:) name:@"scenePartnerFound" object:appointment];
    
    [appointment save];
}

- (void)appointmentCreated:(NSNotification *)notification{
    SidexSideAppointment *appointment = (SidexSideAppointment *) notification.object;
    [appointment pushToScenePartner];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context {
    
    MKCoordinateRegion region;
    region.center = self.mapView.userLocation.coordinate;
    
    MKCoordinateSpan span;
    span.latitudeDelta  = 0.01;
    span.longitudeDelta = 0.01;
    region.span = span;
    [self.mapView setRegion:region animated:YES];
}

@end
