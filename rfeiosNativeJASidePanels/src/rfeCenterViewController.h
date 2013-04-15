//
//  rfeCenterViewController.h
//  rfeTest01
//
//  Created by Juan Patino on 4/13/13.
//  Copyright (c) 2013 Juan Patino. All rights reserved.
//

#import "rfeJADebugViewController.h"

@class rfeSessionDataController;

@interface rfeCenterViewController : rfeJADebugViewController

@property (strong, nonatomic) rfeSessionDataController *dataController;

@property (strong, nonatomic) IBOutlet UITableViewCell *cell;

@property (strong, nonatomic) NSString *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *cellTitleLabel;

@end
