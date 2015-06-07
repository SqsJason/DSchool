//
//  CellMessage.m
//  DSchool
//
//  Created by sunjason on 15/6/5.
//  Copyright (c) 2015年 sunjason. All rights reserved.
//

#import "CellMessage.h"

@implementation CellMessage
@synthesize imvHead;
@synthesize imvBudge;
@synthesize lblName;
@synthesize lblMessage;
@synthesize lblDateTime;

- (void)awakeFromNib {
    // Initialization code
    
    imvBudge.layer.cornerRadius  = imvBudge.frame.size.height/2;
    imvBudge.layer.masksToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
