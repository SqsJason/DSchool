//
//  VCDHome.h
//  DSchool
//
//  Created by sunjason on 15/6/6.
//  Copyright (c) 2015年 sunjason. All rights reserved.
//

#import "StandarViewController.h"

@interface VCDHome : StandarViewController<UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, strong) IBOutlet UISegmentedControl *segmentedControl;

@end
