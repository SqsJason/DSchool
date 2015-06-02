//
//  VCSLogin.h
//  ShipWarning
//
//  Created by sunjason on 15/5/6.
//
//

#import <UIKit/UIKit.h>
#import "ASTextField.h"
#import "StandarViewController.h"

@interface VCSLogin : StandarViewController<UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tblLoginHolder;
@property (strong, nonatomic) IBOutlet UITableViewCell *userNameCell;
@property (strong, nonatomic) IBOutlet UITableViewCell *passwordCell;
@property (strong, nonatomic) IBOutlet UITableViewCell *loginBtnCell;
@property (strong, nonatomic) IBOutlet UITableViewCell *loginTitleCell;


@property (weak, nonatomic) IBOutlet UILabel *lblLoginTitle;
@property (weak, nonatomic) IBOutlet ASTextField *tfUserName;
@property (weak, nonatomic) IBOutlet ASTextField *tfPassword;
@property (weak, nonatomic) IBOutlet UIButton *btnLogin;

- (IBAction)btnLoginAction:(id)sender;

@end
