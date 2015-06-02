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

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"注册";
    
    //bake a cellArray to contain all cells
    self.registerCellArray = [NSMutableArray arrayWithObjects:_CellRegPhone, _CellRegVerify, _CellRegPassword, _CellRegConfirm, _CellRegMain, nil];
    
    [self doSomeUIInit];
}

- (void)doSomeUIInit
{
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
        return 150;
    }else if(SCREEN_HEIGHT_PORTRAIT <= 667){
        return 240;
    }else if(SCREEN_HEIGHT_PORTRAIT <= 736){
        return 310;
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

@end
