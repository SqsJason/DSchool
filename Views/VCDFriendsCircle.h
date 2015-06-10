//
//  VCDFriendsCircle.h
//  DSchool
//
//  Created by iosdeveloper on 15/6/8.
//  Copyright (c) 2015年 sunjason. All rights reserved.
//

#import "StandarViewController.h"

@interface VCDFriendsCircle : StandarViewController

@property (nonatomic, retain) NSMutableArray * dataArray;
@property (weak, nonatomic) IBOutlet UITableView *tblCircle;
@property (weak, nonatomic) IBOutlet UIView *advFriendsCircle;

@end
