//
//  CellMessage.h
//  DSchool
//
//  Created by sunjason on 15/6/5.
//  Copyright (c) 2015年 sunjason. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CellMessage : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imvHead;
@property (weak, nonatomic) IBOutlet UIImageView *imvBudge;
@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UILabel *lblMessage;
@property (weak, nonatomic) IBOutlet UILabel *lblDateTime;

@end
