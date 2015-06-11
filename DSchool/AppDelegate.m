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
#import "RDVTabBarController.h"
#import "RDVTabBarItem.h"
#import "VCDSignUp.h"
#import "VCSHome.h"
#import "VCDMessages.h"
#import "VCDSettings.h"
#import "MLBlackTransition.h"
#import "VCDHome.h"
#import "VCDFriendsCircle.h"
#import "VCDDiscovery.h"

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
    
    [MLBlackTransition validatePanPackWithMLBlackTransitionGestureRecognizerType:MLBlackTransitionGestureRecognizerTypeScreenEdgePan];
    
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
    //初始化
    self.floatButtonView = [FloatView defaultFloatViewWithButtonImageNameArray:@[@"icon_common_di",@"icon_common_di",@"icon_common_di",@"icon_common_di"]];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(floatButtonClick:) name:FloatViewClickNotification object:nil];

    return YES;
}

#pragma mark - 报警信息悬浮按钮点击 -
- (void)floatButtonClick:(NSNotification*)center
{
    NSString * message = @"点击滴按钮";
    UIAlertView * alertFloatBtn = [[UIAlertView alloc]initWithTitle:@"消息" message:message delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    alertFloatBtn.tag = TagFloatBtnAlert_AppDalegate;
    [alertFloatBtn show];
}

#pragma mark - Methods

- (void)setupViewControllers {
    UIViewController *firstViewController = [[VCDHome alloc] init];
    UIViewController *firstNavigationController = [[UINavigationController alloc]
                                                   initWithRootViewController:firstViewController];
    
    UIViewController *secondViewController = [[VCDMessages alloc] init];
    UIViewController *secondNavigationController = [[UINavigationController alloc]
                                                    initWithRootViewController:secondViewController];
    
    UIViewController *thirdViewController = [[VCDDiscovery alloc] init];
    UIViewController *thirdNavigationController = [[UINavigationController alloc]
                                                   initWithRootViewController:thirdViewController];
    
    UIViewController *fourthViewController = [[VCDSettings alloc] init];
    UIViewController *fourthNavigationController = [[UINavigationController alloc]
                                                   initWithRootViewController:fourthViewController];
    
    RDVTabBarController *tabBarController = [[RDVTabBarController alloc] init];
    [tabBarController setViewControllers:@[firstNavigationController, secondNavigationController,
                                           thirdNavigationController,fourthNavigationController]];
   
    self.baseController = tabBarController;
    
    [self customizeTabBarForController:tabBarController];
}

- (void)customizeTabBarForController:(RDVTabBarController *)tabBarController {
    UIImage *finishedImage = [UIImage imageNamed:@"tabbar_selected_background"];
    UIImage *unfinishedImage = [UIImage imageNamed:@"tabbar_normal_background"];
    NSArray *tabBarItemImages = @[@"home", @"message", @"discovery", @"mine"];
    
    NSInteger index = 0;
    for (RDVTabBarItem *item in [[tabBarController tabBar] items]) {
        [item setBackgroundSelectedImage:finishedImage withUnselectedImage:unfinishedImage];
        UIImage *selectedimage = [UIImage imageNamed:[NSString stringWithFormat:@"icon_tab_%@_selected",
                                                      [tabBarItemImages objectAtIndex:index]]];
        UIImage *unselectedimage = [UIImage imageNamed:[NSString stringWithFormat:@"icon_tab_%@_normal",
                                                        [tabBarItemImages objectAtIndex:index]]];
        [item setFinishedSelectedImage:selectedimage withFinishedUnselectedImage:unselectedimage];
        
        index++;
    }
}

- (void)customizeInterface {
    UINavigationBar *navigationBarAppearance = [UINavigationBar appearance];
    
    UIImage *backgroundImage = nil;
    NSDictionary *textAttributes = nil;
    
    if (NSFoundationVersionNumber > NSFoundationVersionNumber_iOS_6_1) {
        backgroundImage = [UIImage imageNamed:@"navigationbar_background_tall"];
        
        textAttributes = @{
                           NSFontAttributeName: [UIFont boldSystemFontOfSize:18],
                           NSForegroundColorAttributeName: [UIColor blackColor],
                           };
    } else {
#if __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_7_0
        backgroundImage = [UIImage imageNamed:@"navigationbar_background"];
        
        textAttributes = @{
                           UITextAttributeFont: [UIFont boldSystemFontOfSize:18],
                           UITextAttributeTextColor: [UIColor blackColor],
                           UITextAttributeTextShadowColor: [UIColor clearColor],
                           UITextAttributeTextShadowOffset: [NSValue valueWithUIOffset:UIOffsetZero],
                           };
#endif
    }
    
    [navigationBarAppearance setBackgroundImage:backgroundImage
                                  forBarMetrics:UIBarMetricsDefault];
    [navigationBarAppearance setTitleTextAttributes:textAttributes];
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
    [self showFirstView];
}

#pragma mark - 显示主页 -
-(void)showMainView
{
    if (self.window.rootViewController!=nil) {
        self.window.rootViewController = nil;
    }
//    VCSHome *gotoHome              = [[VCSHome alloc] initWithNibName:@"VCSHome" bundle:nil];
//    RDVTabBarController *mainTab   = [self setupViewControllers];
//    UINavigationController *nav    = [[UINavigationController alloc] initWithRootViewController:mainTab];
//    self.window.rootViewController = nav;
//    [self customizeInterface];
    
    [self setupViewControllers];
    [self.window setRootViewController:self.baseController];
    [self.window makeKeyAndVisible];
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
