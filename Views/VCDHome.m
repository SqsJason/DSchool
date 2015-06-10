//
//  VCDHome.m
//  DSchool
//
//  Created by sunjason on 15/6/6.
//  Copyright (c) 2015年 sunjason. All rights reserved.
//

#import "VCDHome.h"
#import "CellHomeDD.h"

@interface VCDHome ()

@property(nonatomic, strong) NSArray *arrTblDataSource;

@end

@implementation VCDHome

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_home_title_image"]];
    self.navigationItem.titleView = imgView;
    
    _arrTblDataSource = @[@"test_icon_image",@"test_icon_image",@"test_icon_image",@"test_icon_image",@"test_icon_image"];
}

#pragma mark - tableview deleagate datasource stuff
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *_vHeader = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH_PORTRAIT, 10)];
    return _vHeader;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *_vFooter = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH_PORTRAIT, 0)];
    return _vFooter;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //return cell's height for particular row
    return 210.0;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //return number of cells for the table
    return _arrTblDataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *tblCellIdentity = @"CellHomeDD";
    CellHomeDD *cell = [tableView dequeueReusableCellWithIdentifier:tblCellIdentity];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"CellHomeDD" owner:self options:nil] objectAtIndex:0];
    }
    
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [appDelegate().floatButtonView showAlarmView];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [appDelegate().floatButtonView hideAlarmView];
}

@end
