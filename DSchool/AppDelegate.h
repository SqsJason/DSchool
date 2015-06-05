//
//  AppDelegate.h
//  DSchool
//
//  Created by sunjason on 15/6/2.
//  Copyright (c) 2015年 sunjason. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FloatView.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow            *window;
@property (strong, nonatomic) NSUserDefaults      *userDefaults;
@property (strong, nonatomic) UIImage             *bgImage;
@property (strong, nonatomic) FloatView           *floatButtonView;

@property (strong, nonatomic) UIViewController    *baseController;

@property (nonatomic, strong) NSMutableDictionary *dicProfiles;//登录后返回的Jason数据，以Dic方式暂存
@property (nonatomic)         BOOL                isLogedStatus;//用户是已经登录过的

-(void)showToastErrorNot200:(int)numCode;
-(void)showToastError:(NSString*)strKey;
-(void)logout;
-(void)showMainView;
-(void)showFirstView;

@end

AppDelegate *appDelegate(void);

