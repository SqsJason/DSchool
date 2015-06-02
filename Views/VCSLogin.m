//
//  VCSLogin.m
//  ShipWarning
//
//  Created by sunjason on 15/5/6.
//
//

#import "VCSLogin.h"
#import "SVLogin.h"
#import "VCSHome.h"
#import "SHXMLParser.h"

@interface VCSLogin ()

@property (nonatomic,retain) NSMutableArray *loginCellArray;

@end

@implementation VCSLogin

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"CommonBG"]];
    self.tblLoginHolder.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"CommonBG"]];
    
    //bake a cellArray to contain all cells
    self.loginCellArray = [NSMutableArray arrayWithObjects:_loginTitleCell, _userNameCell, _passwordCell, _loginBtnCell, nil];
    
    
    //setup text field with respective icons
    [_tfUserName setupTextFieldWithIconName:@"user_name_icon"];
    [_tfPassword setupTextFieldWithIconName:@"password_icon"];
    
    _tfUserName.delegate = self;
    _tfPassword.delegate = self;
    
    NSUserDefaults *userDefaults = [[NSUserDefaults alloc] init];
    if ([userDefaults objectForKey:LSSTRING(@"Key_UserDefaults_Username")] != nil &&
        [userDefaults objectForKey:LSSTRING(@"Key_UserDefaults_Password")] != nil) {
        _tfUserName.text = [userDefaults objectForKey:LSSTRING(@"Key_UserDefaults_Username")];
        _tfPassword.text = [userDefaults objectForKey:LSSTRING(@"Key_UserDefaults_Password")];
    }
    
    UITapGestureRecognizer *tapActionTable = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(resignAllResponders)];
    [_tblLoginHolder addGestureRecognizer:tapActionTable];
    
    UITapGestureRecognizer *tapActionView = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(resignAllResponders)];
    [self.view addGestureRecognizer:tapActionView];
}

#pragma mark - tableview deleagate datasource stuff
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 0)];
    headView.backgroundColor = [UIColor blackColor];
    return headView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 0)];
    headView.backgroundColor = [UIColor blackColor];
    return headView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //return cell's height for particular row
    return ((UITableViewCell*)[self.loginCellArray objectAtIndex:indexPath.row]).frame.size.height;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //return number of cells for the table
    return self.loginCellArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    //return cell for particular row
    cell = [self.loginCellArray objectAtIndex:indexPath.row];
    
    [cell setBackgroundColor:[UIColor clearColor]];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    return cell;
}

- (IBAction)btnLoginAction:(id)sender {
    [self resignAllResponders];
    
    [self loginMethod];
}

-(void)loginMethod
{
    if ([Util isNullOrNilObject:_tfUserName.text] ||
        [_tfUserName.text isEqualToString:@""]) {
        OLGhostAlertView *toastName = [[OLGhostAlertView alloc] initWithTitle:nil message:LSSTRING(@"Str_Login_UsernameRequired")];
        [toastName show];
    }else if ([Util isNullOrNilObject:_tfPassword.text] ||
              [_tfPassword.text isEqualToString:@""]){
        OLGhostAlertView *toastName = [[OLGhostAlertView alloc] initWithTitle:nil message:LSSTRING(@"Str_Login_PasswordRequired")];
        [toastName show];
    }else{
        SVLogin *login = [[SVLogin alloc] init];
        
        [SVProgressHUD show];
        NSDictionary *parameters = @{@"userName": [_tfUserName.text stringByTrimmingCharactersInSet:
                                                   [NSCharacterSet whitespaceCharacterSet]],
                                     @"userPassword":[_tfPassword.text stringByTrimmingCharactersInSet:
                                                      [NSCharacterSet whitespaceCharacterSet]],
                                     @"IMEI":@"123"};
        [login loginWithParameters:parameters success:^(NSData *response) {
            [SVProgressHUD dismiss];
            
            NSUserDefaults *userDefaults = [[NSUserDefaults alloc] init];
            [userDefaults setValue:_tfUserName.text forKey:LSSTRING(@"Key_UserDefaults_Username")];
            [userDefaults setValue:_tfPassword.text forKey:LSSTRING(@"Key_UserDefaults_Password")];
            [userDefaults synchronize];
            
            NSDictionary *contentDic = [Util parseToJson:response];
            DLog(@"Parse: -> %@",contentDic);
            
            if ([[contentDic objectForKey:@"status"] isEqualToString:@"ok"]) {
                VCSHome *gotoHome = [[VCSHome alloc] initWithNibName:@"VCSHome" bundle:nil];
                UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:gotoHome];
                [self presentViewController:nav animated:NO completion:^{}];
            }else{
                OLGhostAlertView *toastName = [[OLGhostAlertView alloc] initWithTitle:nil message:LSSTRING(@"Str_Login_RequestFailed")];
                [toastName show];
            }
        } failure:^(NSError *error) {
            [SVProgressHUD dismiss];
            OLGhostAlertView *toastName = [[OLGhostAlertView alloc] initWithTitle:nil message:LSSTRING(@"Str_Overall_RequestFailed")];
            [toastName show];
        }];
    }
}

- (void)resignAllResponders{
    [_tfUserName resignFirstResponder];
    [_tfPassword resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField == _tfUserName) {
        [_tfPassword becomeFirstResponder];
    }else{
        [_tfPassword resignFirstResponder];
        [self loginMethod];
    }
    return YES;
}

@end
