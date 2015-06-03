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

/********Cell for signup********/
@property (strong, nonatomic) IBOutlet UITableViewCell *CellRegPhone;
@property (strong, nonatomic) IBOutlet UITableViewCell *CellRegVerify;
@property (strong, nonatomic) IBOutlet UITableViewCell *CellRegPassword;
@property (strong, nonatomic) IBOutlet UITableViewCell *CellRegConfirm;
@property (strong, nonatomic) IBOutlet UITableViewCell *CellRegMain;
@property (strong, nonatomic) IBOutlet UIView *vFooter;

/********Cell for profile********/
@property (strong, nonatomic) IBOutlet UITableViewCell *CellRegNickName;
@property (strong, nonatomic) IBOutlet UITableViewCell *CellRegGender;
@property (strong, nonatomic) IBOutlet UITableViewCell *CellRegAge;
@property (strong, nonatomic) IBOutlet UITableViewCell *CellRegSchool;
@property (strong, nonatomic) IBOutlet UITableViewCell *CellRegDone;
@property (strong, nonatomic) IBOutlet UITableViewCell *CellProfileHead;


/********TKRoundedViews For Profile********/
@property (weak, nonatomic) IBOutlet TKRoundedView *tkvNickName;
@property (weak, nonatomic) IBOutlet TKRoundedView *tkvGender;
@property (weak, nonatomic) IBOutlet TKRoundedView *tkvAge;
@property (weak, nonatomic) IBOutlet TKRoundedView *tkvSchool;
@property (weak, nonatomic) IBOutlet UIImageView *imvSeperatorDone;

@property (weak, nonatomic) IBOutlet UIButton *btnSignUpDone;
- (IBAction)actSignUpDone:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *btnLoginDone;

@property (weak, nonatomic) IBOutlet UIImageView *imvHeadImage;
@property (weak, nonatomic) IBOutlet UIButton *btnAddHead;
- (IBAction)actAddHeadImage:(id)sender;


/********TKRoundedViews For SignUp********/
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

/********Button actions********/
- (IBAction)actGetVerify:(id)sender;
- (IBAction)actRegister:(id)sender;
- (IBAction)actGoLogin:(id)sender;

@property(nonatomic) BOOL isSignUp;

@end
