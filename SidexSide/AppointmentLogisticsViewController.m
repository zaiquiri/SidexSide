#import "AppointmentLogisticsViewController.h"
#import <MapKit/MapKit.h>

@interface AppointmentLogisticsViewController()

@property (strong, nonatomic) IBOutlet UIButton *confirmButton;
@property (strong, nonatomic) IBOutlet UIPickerView *timePicker;
@property (strong, nonatomic) IBOutlet MKMapView *mapView;


@end

@implementation AppointmentLogisticsViewController

@synthesize scenePartner;
@synthesize confirmButton;
@synthesize dateHelper;
@synthesize timePicker;
@synthesize pickerDelegateDataSource;
@synthesize mapView;

- (void)viewDidLoad {
    NSString *confirmButtonText = [NSString stringWithFormat:@"Get confirmation from %@", scenePartner.name];
    [confirmButton setTitle:confirmButtonText forState:UIControlStateNormal];
    
    timePicker.delegate = pickerDelegateDataSource;
    timePicker.dataSource = pickerDelegateDataSource;
    
    [timePicker selectRow:(dateHelper.nowHour -1) inComponent:0 animated:YES];
    [timePicker selectRow:(dateHelper.nowMinute -1) inComponent:1 animated:YES];
    [timePicker selectRow:dateHelper.nowMeridiem inComponent:2 animated:YES];
    
    self.mapView.showsUserLocation = YES;
    [self.mapView.userLocation addObserver:self
                                forKeyPath:@"location"
                                   options:(NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld)
                                   context:NULL];

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
