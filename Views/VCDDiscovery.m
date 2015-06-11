//
//  VCDDiscovery.m
//  DSchool
//
//  Created by sunjason on 15/6/8.
//  Copyright (c) 2015年 sunjason. All rights reserved.
//

#import "VCDDiscovery.h"
#import "JXBAdPageView.h"
#import "VCDFriendsCircle.h"

static float const H_ADVIEW_HEIGHT           = 140;
static float const H_LIFEVIEW_HEIGHT         = 100;
static float const H_ASSIOCIATIONVIEW_HEIGHT = 100;
static float const H_STUDENTUNIONVIEW_HEIGHT = 100;
static float const H_BTNVIEWPADDING_LEFT     = 15;
static float const H_BTNVIEWPADDING_TOP      = 10;

@interface VCDDiscovery ()

@property (weak, nonatomic) IBOutlet UIScrollView *scvDiscoveryMain;
@property (weak, nonatomic) IBOutlet UIView *vLifeService;
@property (weak, nonatomic) IBOutlet UIView *vAssiociations;
@property (weak, nonatomic) IBOutlet UIView *vStudentUnion;
@property (weak, nonatomic) IBOutlet UIView *vCanteen;


@property(strong, nonatomic) JXBAdPageView     *adView;
@property(nonatomic, strong) NSMutableArray    *arrAds;
@property(nonatomic, strong) NSArray           *arrTblDataSource;

@end

@implementation VCDDiscovery

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"发现";
    _arrAds = [[NSMutableArray alloc] initWithArray:@[@"test_icon_image",@"test_icon_image",@"test_icon_image",@"test_icon_image",@"test_icon_image"]];
    _arrTblDataSource = @[_CellLifeService,_CellAssioAndStuUnion,_CellCanteen];
    
    [self initAdView:_arrAds];
    
    [_tblDiscovery reloadData];
    CGRect tblFrame = _tblDiscovery.frame;
    tblFrame.origin.y = _adView.frame.size.height;
    _tblDiscovery.frame = tblFrame;
    [self initBtnViews];
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
    UIView *_vFooter = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH_PORTRAIT, 10)];
    return _vFooter;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //return cell's height for particular row
    return ((UITableViewCell*)[_arrTblDataSource objectAtIndex:indexPath.row]).frame.size.height + 10;
    
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

- (void) initAdView:(NSMutableArray *)arr
{
    _adView = [[JXBAdPageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH_PORTRAIT, H_ADVIEW_HEIGHT)];
    _adView.iDisplayTime = 2;
    _adView.backgroundColor = CLQASetDateBorder;
    [_adView startAdsWithBlock:_arrAds block:^(NSInteger clickIndex){
        
    }];
    
    [_vADViewHolder addSubview:_adView];
}

- (void)initBtnViews
{
    UITapGestureRecognizer *tapAction = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gotoFriendsCircle)];
    [_vLifeService addGestureRecognizer:tapAction];
    
    CGRect frameLife = _vLifeService.frame;
    _vLifeService.frame = CGRectMake(H_BTNVIEWPADDING_LEFT, frameLife.origin.y, SCREEN_WIDTH_PORTRAIT - 2*H_BTNVIEWPADDING_LEFT,  frameLife.size.height);
    
    CGRect frameAssio = _vAssiociations.frame;
    _vAssiociations.frame = CGRectMake(H_BTNVIEWPADDING_LEFT, frameAssio.origin.y, (SCREEN_WIDTH_PORTRAIT - 40)/2,frameAssio.size.height);
    
    CGRect frameUnion = _vStudentUnion.frame;
    float width;
    if (SCREEN_HEIGHT_PORTRAIT <= 568) {
        width = 0.0;
        _tblDiscovery.scrollEnabled = YES;
    }else if (SCREEN_HEIGHT_PORTRAIT <= 667){
        width = 25.0;
    }else if (SCREEN_HEIGHT_PORTRAIT <= 736){
        width = 50.0;
    }
    frameUnion.size.width = (SCREEN_WIDTH_PORTRAIT - 40)/2-width;
    _vStudentUnion.frame  = frameUnion;
    
    CGRect frameCanteen = _vCanteen.frame;
    _vCanteen.frame = CGRectMake(H_BTNVIEWPADDING_LEFT, frameCanteen.origin.y, (SCREEN_WIDTH_PORTRAIT - 40)/2, frameCanteen.size.height);
}

- (void) gotoFriendsCircle
{
    VCDFriendsCircle *vcdFriendsCircle = [[VCDFriendsCircle alloc] initWithNibName:@"VCDFriendsCircle" bundle:nil];
    
    [self.navigationController pushViewController:vcdFriendsCircle animated:YES];
}

- (void)initMainScrollView
{
    float scrollMainHeight = H_ADVIEW_HEIGHT + H_LIFEVIEW_HEIGHT + H_ASSIOCIATIONVIEW_HEIGHT + H_STUDENTUNIONVIEW_HEIGHT + 3*H_BTNVIEWPADDING_TOP;
    _scvDiscoveryMain.frame = CGRectMake(0, 0, SCREEN_WIDTH_PORTRAIT, scrollMainHeight);
    _scvDiscoveryMain.contentSize = CGSizeMake(SCREEN_WIDTH_PORTRAIT, scrollMainHeight);
    _scvDiscoveryMain.contentOffset = CGPointMake(0, 0);
}

@end
