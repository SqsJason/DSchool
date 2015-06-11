//
//  TableViewCell.h
//  DSchool
//
//  Created by sunjason on 15/6/6.
//  Copyright (c) 2015年 sunjason. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CellHomeDD : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imvHead;
@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UIImageView *imvGenderIcon;
@property (weak, nonatomic) IBOutlet UILabel *lblTimeAndSchool;
@property (weak, nonatomic) IBOutlet UILabel *lblReward;

@property (weak, nonatomic) IBOutlet UILabel *lblTaskContent;

@property (weak, nonatomic) IBOutlet UIView *vInfosHolder;
@property (weak, nonatomic) IBOutlet UILabel *lblSkentch;
@property (weak, nonatomic) IBOutlet UILabel *lblTime;
@property (weak, nonatomic) IBOutlet UILabel *lblAddress;

@property (weak, nonatomic) IBOutlet UIView *vButtonsHolder;
@property (weak, nonatomic) IBOutlet UIButton *btnGrab;
- (IBAction)btnGrab_action:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *btnCommentNum;
@property (weak, nonatomic) IBOutlet UIButton *btnZanNum;


@end
