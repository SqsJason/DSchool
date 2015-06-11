//
//  VCDSettings.h
//  DSchool
//
//  Created by sunjason on 15/6/3.
//  Copyright (c) 2015年 sunjason. All rights reserved.
//

#import "StandarViewController.h"
#import "TKRoundedView.h"

@interface VCDSettings : StandarViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tblSettings;
@property (strong, nonatomic) IBOutlet UITableViewCell *CellSettingsTitle;
@property (weak, nonatomic) IBOutlet TKRoundedView *tkvSettingsTitleBG;
@property (weak, nonatomic) IBOutlet UIImageView *imvHead;
@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UILabel *lblPhone;
@property (weak, nonatomic) IBOutlet UIImageView *imvGnder;
@property (weak, nonatomic) IBOutlet UIButton *btnShowDetail;


@property (strong, nonatomic) IBOutlet UITableViewCell *CellSettingsCustoms;
@property (weak, nonatomic) IBOutlet UIImageView *imvIcon;
@property (weak, nonatomic) IBOutlet UILabel *lblBasicInfo;

@property (strong, nonatomic) IBOutlet UITableViewCell *CellZan;
@property (strong, nonatomic) IBOutlet UITableViewCell *CellNotice;
@property (strong, nonatomic) IBOutlet UITableViewCell *CellAdvice;
@property (strong, nonatomic) IBOutlet UITableViewCell *CellUpdatePs;
@property (strong, nonatomic) IBOutlet UITableViewCell *CellOtherSets;

@property (strong, nonatomic) IBOutlet UITableViewCell *CellVipsRight;
@property (strong, nonatomic) IBOutlet UITableViewCell *CellMinePoints;
@property (strong, nonatomic) IBOutlet UITableViewCell *CellVipsCard;


@property (strong, nonatomic) IBOutlet UIView *vFooterV;
@property (weak, nonatomic) IBOutlet UIButton *btnExit;
- (IBAction)btnLogout_action:(id)sender;

@property (strong, nonatomic) IBOutlet UITableViewCell *CellExit;

/**
 *  Actions For TitleCell
 */
@property (weak, nonatomic) IBOutlet UIButton *btnViewProfile;
- (IBAction)btnViewProfile_action:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *lblTaskNumber;
@property (weak, nonatomic) IBOutlet UIButton *btnRenWu;
- (IBAction)btnRenWu_action:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *lblSCNumber;
@property (weak, nonatomic) IBOutlet UIButton *btnSchoolCircle;
- (IBAction)btnSchoolCircle_action:(id)sender;


@end
