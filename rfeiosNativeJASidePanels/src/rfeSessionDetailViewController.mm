//
//  rfeSessionDetailViewController.m
//  RfeOfJATest
//
//  Created by Juan Patino on 4/14/13.
//
//

#import "rfeSessionDetailViewController.h"
#import "rfeSession.h"

@interface rfeSessionDetailViewController ()

-(void)configureView;

@end

@implementation rfeSessionDetailViewController

#pragma mark - Managing the detail item

- (void)setSession:(rfeSession *)newSession {
    
    if (_session != newSession) {
        _session = newSession;
        
        // Update View
        [self configureView];
    }
    
}

- (void)configureView {
    
    // Update the user interface for the detail item
    
    rfeSession *theSession = self.session;
    static NSDateFormatter *formatter = nil;
    
    if (formatter == nil) {
        formatter = [[NSDateFormatter alloc] init];
        [formatter setDateStyle:NSDateFormatterShortStyle];
    }
    
    if (theSession) {
        self.bodyPartNameLabel.text = [NSString stringWithFormat:@"%@", [theSession.bodyPart objectAtIndex:1]];
        self.beforeSessionLabel.text = [NSString stringWithFormat:@"%i", theSession.beforeSession];
        self.afterSessionLabel.text = [NSString stringWithFormat:@"%i", theSession.afterSession];
        self.intensityLabel.text = [NSString stringWithFormat:@"%@", [theSession.intensity objectAtIndex:2]];
        self.frequencyLabel.text = [NSString stringWithFormat:@"%@", [theSession.frequency objectAtIndex:0]];
        self.dateLabel.text = [formatter stringFromDate:(NSDate *)theSession.date];
    }
    
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        self.tableView;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
