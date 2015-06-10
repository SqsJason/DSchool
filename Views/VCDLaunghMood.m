//
//  VCDLaunghMood.m
//  DSchool
//
//  Created by sunjason on 15/6/11.
//  Copyright (c) 2015年 sunjason. All rights reserved.
//

#import "VCDLaunghMood.h"

@interface VCDLaunghMood ()

@property(nonatomic, strong) NSArray *arrTblDataSource;


@end

@implementation VCDLaunghMood

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self initNavBar];
    [self initTBLDataSource];
    
}

#pragma mark - 初始化导航栏内容 -
- (void)initNavBar
{
    //=>    标题
    self.title = @"发表";
    
    //=>    发布按钮
    UIButton *btnQuestions = [[UIButton alloc]initWithFrame:CGRectMake(0,
                                                                       0,
                                                                       80,
                                                                       40)];
    [btnQuestions setTitle:@"确认" forState:UIControlStateNormal];
    [btnQuestions addTarget:self
                     action:@selector(publishBtn_action)
           forControlEvents:UIControlEventTouchUpInside];
    btnQuestions.titleLabel.font = [UIFont boldSystemFontOfSize:14];
    UIBarButtonItem *itemRight   = [[UIBarButtonItem alloc] initWithCustomView:btnQuestions];
    
    UIBarButtonItem *pozSpacer   = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                                                                target:nil
                                                                                action:nil];
    [pozSpacer setWidth:-30];
    
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:pozSpacer,
                                               itemRight,
                                               nil];
}

#pragma mark - 点击发布朋友圈 -
- (void)publishBtn_action{
    
}

- (void)initTBLDataSource
{
    _arrTblDataSource = @[_CellTime, _CellContent, _CellReward, _CellPeopleNumber];
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
    return ((UITableViewCell*)[_arrTblDataSource objectAtIndex:indexPath.row]).frame.size.height;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //return number of cells for the table
    return _arrTblDataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    //return cell for particular row
    cell = [_arrTblDataSource objectAtIndex:indexPath.row];
    
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

@end
