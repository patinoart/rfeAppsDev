//
//  rfeCenterViewController.m
//  rfeTest01
//
//  Created by Juan Patino on 4/13/13.
//  Copyright (c) 2013 Juan Patino. All rights reserved.
//

#import "rfeCenterViewController.h"
#import "CircleAppViewController.h"
#import "CircleApp.h"

@interface rfeCenterViewController ()

@end

@implementation rfeCenterViewController

@synthesize launchAppButton;

@synthesize titleLabel;

CGRect buttonFrame;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    circleAppGui = (CircleApp *)ofGetAppPtr();
    
    titleLabel = @"Center Page";
    
    self.navigationItem.title = titleLabel;
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:nil action:nil];
    self.navigationItem.rightBarButtonItem = rightButton;
    NSLog(@"Button Pressed");
    
    self.launchAppButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    CGRect button = [[UIScreen mainScreen] bounds];
    CGFloat buttonX = 50.0f;
    button.size.width -= 100.0f;
    button.size.height *= 0.15f;
    
    CGFloat buttonY = button.size.height - (button.size.height*0.25f);
    self.launchAppButton.frame = CGRectMake(buttonX, buttonY, button.size.width, button.size.height);
    
    self.launchAppButton.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin;
    [self.launchAppButton setTitle:@"Hide Center" forState:UIControlStateNormal];
    [self.launchAppButton addTarget:self action:@selector(_launchAppButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.launchAppButton];
    
    
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)_launchAppButton:(id)sender {
    
    // Below is the method to use the sender as an Action to change the ViewController to an oFApp
    /*
    //create the app
    CircleApp *circleApp = new CircleApp();
    
    // create the frame for the app. In this example we create it to
    // be the the same size as the screen and respect this views
    // orientation
    CGRect mainScreenFrame = [[UIScreen mainScreen] bounds];
    CGRect frame = mainScreenFrame;
    if (self.interfaceOrientation == UIInterfaceOrientationLandscapeLeft ||
        self.interfaceOrientation == UIInterfaceOrientationLandscapeRight) {
        frame.size.width = mainScreenFrame.size.height;
        frame.size.height = mainScreenFrame.size.width;
    }
     
    
    CircleAppViewController *circleAppViewController = [[CircleAppViewController alloc] initWithFrame:frame app:circleApp];
    [self.navigationController pushViewController:circleAppViewController animated:YES];
     */
    
    // Below is the method to use the sender as an Action that triggers a change on the ofApp
    UISwitch *toggle = sender;
    
    circleAppGui->bFill = [toggle isOn];
    
}

@end
