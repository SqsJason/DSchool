//
//  VCDDiscovery.h
//  DSchool
//
//  Created by sunjason on 15/6/8.
//  Copyright (c) 2015年 sunjason. All rights reserved.
//

#import "StandarViewController.h"

@interface VCDDiscovery : StandarViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tblDiscovery;

@property (strong, nonatomic) IBOutlet UITableViewCell *CellAdView;
@property (strong, nonatomic) IBOutlet UITableViewCell *CellLifeService;
@property (strong, nonatomic) IBOutlet UITableViewCell *CellAssioAndStuUnion;
@property (strong, nonatomic) IBOutlet UITableViewCell *CellCanteen;

@property (weak, nonatomic) IBOutlet UIView *vADViewHolder;

@end
