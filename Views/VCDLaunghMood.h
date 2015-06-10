//
//  VCDLaunghMood.h
//  DSchool
//
//  Created by sunjason on 15/6/11.
//  Copyright (c) 2015年 sunjason. All rights reserved.
//

#import "StandarViewController.h"

@interface VCDLaunghMood : StandarViewController

@property (weak, nonatomic) IBOutlet UITableView *tblPubMood;
@property (weak, nonatomic) IBOutlet UICollectionView *cvPubMood;


@property (strong, nonatomic) IBOutlet UITableViewCell *CellTime;
@property (strong, nonatomic) IBOutlet UITableViewCell *CellContent;
@property (strong, nonatomic) IBOutlet UITableViewCell *CellReward;
@property (strong, nonatomic) IBOutlet UITableViewCell *CellPeopleNumber;

@property (weak, nonatomic) IBOutlet UILabel *lblTime;
@property (weak, nonatomic) IBOutlet UITextView *tvInputContent;
@property (weak, nonatomic) IBOutlet UILabel *lblReward;
@property (weak, nonatomic) IBOutlet UILabel *lblPeopleNumber;


@end
