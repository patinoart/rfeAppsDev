//
//  rfeLeftViewController.m
//  rfeTest01
//
//  Created by Juan Patino on 4/13/13.
//  Copyright (c) 2013 Juan Patino. All rights reserved.
//

#import "rfeLeftViewController.h"
#import "JASidePanelController.h"

#import "UIViewController+JASidePanel.h"
#import "rfeRightViewController.h"
#import "rfeCenterViewController.h"

@interface rfeLeftViewController ()

@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UIButton *hide;
@property (nonatomic, strong) UIButton *show;
@property (nonatomic, strong) UIButton *removeRightPanel;
@property (nonatomic, strong) UIButton *addRightPanel;
@property (nonatomic, strong) UIButton *changeCenterPanel;

@end

@implementation rfeLeftViewController

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
    
    self.view.backgroundColor = [UIColor blackColor];
    
    UILabel *label  = [[UILabel alloc] init];
    label.font = [UIFont fontWithName:@"MavenPro-Regular" size:20.0f];
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = [UIColor clearColor];
	label.text = @"(renforce)";
	[label sizeToFit];
	label.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin;
    [self.view addSubview:label];
    self.label = label;
    /*
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(20.0f, 70.0f, 200.0f, 40.0f);
    button.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin;
    [button setTitle:@"Hide Center" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(_hideTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    self.hide = button;
    
    button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = self.hide.frame;
    button.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin;
    [button setTitle:@"Show Center" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(_showTapped:) forControlEvents:UIControlEventTouchUpInside];
    button.hidden = YES;
    [self.view addSubview:button];
    self.show = button;
    
    button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(20.0f, 120.0f, 200.0f, 40.0f);
    button.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin;
    [button setTitle:@"Remove Right Panel" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(_removeRightPanelTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    self.removeRightPanel = button;
    
    button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = self.removeRightPanel.frame;
    button.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin;
    [button setTitle:@"Add Right Panel" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(_addRightPanelTapped:) forControlEvents:UIControlEventTouchUpInside];
    button.hidden = YES;
    [self.view addSubview:button];
    self.addRightPanel = button;
    
    button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(20.0f, 170.0f, 200.0f, 40.0f);
    button.autoresizingMask = UIViewAutoresizingFlexibleRightMargin;
    [button setTitle:@"Change Center Panel" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(_changeCenterPanelTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    self.changeCenterPanel = button;
    */
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.label.center = CGPointMake(floorf(self.sidePanelController.leftVisibleWidth/2.0f), 25.0f);
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*
#pragma mark - Button Actions

- (void)_hideTapped:(id)sender {
    [self.sidePanelController setCenterPanelHidden:YES animated:YES duration:0.2f];
    self.hide.hidden = YES;
    self.show.hidden = NO;
}

- (void)_showTapped:(id)sender {
    [self.sidePanelController setCenterPanelHidden:NO animated:YES duration:0.2f];
    self.hide.hidden = NO;
    self.show.hidden = YES;
}

- (void)_removeRightPanelTapped:(id)sender {
    self.sidePanelController.rightPanel = nil;
    self.removeRightPanel.hidden = YES;
    self.addRightPanel.hidden = NO;
}

- (void)_addRightPanelTapped:(id)sender {
    self.sidePanelController.rightPanel = [[rfeRightViewController alloc] init];
    self.removeRightPanel.hidden = NO;
    self.addRightPanel.hidden = YES;
}

- (void)_changeCenterPanelTapped:(id)sender {
    self.sidePanelController.centerPanel = [[UINavigationController alloc] initWithRootViewController:[[rfeCenterViewController alloc] init]];
}
*/
@end
