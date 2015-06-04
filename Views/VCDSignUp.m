//
//  VCDSignUp.m
//  DSchool
//
//  Created by sunjason on 15/6/3.
//  Copyright (c) 2015年 sunjason. All rights reserved.
//

#import "VCDSignUp.h"

@interface VCDSignUp ()

@property (nonatomic,retain) NSMutableArray *registerCellArray;

@end

@implementation VCDSignUp
@synthesize isSignUp;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    if (isSignUp) {
        self.title = @"注册";
        [self doSomeUIInitForSignUp];
    }else{
        self.title = @"填写资料";
        [self doSomeUIInitForProfile];
    }
    
    [_tblMainRegister reloadData];
}

- (void)doSomeUIInitForSignUp
{
    //bake a cellArray to contain all cells
    self.registerCellArray = [NSMutableArray arrayWithObjects:_CellRegPhone, _CellRegVerify, _CellRegPassword, _CellRegConfirm, _CellRegMain, nil];
    
    _btnRegister.layer.cornerRadius = 5.0;
    _btnRegister.layer.masksToBounds = YES;
    [_btnRegister setBackgroundImage:[Util imageWithColorHigh:k_LoginColor_Header withLowColor:UIColorFromRGB(LCTTAlertFRBGBtnDoneLow) withsize:_btnLogin.frame withHeightBottom:0] forState:UIControlStateNormal];
    
    _btnGetVerifyCode.layer.cornerRadius = 4.0;
    _btnGetVerifyCode.layer.masksToBounds = YES;
    [_btnGetVerifyCode setBackgroundImage:[Util imageWithColorHigh:k_LoginColor_Header withLowColor:UIColorFromRGB(LCTTAlertFRBGBtnDoneLow) withsize:_btnLogin.frame withHeightBottom:0] forState:UIControlStateNormal];
    
    _tkvPhone.drawnBordersSides = TKDrawnBorderSidesAll;
    _tkvPhone.borderColor = CLQAChatMsgBorder;
    _tkvPhone.fillColor = [UIColor whiteColor];
    _tkvPhone.borderWidth = 1.0f;
    
    _tkvVerify.drawnBordersSides = TKDrawnBorderSidesRight | TKDrawnBorderSidesLeft | TKDrawnBorderSidesBottom;
    _tkvVerify.borderColor = CLQAChatMsgBorder;
    _tkvVerify.fillColor = [UIColor whiteColor];
    _tkvVerify.borderWidth = 1.0f;
    
    _tkvPassword.drawnBordersSides = TKDrawnBorderSidesRight | TKDrawnBorderSidesLeft | TKDrawnBorderSidesBottom;
    _tkvPassword.borderColor = CLQAChatMsgBorder;
    _tkvPassword.fillColor = [UIColor whiteColor];
    _tkvPassword.borderWidth = 1.0f;
    
    _tkvConfirm.drawnBordersSides = TKDrawnBorderSidesRight | TKDrawnBorderSidesLeft | TKDrawnBorderSidesBottom;
    _tkvConfirm.borderColor = CLQAChatMsgBorder;
    _tkvConfirm.fillColor = [UIColor whiteColor];
    _tkvConfirm.borderWidth = 1.0f;
}

- (void)doSomeUIInitForProfile
{
    //bake a cellArray to contain all cells
    self.registerCellArray = [NSMutableArray arrayWithObjects: _CellProfileHead, _CellRegNickName, _CellRegGender, _CellRegAge, _CellRegSchool, _CellRegDone, nil];
    
    _btnSignUpDone.layer.cornerRadius = 5.0;
    _btnSignUpDone.layer.masksToBounds = YES;
    [_btnSignUpDone setBackgroundImage:[Util imageWithColorHigh:k_LoginColor_Header withLowColor:UIColorFromRGB(LCTTAlertFRBGBtnDoneLow) withsize:_btnSignUpDone.frame withHeightBottom:0] forState:UIControlStateNormal];
    
    _tkvNickName.drawnBordersSides = TKDrawnBorderSidesAll;
    _tkvNickName.borderColor = CLQAChatMsgBorder;
    _tkvNickName.fillColor = [UIColor whiteColor];
    _tkvNickName.borderWidth = 1.0f;
    
    _tkvGender.drawnBordersSides = TKDrawnBorderSidesRight | TKDrawnBorderSidesLeft | TKDrawnBorderSidesBottom;
    _tkvGender.borderColor = CLQAChatMsgBorder;
    _tkvGender.fillColor = [UIColor whiteColor];
    _tkvGender.borderWidth = 1.0f;
    
    _tkvAge.drawnBordersSides = TKDrawnBorderSidesRight | TKDrawnBorderSidesLeft | TKDrawnBorderSidesBottom;
    _tkvAge.borderColor = CLQAChatMsgBorder;
    _tkvAge.fillColor = [UIColor whiteColor];
    _tkvAge.borderWidth = 1.0f;
    
    _tkvSchool.drawnBordersSides = TKDrawnBorderSidesRight | TKDrawnBorderSidesLeft | TKDrawnBorderSidesBottom;
    _tkvSchool.borderColor = CLQAChatMsgBorder;
    _tkvSchool.fillColor = [UIColor whiteColor];
    _tkvSchool.borderWidth = 1.0f;
}

#pragma mark - tableview deleagate datasource stuff
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH_PORTRAIT, 5)];
    headerV.backgroundColor = [UIColor whiteColor];
    return headerV;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 5;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return _vFooter;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (SCREEN_HEIGHT_PORTRAIT <= 568) {
        if (isSignUp) {
            return 150;
        }else{
            return 110;
        }
    }else if(SCREEN_HEIGHT_PORTRAIT <= 667){
        if (isSignUp) {
            return 240;
        }else{
            return 190;
        }
    }else if(SCREEN_HEIGHT_PORTRAIT <= 736){
        if (isSignUp) {
            return 310;
        }else{
            return 260;
        }
    }else{
        return 100;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //return cell's height for particular row
    return ((UITableViewCell*)[self.registerCellArray objectAtIndex:indexPath.row]).frame.size.height;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //return number of cells for the table
    return self.registerCellArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    //return cell for particular row
    cell = [self.registerCellArray objectAtIndex:indexPath.row];
    
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (IBAction)actGetVerify:(id)sender {
}

- (IBAction)actRegister:(id)sender {
    VCDSignUp *signFinishProfile = [[VCDSignUp alloc] initWithNibName:@"VCDSignUp" bundle:nil];
    signFinishProfile.isSignUp = NO;
    [self.navigationController pushViewController:signFinishProfile animated:YES];
}

- (IBAction)actGoLogin:(id)sender {
    [appDelegate() showFirstView];
}
- (IBAction)actSignUpDone:(id)sender {
}
- (IBAction)actAddHeadImage:(id)sender {
}
@end
