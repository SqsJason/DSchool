//
//  VCDDiscoveryNew.m
//  DSchool
//
//  Created by sunjason on 15/6/9.
//  Copyright (c) 2015年 sunjason. All rights reserved.
//

#import "VCDDiscoveryNew.h"
#import "SVPullToRefreshView+OY_PullRefreshView.h"

@interface VCDDiscoveryNew ()<UITableViewDataSource,UITableViewDelegate>
{
    NSTimer         *timer;
    UITableView     *tbView;
//    __block HomePageList    *listHomepage;
}

@end

@implementation VCDDiscoveryNew

- (void)dealloc
{
    if(timer)
    {
        [timer invalidate];
        timer = nil;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"首页";

    tbView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    tbView.delegate = self;
    tbView.dataSource = self;

    tbView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    tbView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:tbView];
    
    [tbView addPullToRefreshWithActionHandler:^{
        
    }];
    
    [tbView.pullToRefreshView setOYStyle];
    
    [tbView triggerPullToRefresh];

    
    timer = [NSTimer scheduledTimerWithTimeInterval:10 target:self selector:@selector(refreshMyData) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
}

#pragma mark - load data
/**
 *  刷新数据
 */
- (void)refreshMyData{}

#pragma mark - tableview
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section == 3)
        return 1;
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        return indexPath.row == 0 ? 150:100;
    }
    if (indexPath.section == 1 && indexPath.row == 1)
        return 140.5;
    if (indexPath.section == 2 && indexPath.row == 1)
        return 200;
    if (indexPath.section == 3)
    {
        return 270;
    }
    if (indexPath.section == 4 && indexPath.row == 1)
        return 250;
    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section==0)
        return 0.1;
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"showTitleCell";
    UITableViewCell *cell = (UITableViewCell*)[tableView  dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text = @"晒单分享";
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if(indexPath.section == 1 && indexPath.row == 0)
    {
        self.tabBarController.selectedIndex = 2;
    }
    else if(indexPath.section == 2 && indexPath.row == 0)
    {
        
        self.tabBarController.selectedIndex = 1;
    }
    else if(indexPath.section == 4 && indexPath.row == 0)
    {
        
    }
}


@end
