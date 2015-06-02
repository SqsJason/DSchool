//
//  VCDLogin.h
//  DSchool
//
//  Created by sunjason on 15/6/2.
//  Copyright (c) 2015年 sunjason. All rights reserved.
//

#import "StandarViewController.h"

@interface VCDLogin : StandarViewController <UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITableViewCell *CellPhone;
@property (strong, nonatomic) IBOutlet UITableViewCell *CellPassword;
@property (strong, nonatomic) IBOutlet UITableViewCell *CellMainLogin;
@property (strong, nonatomic) IBOutlet UIView *vHeader;
@property (strong, nonatomic) IBOutlet UIView *vFooter;
@property (weak, nonatomic) IBOutlet UIImageView *imvHeaderImage;

/***************/
@property (weak, nonatomic) IBOutlet UITableView *tblMainLogin;

/***************/
@property (weak, nonatomic) IBOutlet UIImageView *imvPhoneImage;
@property (weak, nonatomic) IBOutlet UITextField *tfPhone;
@property (weak, nonatomic) IBOutlet UILabel *lblPhoneSeperator;

/***************/
@property (weak, nonatomic) IBOutlet UIImageView *imvPasswordImage;
@property (weak, nonatomic) IBOutlet UITextField *tfPassword;

/***************/
@property (weak, nonatomic) IBOutlet UIButton *btnLogin;
@property (weak, nonatomic) IBOutlet UIButton *btnRegister;
@property (weak, nonatomic) IBOutlet UILabel *lblSeperatorL;
@property (weak, nonatomic) IBOutlet UILabel *lblSeperatorR;
@property (weak, nonatomic) IBOutlet UILabel *lblQuickLogin;

@property (weak, nonatomic) IBOutlet UIButton *btnRememberPs;
@property (weak, nonatomic) IBOutlet UIButton *btnForgetPs;

@property (weak, nonatomic) IBOutlet UIView *vQuickLoginHolder;
@property (weak, nonatomic) IBOutlet UIButton *btnQQ;
@property (weak, nonatomic) IBOutlet UIButton *btnWeiBo;
@property (weak, nonatomic) IBOutlet UIButton *btnWeiXin;

/********Button Actions*******/
- (IBAction)actRememberPs:(id)sender;
- (IBAction)actForgetPs:(id)sender;
- (IBAction)actLogin:(id)sender;
- (IBAction)actGoRegister:(id)sender;
- (IBAction)actWeChatLogin:(id)sender;
- (IBAction)actWeiboLogin:(id)sender;
- (IBAction)actQQLogin:(id)sender;


@end
