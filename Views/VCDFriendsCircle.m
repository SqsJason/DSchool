//
//  VCDFriendsCircle.m
//  DSchool
//
//  Created by iosdeveloper on 15/6/8.
//  Copyright (c) 2015年 sunjason. All rights reserved.
//

#import "VCDFriendsCircle.h"
#import "CellFriendsCircle.h"
#import "JXBAdPageView.h"
#import "VCDLaunghMood.h"

static float const H_ADVIEW_HEIGHT           = 120;

@interface VCDFriendsCircle ()

@property(strong, nonatomic) JXBAdPageView     *adView;
@property(nonatomic, strong) NSMutableArray    *arrAds;

@end

@implementation VCDFriendsCircle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self initNavBar];
    [self initADView];
    
    
    //=>    初始化TableView的数据源
    self.dataArray = [NSMutableArray array];
    for (int i = 0; i<6; i++)
    {
        if (i%2 == 0)
        {
            FCListEntity * entity = [[FCListEntity alloc] init];
            entity.head = @"test_icon_image";
            entity.inCount = @"10";
            entity.outCount = @"20";
            entity.name = @"黄伟华测试";
            entity.content = @"I’m telling you that if you can read this article, look through this list and not claim it as your own, then you should be a little worried.Actually, you should be very worried. You should drop everything and immediately  question your existence on earth. You should find a mirror, look yourself in the eyes, raise your hand and slap yourself in the face.Got it? Now repeat that until you come to your senses and continue reading whenever you’re ready.";
            entity.images = @[@"test_icon_image"];
            entity.date = @"1分钟前";
            entity.state = @"1";
            entity.wantCount = @"007";
            entity.comment = @"Now repeat that until you come to your senses and continue reading whenever you’re ready.";
            [self.dataArray addObject:entity];
        }else
        {
            FCListEntity * entity = [[FCListEntity alloc] init];
            entity.head = @"test_icon_head2";
            entity.inCount = @"321";
            entity.outCount = @"123";
            entity.name = @"just believe me ";
            entity.content = @"I’m telling you that if you can read this article, look through this list and not claim it as your own, then you should be a little worried.Actually, you should be very worried. You should drop everything and immediately  question your existence on earth. You should find a mirror, look yourself in the eyes, raise your hand and slap yourself in the face.";
            entity.images = @[@"test_icon_image"];
            entity.date = @"100分钟前";
            entity.state = @"2";
            entity.wantCount = @"700";
            entity.comment = @"I’m telling you that if you can read this article.";
            [self.dataArray addObject:entity];
        }
        
        for (int i = 0; i<3; i++)
        {
            if (i%2 == 0)
            {
                FCListEntity * entity = [[FCListEntity alloc] init];
                entity.head = @"test_icon_image";
                entity.inCount = @"10";
                entity.outCount = @"20";
                entity.name = @"黄伟华测试";
                entity.content = @"I’m telling you that if you can read this article, look through this list and not claim it as your own, then you should be a little worried.Actually, you should be very worried. You should drop everything and immediately  question your existence on earth. You should find a mirror, look yourself in the eyes, raise your hand and slap yourself in the face.Got it? Now repeat that until you come to your senses and continue reading whenever you’re ready.";
                entity.date = @"1分钟前";
                entity.state = @"1";
                entity.wantCount = @"007";
                entity.comment = @"Now repeat that until you come to your senses and continue reading whenever you’re ready.";
                [self.dataArray addObject:entity];
            }else
            {
                FCListEntity * entity = [[FCListEntity alloc] init];
                entity.head = @"test_icon_head2";
                entity.inCount = @"321";
                entity.outCount = @"123";
                entity.name = @"just believe me ";
                entity.content = @"I’m telling you that if you can read this article, look through this list and not claim it as your own, then you should be a little worried.Actually, you should be very worried. You should drop everything and immediately  question your existence on earth. You should find a mirror, look yourself in the eyes, raise your hand and slap yourself in the face.";
                entity.images = @[@"test_icon_image", @"test_icon_image", @"test_icon_image"];
                entity.date = @"100分钟前";
                entity.state = @"2";
                entity.wantCount = @"700";
                entity.comment = @"I’m telling you that if you can read this article.";
                [self.dataArray addObject:entity];
            }
        }
    }
    
    //=>    刷新数据
    [self.tblCircle reloadData];
}


#pragma mark - 初始化导航栏内容 -
- (void)initNavBar
{
    //=>    标题
    self.title = @"校园圈";
    
    //=>    发布按钮
    UIButton *btnQuestions = [[UIButton alloc]initWithFrame:CGRectMake(0,
                                                                       0,
                                                                       80,
                                                                       40)];
    [btnQuestions setTitle:@"发表" forState:UIControlStateNormal];
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
    VCDLaunghMood *pubMood = [[VCDLaunghMood alloc] initWithNibName:@"VCDLaunghMood" bundle:nil];
    [self.navigationController pushViewController:pubMood animated:YES];
}


#pragma mark - 初始化广告位 -
- (void)initADView
{
    _arrAds = [[NSMutableArray alloc] initWithArray:@[@"test_icon_image",@"test_icon_image",@"test_icon_image",@"test_icon_image",@"test_icon_image"]];
    
    _adView = [[JXBAdPageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH_PORTRAIT, H_ADVIEW_HEIGHT)];
    _adView.iDisplayTime = 2;
    _advFriendsCircle.backgroundColor = CLQASetDateBorder;
    [_adView startAdsWithBlock:_arrAds block:^(NSInteger clickIndex){
        
    }];
    [_advFriendsCircle addSubview:_adView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if ([self.tblCircle respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.tblCircle setSeparatorInset: UIEdgeInsetsZero];
    }
    if ([self.tblCircle respondsToSelector:@selector(setLayoutMargins:)]) {
        [self.tblCircle setLayoutMargins: UIEdgeInsetsZero];
    }
}

#pragma mark - Table view data source
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *_vHeader = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH_PORTRAIT, 5)];
    _vHeader.backgroundColor = [UIColor whiteColor];
    return _vHeader;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 5;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FCListEntity * entity = self.dataArray[indexPath.row];
    
    CGFloat height = [FCListEntity getHightForListEntity:entity font:[CellFriendsCircle fontOfContent] width:[CellFriendsCircle contentWidth]];
    NSLog(@"cell 高度 :%f",height);
    return height;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.dataArray.count;
}


- (CellFriendsCircle *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identify = @"CellFriendsCircle";
    
    CellFriendsCircle *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[CellFriendsCircle alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
    [cell removeFrames];
    [cell setListEntity:self.dataArray[indexPath.row]];
    
    return cell;
}


/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */


#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"点击" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
    [alert show];
}

@end
