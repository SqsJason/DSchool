//
//  AppDelegate.m
//  HeyShopper
//
//  Created by sunjason on 15/5/30.
//  Copyright (c) 2015年 sunjason. All rights reserved.
//

#import "AppDelegate.h"
#import "VCDLogin.h"
#import "VCSHome.h"
#import "SVLogin.h"
#import "Config.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
@synthesize userDefaults;
@synthesize bgImage;
@synthesize dicProfiles;
@synthesize isLogedStatus;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    if (dicProfiles == nil) {
        dicProfiles = [[NSMutableDictionary alloc] init];
    }
    
    userDefaults  = [[NSUserDefaults alloc] init];
    if ([userDefaults objectForKey:LSSTRING(@"Key_UserDefaults_Username")] != nil &&
        [userDefaults objectForKey:LSSTRING(@"Key_UserDefaults_Password")] != nil) {
        SVLogin *svLogin = [[SVLogin alloc] init];
        dicProfiles = [NSMutableDictionary dictionaryWithDictionary:[svLogin getJsonFromLocal]];
        isLogedStatus = YES;
        [self showMainView];
    }else{
        isLogedStatus = NO;
        [self showFirstView];
    }
    [self.window makeKeyAndVisible];
    
    bgImage = [UIImage imageNamed:@"CommonBG"];
//    self.floatButtonView = [FloatView defaultFloatViewWithButtonImageNameArray:@[@"btn_tutorial.png",@"avatar_bg.png",@"avatar.png",@"btu_openFlashlight_off.png"]];
//    [self.floatButtonView showAlarmView];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(floatButtonClick:) name:FloatViewClickNotification object:nil];
    
    return YES;
}

#pragma mark - 报警信息悬浮按钮点击 -
- (void)floatButtonClick:(NSNotification*)center
{
    [self.floatButtonView hideAlarmView];
    NSString * message = @"点击报警信息按钮";
    UIAlertView * alertFloatBtn = [[UIAlertView alloc]initWithTitle:@"通知"
                                                            message:message
                                                           delegate:nil
                                                  cancelButtonTitle:@"确定"
                                                  otherButtonTitles:nil, nil];
    alertFloatBtn.tag = TagFloatBtnAlert_AppDalegate;
    [alertFloatBtn show];
}

#pragma mark - UIAlertViewDelegate -
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView.tag == TagFloatBtnAlert_AppDalegate) {
        //Do something
    }
}

- (void)applicationWillResignActive:(UIApplication *)application {}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application {}

- (void)applicationWillTerminate:(UIApplication *)application {}

#pragma mark - Toast网络请求错误信息 -
-(void)showToastErrorNot200:(int)numCode{
    switch (numCode) {
        case 401:
            NSLog(@"401");
            [self performSelectorOnMainThread:@selector(logout) withObject:nil waitUntilDone:YES];
            break;
        case 403:
            NSLog(@"403");
            [self performSelectorOnMainThread:@selector(logout) withObject:nil waitUntilDone:YES];
            break;
        case 404:
            NSLog(@"404");
            [self showToastError:@"error.connection"];
            break;
        case 503:
            NSLog(@"503");
            [self showToastError:@"error.connection"];
            break;
        case 500:
            NSLog(@"500");
            [self showToastError:@"error.generic"];
            break;
        case 0:
            NSLog(@"0");
            [self showToastError:@"error.connection"];
            break;
        default:
            break;
    }
}

-(void)showToastError:(NSString*)strKey{
    if ([strKey isEqualToString:@"error.dateIdea.incomplete"]) {
        OLGhostAlertView *alertView = [[OLGhostAlertView alloc] initWithTitle:LSSTRING(@"error.dateIdea.incomplete")];
        [alertView show];
    }else if([strKey isEqualToString:@"error.connection"] ){
        OLGhostAlertView *alertView = [[OLGhostAlertView alloc] initWithTitle:LSSTRING(@"error.connection")];
        [alertView show];
    } else if ([strKey isEqualToString:@"error.group.create.nameAlreadyUsed"]){
        OLGhostAlertView *alertView = [[OLGhostAlertView alloc] initWithTitle:LSSTRING(@"error.group.create.nameAlreadyUsed")];
        [alertView show];
    } else if([strKey isEqualToString:@"error.generic"]){
        OLGhostAlertView *alertView = [[OLGhostAlertView alloc] initWithTitle:LSSTRING(@"error.generic")];
        [alertView show];
    }
}

#pragma mark - 登出 -
-(void)logout{
    [Util removeObjectForKey:LSSTRING(@"Key_UserDefaults_Username")];
    [Util removeObjectForKey:LSSTRING(@"Key_UserDefaults_Password")];
    [dicProfiles removeAllObjects];
    [Util removeFileWithDirectory:[NSString stringWithFormat:@"%@/Profile.json",[Util cacheDirectoryWithName:folderData]]];
    [self showFirstView];
}

#pragma mark - 显示主页 -
-(void)showMainView
{
    if (self.window.rootViewController!=nil) {
        self.window.rootViewController = nil;
    }
    VCSHome *gotoHome              = [[VCSHome alloc] initWithNibName:@"VCSHome" bundle:nil];
    UINavigationController *nav    = [[UINavigationController alloc] initWithRootViewController:gotoHome];
    self.window.rootViewController = nav;
}

#pragma mark - 显示登陆页 -
-(void)showFirstView{
    if (self.window.rootViewController!=nil) {
        self.window.rootViewController = nil;
    }
    VCDLogin *loginPage            = [[VCDLogin alloc] initWithNibName:@"VCDLogin" bundle:nil];
    self.window.rootViewController = loginPage;
}

@end

#pragma mark - Convenience Constructors

AppDelegate *appDelegate(void)
{
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}
