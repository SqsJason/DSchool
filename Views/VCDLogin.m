//
//  VCDLogin.m
//  DSchool
//
//  Created by sunjason on 15/6/2.
//  Copyright (c) 2015年 sunjason. All rights reserved.
//

#import "VCDLogin.h"
#import "VCDSignUp.h"
#import "VCDSettings.h"

@interface VCDLogin ()

@property (nonatomic,retain) NSMutableArray *loginCellArray;

@end

@implementation VCDLogin

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //bake a cellArray to contain all cells
    self.loginCellArray = [NSMutableArray arrayWithObjects:_CellPhone, _CellPassword, _CellMainLogin, nil];
    
    [self doSomeUIInit];
}

- (void)doSomeUIInit
{
    _vHeader.backgroundColor = k_LoginColor_Header;
    
    _btnLogin.layer.cornerRadius = 5.0;
    _btnLogin.layer.masksToBounds = YES;
    [_btnLogin setBackgroundImage:[Util imageWithColorHigh:k_LoginColor_LoginButton withLowColor:UIColorFromRGB(LCTTAlertFRBGBtnDoneLow) withsize:_btnLogin.frame withHeightBottom:0] forState:UIControlStateNormal];
}

#pragma mark - tableview deleagate datasource stuff
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return _vHeader;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (SCREEN_HEIGHT_PORTRAIT <= 568) {
        return 180;
    }else if(SCREEN_HEIGHT_PORTRAIT <= 667){
        return 220;
    }else if(SCREEN_HEIGHT_PORTRAIT <= 736){
        return 260;
    }else{
        return 200;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return _vFooter;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (SCREEN_HEIGHT_PORTRAIT <= 568) {
        return 60;
    }else if(SCREEN_HEIGHT_PORTRAIT <= 667){
        return 140;
    }else if(SCREEN_HEIGHT_PORTRAIT <= 736){
        return 160;
    }else{
        return 20;
    }
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
    
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}



- (IBAction)actRememberPs:(id)sender {
}

- (IBAction)actForgetPs:(id)sender {
}

- (IBAction)actLogin:(id)sender {
    [appDelegate() showMainView];
}

- (IBAction)actGoRegister:(id)sender {
    VCDSignUp *signUp = [[VCDSignUp alloc] initWithNibName:@"VCDSignUp" bundle:nil];
    signUp.isSignUp = YES;
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:signUp];
    [self presentViewController:nav animated:YES completion:^{}];
}

- (IBAction)actWeChatLogin:(id)sender {
}

- (IBAction)actWeiboLogin:(id)sender {
}
- (IBAction)actQQLogin:(id)sender {
}
@end
