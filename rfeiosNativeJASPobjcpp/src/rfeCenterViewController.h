//
//  rfeCenterViewController.h
//  rfeTest01
//
//  Created by Juan Patino on 4/13/13.
//  Copyright (c) 2013 Juan Patino. All rights reserved.
//

#import "rfeJADebugViewController.h"
#include "CircleApp.h"

@interface rfeCenterViewController : rfeJADebugViewController {
    CircleApp *circleAppGui;
}

@property (strong, nonatomic) NSString *titleLabel;

@property (nonatomic, strong) UIButton *launchAppButton;

-(IBAction)_launchAppButton:(id)sender;

@end
