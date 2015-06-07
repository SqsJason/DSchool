//
//  VCDHome.m
//  DSchool
//
//  Created by sunjason on 15/6/6.
//  Copyright (c) 2015年 sunjason. All rights reserved.
//

#import "VCDHome.h"

@interface VCDHome ()

@end

@implementation VCDHome

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.titleView = _segmentedControl;
}

@end
