//
//  rfeCenterViewController.m
//  rfeTest01
//
//  Created by Juan Patino on 4/13/13.
//  Copyright (c) 2013 Juan Patino. All rights reserved.
//

#import "rfeCenterViewController.h"

#import "rfeSessionDetailViewController.h"
#import "rfeSessionDataController.h"
#import "rfeSession.h"

@interface rfeCenterViewController ()

@end

@implementation rfeCenterViewController

@synthesize cell;

@synthesize titleLabel;
@synthesize cellTitleLabel;



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    titleLabel = @"Center Page";
    
    self.navigationItem.title = titleLabel;
    self.dataController = [[rfeSessionDataController alloc] init];

    
//    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:nil action:nil];
//    self.navigationItem.rightBarButtonItem = rightButton;
//    NSLog(@"Button Pressed");
    
//    self.view.backgroundColor = [UIColor whiteColor];
//    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableView

- (NSUInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"Count of List is %i", [self.dataController countOfList]);
    return [self.dataController countOfList];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"Cell";
    static NSDateFormatter *formatter = nil;
    
    if (formatter == nil) {
        formatter = [[NSDateFormatter alloc] init];
        [formatter setDateStyle:NSDateFormatterShortStyle];
    }
    
    cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    // Set up the cell
    rfeSession *sessionAtIndex = [self.dataController objectInListAtIndex:indexPath.row];
    // configuring the cell
    [[cell textLabel] setText:[NSString stringWithFormat:@"%@", [sessionAtIndex.bodyPart objectAtIndex:1]]];
    [[cell detailTextLabel] setText:[formatter stringFromDate:(NSDate *)sessionAtIndex.date]];
    
    return cell;
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return NO;
}





























@end
