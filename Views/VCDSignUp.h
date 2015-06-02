//
//  VCDSignUp.h
//  DSchool
//
//  Created by sunjason on 15/6/3.
//  Copyright (c) 2015年 sunjason. All rights reserved.
//

#import "StandarViewController.h"
#import "TKRoundedView.h"

@interface VCDSignUp : StandarViewController <UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tblMainRegister;

@property (strong, nonatomic) IBOutlet UITableViewCell *CellRegPhone;
@property (strong, nonatomic) IBOutlet UITableViewCell *CellRegVerify;
@property (strong, nonatomic) IBOutlet UITableViewCell *CellRegPassword;
@property (strong, nonatomic) IBOutlet UITableViewCell *CellRegConfirm;
@property (strong, nonatomic) IBOutlet UITableViewCell *CellRegMain;
@property (strong, nonatomic) IBOutlet UIView *vFooter;

/********TKRoundedViews********/
@property (weak, nonatomic) IBOutlet TKRoundedView *tkvPhone;
@property (weak, nonatomic) IBOutlet TKRoundedView *tkvVerify;
@property (weak, nonatomic) IBOutlet TKRoundedView *tkvPassword;
@property (weak, nonatomic) IBOutlet TKRoundedView *tkvConfirm;


@property (weak, nonatomic) IBOutlet UITextField *tfRegPhone;

@property (weak, nonatomic) IBOutlet UITextField *tfRegVerify;
@property (weak, nonatomic) IBOutlet UIButton *btnGetVerifyCode;

@property (weak, nonatomic) IBOutlet UITextField *tfRegPassword;
@property (weak, nonatomic) IBOutlet UITextField *tfRegConfirm;
@property (weak, nonatomic) IBOutlet UIButton *btnRegister;
@property (weak, nonatomic) IBOutlet UIButton *btnLogin;
@property (weak, nonatomic) IBOutlet UIImageView *imvSeperator;

@end
