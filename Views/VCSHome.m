//
//  VCSHome.m
//  ShipWarning
//
//  Created by sunjason on 15/5/7.
//
//

#import "VCSHome.h"
#import "VCSBrowserList.h"

const float HomeBtnPaddingRight  = 10.f;
const float HomeBtnPaddingLeft   = 10.f;
const float HomeBtnPaddingBottom = 10.f;
const float HomeBtnPaddingTop    = 74.f;
const float HomeBtnPadding       = 10.f;

const float HomeBtnCornerRadius  = 3.0f;

@interface VCSHome (){
    __weak IBOutlet UIButton *btnOntimeBrowser;
    __weak IBOutlet UIButton *btnHistoryBrowser;
    __weak IBOutlet UIButton *btnAlarmInfo;
    __weak IBOutlet UIButton *btnExit;
}

- (IBAction)btnOntimeClicked:(id)sender;
- (IBAction)btnHistoryCliked:(id)sender;
- (IBAction)btnAlarmClicked:(id)sender;
- (IBAction)btnExitClicked:(id)sender;

@end

@implementation VCSHome

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationController.navigationBar.barTintColor = k_GlobalColor_DarkBlue;
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,nil];
    [self.navigationController.navigationBar setTitleTextAttributes:attributes];
    if(![Util isNullOrNilObject:[appDelegate().dicProfiles objectForKey:@"customer"]]){
        self.title = [appDelegate().dicProfiles objectForKey:@"customer"];
    }else{
        self.title = @"首页";
    }
    
    self.title = @"苏州楷创乐电子科技有限公司";
    
    [self drawHomeBtns];
}

#pragma mark - 初始化四个按钮 -
- (void)drawHomeBtns
{
    float btnHeight = (SCREEN_HEIGHT_PORTRAIT - 3*HomeBtnPadding - 64)/2;
    float btnWidth  = (SCREEN_WIDTH_PORTRAIT - 3*HomeBtnPadding)/2;
    
    btnOntimeBrowser.frame = CGRectMake(HomeBtnPadding,
                                        HomeBtnPaddingTop,
                                        btnWidth,
                                        btnHeight);
    [btnOntimeBrowser setBackgroundImage:[Util imageWithColorHigh:k_GlobalColor_DarkBlue withLowColor:UIColorFromRGB(CLTodayBGBtnLikeLow) withsize:btnOntimeBrowser.frame withHeightBottom:0] forState:UIControlStateNormal];
    btnOntimeBrowser.layer.cornerRadius  = HomeBtnCornerRadius;
    btnOntimeBrowser.layer.masksToBounds = YES;
    
    btnHistoryBrowser.frame = CGRectMake(btnWidth + 2*HomeBtnPadding,
                                         HomeBtnPaddingTop,
                                         btnWidth,
                                         btnHeight);
    [btnHistoryBrowser setBackgroundImage:[Util imageWithColorHigh:k_GlobalColor_DarkBlue withLowColor:UIColorFromRGB(CLTodayBGBtnLikeLow) withsize:btnHistoryBrowser.frame withHeightBottom:0] forState:UIControlStateNormal];
    btnHistoryBrowser.layer.cornerRadius  = HomeBtnCornerRadius;
    btnHistoryBrowser.layer.masksToBounds = YES;
    
    btnAlarmInfo.frame      = CGRectMake(HomeBtnPadding,
                                            btnHeight + HomeBtnPadding +HomeBtnPaddingTop,
                                            btnWidth,
                                            btnHeight);
    [btnAlarmInfo setBackgroundImage:[Util imageWithColorHigh:k_GlobalColor_DarkBlue withLowColor:UIColorFromRGB(CLTodayBGBtnLikeLow) withsize:btnAlarmInfo.frame withHeightBottom:0] forState:UIControlStateNormal];
    btnAlarmInfo.layer.cornerRadius  = HomeBtnCornerRadius;
    btnAlarmInfo.layer.masksToBounds = YES;
    
    btnExit.frame           = CGRectMake(btnWidth + 2*HomeBtnPadding,
                                                btnHeight + HomeBtnPadding + HomeBtnPaddingTop,
                                                btnWidth,
                                                btnHeight);
    [btnExit setBackgroundImage:[Util imageWithColorHigh:k_GlobalColor_DarkBlue withLowColor:UIColorFromRGB(CLTodayBGBtnLikeLow) withsize:btnExit.frame withHeightBottom:0] forState:UIControlStateNormal];
    btnExit.layer.cornerRadius  = HomeBtnCornerRadius;
    btnExit.layer.masksToBounds = YES;
}

#pragma mark - 按钮的点击事件 -
- (IBAction)btnOntimeClicked:(id)sender {
    VCSBrowserList *browser = [[VCSBrowserList alloc] initWithNibName:@"VCSBrowserList" bundle:nil];
    browser.listStyle       = BrowserListStyleOntime;
    [self.navigationController pushViewController:browser animated:YES];
}

- (IBAction)btnHistoryCliked:(id)sender {
    VCSBrowserList *browser = [[VCSBrowserList alloc] initWithNibName:@"VCSBrowserList" bundle:nil];
    browser.listStyle       = BrowserListStyleHistory;
    [self.navigationController pushViewController:browser animated:YES];
}

- (IBAction)btnAlarmClicked:(id)sender {
    VCSBrowserList *browser = [[VCSBrowserList alloc] initWithNibName:@"VCSBrowserList" bundle:nil];
    browser.listStyle       = BrowserListStyleAlarm;
    [self.navigationController pushViewController:browser animated:YES];
}

- (IBAction)btnExitClicked:(id)sender {
    UIAlertView *logoutAlert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"是否确定退出应用？" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    logoutAlert.tag = 1001;//10表示第一个页面(首页),01表示第一个页面上的第一个AlertView.
    [logoutAlert show];
    logoutAlert = nil;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView.tag == 1001) {
        if (buttonIndex == 1) {
            [appDelegate() logout];
        }
    }
}

@end
