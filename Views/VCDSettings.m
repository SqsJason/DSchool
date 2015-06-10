//
//  VCDSettings.m
//  DSchool
//
//  Created by sunjason on 15/6/3.
//  Copyright (c) 2015年 sunjason. All rights reserved.
//

#import "VCDSettings.h"

@interface VCDSettings ()
{
    NSMutableArray *arrSectionOneCells;
    NSMutableArray *arrSectionTwoCells;
    NSMutableArray *arrSectionThreeCells;
    NSMutableArray *arrSectionFourCells;
    NSMutableArray *arrSectionFiveCells;
}

@end

@implementation VCDSettings

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"个人中心";
    
    [self doSomeUIInitForSignUp];
}

- (void)doSomeUIInitForSignUp
{
    arrSectionOneCells = [NSMutableArray arrayWithObjects:_CellSettingsTitle, nil];
    arrSectionTwoCells = [NSMutableArray arrayWithObjects:_CellSettingsCustoms, _CellZan, nil];
    arrSectionThreeCells = [NSMutableArray arrayWithObjects:_CellNotice, _CellAdvice, nil];
    arrSectionFourCells = [NSMutableArray arrayWithObjects:_CellUpdatePs, _CellOtherSets,_CellExit, nil];
    arrSectionFiveCells = [NSMutableArray arrayWithObjects:_CellVipsRight, _CellMinePoints,_CellVipsCard, nil];
    
    _btnExit.layer.cornerRadius = 5.0;
    _btnExit.layer.masksToBounds = YES;
    [_btnExit setBackgroundImage:[Util imageWithColorHigh:k_LoginColor_Header withLowColor:UIColorFromRGB(LCTTAlertFRBGBtnDoneLow) withsize:_btnExit.frame withHeightBottom:0] forState:UIControlStateNormal];
    
//    if (SCREEN_HEIGHT_PORTRAIT <= 568) {
//        _tblSettings.scrollEnabled = YES;
//    }else{
//        _tblSettings.scrollEnabled = NO;
//    }
    
    [_tblSettings reloadData];
}

#pragma mark - tableview deleagate datasource stuff
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    float headerHeight;
    
    switch (section) {
        case 0:
            headerHeight = 0.0;
            break;
        default:
            headerHeight = 10.0;
            break;
    }
    
    UIView *headerV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH_PORTRAIT, headerHeight)];
    headerV.backgroundColor = _vFooterV.backgroundColor;
    
    return headerV;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    float headerHeight;
    
    switch (section) {
        case 0:
            headerHeight = 0.0;
            break;
        default:
            headerHeight = 10.0;
            break;
    }
    return headerHeight;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return _vFooterV;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    
    float footerHeight;
    
    switch (section) {
        case 4:
        {
            if (SCREEN_HEIGHT_PORTRAIT <= 568) {
                footerHeight = 100;
            }else if(SCREEN_HEIGHT_PORTRAIT <= 667){
                footerHeight = 120;
            }else if(SCREEN_HEIGHT_PORTRAIT <= 736){
                footerHeight = 160;
            }else{
                footerHeight = 60;
            }
        }
            break;
        default:
            footerHeight = 0.0;
            break;
    }
    return 0.0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //return cell's height for particular row
    switch (indexPath.section) {
        case 0:
            return ((UITableViewCell*)[arrSectionOneCells objectAtIndex:indexPath.row]).frame.size.height;
            break;
        case 1:
            return ((UITableViewCell*)[arrSectionTwoCells objectAtIndex:indexPath.row]).frame.size.height;
            break;
        case 2:
            return ((UITableViewCell*)[arrSectionThreeCells objectAtIndex:indexPath.row]).frame.size.height;
            break;
        case 3:
            return ((UITableViewCell*)[arrSectionFiveCells objectAtIndex:indexPath.row]).frame.size.height;
            break;
        case 4:
            return ((UITableViewCell*)[arrSectionFourCells objectAtIndex:indexPath.row]).frame.size.height;
            break;
        default:
            return 44;
            break;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //return number of cells for the table
    switch (section) {
        case 0:
            return arrSectionOneCells.count;
            break;
        case 1:
            return arrSectionTwoCells.count;
            break;
        case 2:
            return arrSectionThreeCells.count;
            break;
        case 3:
            return arrSectionFiveCells.count;
            break;
        case 4:
            return arrSectionFourCells.count;
            break;
        default:
            return 2;
            break;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    //return cell for particular row
    switch (indexPath.section) {
        case 0:
            cell = (UITableViewCell*)[arrSectionOneCells objectAtIndex:indexPath.row];
            break;
        case 1:
            cell =  (UITableViewCell*)[arrSectionTwoCells objectAtIndex:indexPath.row];
            break;
        case 2:
            cell =  (UITableViewCell*)[arrSectionThreeCells objectAtIndex:indexPath.row];
            break;
        case 3:
            cell =  (UITableViewCell*)[arrSectionFiveCells objectAtIndex:indexPath.row];
            break;
        case 4:
            cell =  (UITableViewCell*)[arrSectionFourCells objectAtIndex:indexPath.row];
            break;
        default:
            cell =  (UITableViewCell*)[arrSectionOneCells objectAtIndex:indexPath.row];
            break;
    }
    
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

@end
