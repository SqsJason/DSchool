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

    [self initNavBar];
    
    _arrTblDataSource = @[@"test_icon_image",@"test_icon_image",@"test_icon_image",@"test_icon_image",@"test_icon_image"];
}

#pragma mark - 初始化导航栏内容 -
- (void)initNavBar
{
    //=>    标题
    UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_home_title_image"]];
    self.navigationItem.titleView = imgView;
    
    
//    //=>    学校按钮
//    UIButton *btnLeft = [[UIButton alloc]initWithFrame:CGRectMake(0,
//                                                                  0,
//                                                                  140,
//                                                                  40)];
//    [btnLeft setTitle:@">徐州工程学院" forState:UIControlStateNormal];
//    [btnLeft addTarget:self
//                     action:@selector(publishBtn_action)
//           forControlEvents:UIControlEventTouchUpInside];
//    btnLeft.titleLabel.font = [UIFont boldSystemFontOfSize:12];
//    UIBarButtonItem *itemLeft   = [[UIBarButtonItem alloc] initWithCustomView:btnLeft];
//    [btnLeft setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    [btnLeft setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
//    
//    UIBarButtonItem *pozSpacerL   = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
//                                                                                target:nil
//                                                                                action:nil];
//    [pozSpacerL setWidth:-20];
//    self.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:pozSpacerL,
//                                               itemLeft,
//                                               nil];
    
    
    //=>    筛选按钮
    UIButton *btnQuestions = [[UIButton alloc]initWithFrame:CGRectMake(0,
                                                                       0,
                                                                       80,
                                                                       40)];
    [btnQuestions setTitle:@">筛选" forState:UIControlStateNormal];
    [btnQuestions addTarget:self
                     action:@selector(publishBtn_action)
           forControlEvents:UIControlEventTouchUpInside];
    btnQuestions.titleLabel.font = [UIFont boldSystemFontOfSize:12];
    UIBarButtonItem *itemRight   = [[UIBarButtonItem alloc] initWithCustomView:btnQuestions];
    [btnQuestions setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btnQuestions setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    
    UIBarButtonItem *pozSpacer   = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                                                                target:nil
                                                                                action:nil];
    [pozSpacer setWidth:-15];
    
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:pozSpacer,
                                               itemRight,
                                               nil];
}

#pragma mark - 点击发布朋友圈 -
- (void)publishBtn_action{
    
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
//    [appDelegate().floatButtonView showAlarmView];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
//    [appDelegate().floatButtonView hideAlarmView];
}

@end
