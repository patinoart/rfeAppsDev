//
//  rfeLeftViewController.h
//  rfeTest01
//
//  Created by Juan Patino on 4/13/13.
//  Copyright (c) 2013 Juan Patino. All rights reserved.
//

#import "rfeJADebugViewController.h"

@interface rfeLeftViewController : rfeJADebugViewController

@property (nonatomic, strong, readonly) UILabel *label;
@property (nonatomic, strong, readonly) UIButton *hide;
@property (nonatomic, strong, readonly) UIButton *show;
@property (nonatomic, strong, readonly) UIButton *removeRightPanel;
@property (nonatomic, strong, readonly) UIButton *addRightPanel;
@property (nonatomic, strong, readonly) UIButton *changeCenterPanel;

@end
