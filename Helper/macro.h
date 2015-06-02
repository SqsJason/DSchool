//
//  macro.h
//  templateios
//
//  Created by nguyen trung on 7/9/13.
//  Copyright (c) 2013 nguyen trung. All rights reserved.
//

#ifndef SetaBase_Macro_h
#define SetaBase_Macro_h

#define DEFINE_SHARED_INSTANCE_USING_BLOCK(block) \
static dispatch_once_t pred = 0; \
__strong static id _sharedObject = nil; \
dispatch_once(&pred, ^{ \
_sharedObject = block(); \
}); \
return _sharedObject; \

#define IS_IPAD() (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define NEW_VC(className) [[className alloc] initWithNibName:[Util getXIB:[className class]] bundle:nil]
#define V(x,y) IS_IPAD()?x:y
#define DEVICE_VERSION                      [[[UIDevice currentDevice] systemVersion] floatValue]

#pragma - mark DEVICE INFORMATION

/** String: Identifier **/
#define DEVICE_IDENTIFIER ( ( IS_IPAD ) ? DEVICE_IPAD : ( IS_IPHONE ) ? DEVICE_IPHONE , DEVICE_SIMULATOR )

/** String: iPhone **/
#define DEVICE_IPHONE @"iPhone"

/** String: iPad **/
#define DEVICE_IPAD @"iPad"

/** String: Device Model **/
#define DEVICE_MODEL ( [[UIDevice currentDevice ] model ] )

/** String: Localized Device Model **/
#define DEVICE_MODEL_LOCALIZED ( [[UIDevice currentDevice ] localizedModel ] )

/** String: Device Name **/
#define DEVICE_NAME ( [[UIDevice currentDevice ] name ] )

/** Double: Device Orientation **/
#define DEVICE_ORIENTATION ( [[UIDevice currentDevice ] orientation ] )

/** String: Simulator **/
#define DEVICE_SIMULATOR @"Simulator"

/** String: Device Type **/
#define DEVICE_TYPE ( [[UIDevice currentDevice ] deviceType ] )

/** BOOL: Detect if device is an iPhone or iPod **/
#define IS_IPHONE ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone )

/** BOOL: IS_RETINA **/
#define IS_RETINA ( [[UIScreen mainScreen] respondsToSelector:@selector(scale)] && [[UIScreen mainScreen] scale] == 2 )

/** BOOL: Detect if device is the Simulator **/
#define IS_SIMULATOR ( TARGET_IPHONE_SIMULATOR )

#pragma - mark SYSTEM INFORMATION

/** String: System Name **/
#define SYSTEM_NAME ( [[UIDevice currentDevice ] systemName ] )

/** String: System Version **/
#define SYSTEM_VERSION ( [[UIDevice currentDevice ] systemVersion ] )

#pragma mark - SCREEN INFORMATION

/** Float: Portrait Screen Height **/
#define SCREEN_HEIGHT_PORTRAIT ( [[UIScreen mainScreen ] bounds ].size.height )

/** Float: Portrait Screen Width **/
#define SCREEN_WIDTH_PORTRAIT ( [[UIScreen mainScreen ] bounds ].size.width )

/** Float: Landscape Screen Height **/
#define SCREEN_HEIGHT_LANDSCAPE ( [[UIScreen mainScreen ] bounds ].size.width )

/** Float: Landscape Screen Width **/
#define SCREEN_WIDTH_LANDSCAPE ( [[UIScreen mainScreen ] bounds ].size.height )

/** CGRect: Portrait Screen Frame **/
#define SCREEN_FRAME_PORTRAIT ( CGRectMake( 0, 0, SCREEN_WIDTH_PORTRAIT , SCREEN_HEIGHT_PORTRAIT ) )

/** CGRect: Landscape Screen Frame **/
#define SCREEN_FRAME_LANDSCAPE ( CGRectMake( 0, 0, SCREEN_WIDTH_LANDSCAPE , SCREEN_HEIGHT_LANDSCAPE ) )

/** Float: Screen Scale **/
#define SCREEN_SCALE ([[UIScreen mainScreen] scale ] )

/** CGSize: Screen Size Portrait **/
#define SCREEN_SIZE_PORTRAIT ( CGSizeMake( SCREEN_WIDTH_PORTRAIT * SCREEN_SCALE , SCREEN_HEIGHT_PORTRAIT * SCREEN_SCALE ) )

/** CGSize: Screen Size Landscape **/
#define SCREEN_SIZE_LANDSCAPE ( CGSizeMake( SCREEN_WIDTH_LANDSCAPE * SCREEN_SCALE , SCREEN_HEIGHT_LANDSCAPE * SCREEN_SCALE ) )

#pragma mark - COLOR
/** UIColor: Color From Hex **/

#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

//RGB color macro with alpha
#define UIColorFromRGBWithAlpha(rgbValue,a) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:a]

#define colorFromHex( rgbValue ) ( [UIColor UIColorFromRGB:rgbValue ] )

/** UIColor: Color from RGB **/
#define colorFromRGB(r, g, b) ( [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1 ] )

#define RGB(r, g, b)                    [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]

/** UIColor: Color from RGBA **/

#define colorFromRGBA(r, g, b, a) ( [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a ] )

#define RGBA(r, g, b, a)                [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

#pragma mark - DEGREES, RADIANS

/** Degrees to Radian **/
#define degreesToRadians( degrees ) ( ( degrees ) / 180.0 * M_PI )

/** Radians to Degrees **/
#define radiansToDegrees( radians ) ( ( radians ) * ( 180.0 / M_PI ) )

/** Check iPhone5 **/
#define IS_IPHONE_5                     (SCREEN_HEIGHT_PORTRAIT == 568)

#define LSSTRING(str) NSLocalizedString(str, str)

/** CHeck IOS Version **/
#define IOSVersion                          [[[UIDevice currentDevice] systemVersion] floatValue]
#define IsIOS8Later                         !(IOSVersion < 8.0)
#define IsIOS81Later                        !(IOSVersion < 8.1)

//add more 10/06/2014
#define xFrame(a) a.frame.origin.x
#define yFrame(b) b.frame.origin.y
#define width(w)    w.frame.size.width
#define height(w)    w.frame.size.height
#define xCenter(a) a.center.x
#define yCenter(b) b.center.y

#define scaleFrame(obj,w,h)   CGRectMake(xFrame(obj),yFrame(obj),w,h)
#define moveFrame(obj,x,y)    CGRectMake(x,y, width(obj), height(obj))

#define numberWithBool(b)   [NSNumber numberWithBool:b]
#define numberWithInt(i)   [NSNumber numberWithInt:i]

#define safeString(x)       [Util getSafeString:x]

#define dropViewWithLastOS(view)                [Util dropViewWithLastOS:view.frame]

#define upViewWithAds(view)                     [Util upViewWithAds:view.frame]

#define dropView(view,delta)                    [Util dropView:view with:delta]
#define upView(view,delta)                      [Util upView:view with:delta]


#define RETURN_IF_THIS_VIEW_IS_NOT_A_TOPVIEW_CONTROLLER if (self.navigationController) if (!(self.navigationController.topViewController == self)) return;

#define SHOW_STATUS_BAR [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationNone];
#define HIDE_STATUS_BAR [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationNone];

#define SHOW_NAVIGATION_BAR [self.navigationController setNavigationBarHidden:FALSE];
#define HIDE_NAVIGATION_BAR [self.navigationController setNavigationBarHidden:TRUE];

#define VC_OBJ(x) [[x alloc] init]
#define VC_OBJ_WITH_NIB(x) [[x alloc] initWithNibName : (NSString *)CFSTR(#x) bundle : nil]

#define RESIGN_KEYBOARD [[[UIApplication sharedApplication] keyWindow] endEditing:YES];

#define CLEAR_NOTIFICATION_BADGE [UIApplication sharedApplication].applicationIconBadgeNumber = 0;
#define REGISTER_APPLICATION_FOR_NOTIFICATION_SERVICE [[UIApplication sharedApplication] registerForRemoteNotificationTypes:(UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound | UIRemoteNotificationTypeAlert)]

#define APPDELEGATE ((AppDelegate *)[[UIApplication sharedApplication] delegate])
#define HIDE_NETWORK_ACTIVITY_INDICATOR [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
#define SHOW_NETWORK_ACTIVITY_INDICATOR [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];


// 2.2 Gets the path of a file inside the documents dir
#define FileFromDocPath(filepath) [NSHomeDirectory() stringByAppendingPathComponent:(filepath)]
#define FileFromProject(name,type) [[NSBundle mainBundle] pathForResource:name ofType:type]

// 2.3 Removes a file from the documents dir
#define RemoveFileFromDocPath(path) [[NSFileManager defaultManager] removeItemAtPath:[NSHomeDirectory() stringByAppendingPathComponent:(path)] error:nil]

// 2.4 Fast userdefaults getter
#define Setting(param) [[NSUserDefaults standardUserDefaults] objectForKey:(param)]
#define BoolSetting(param) [[NSUserDefaults standardUserDefaults] boolForKey:(param)]
#define IntSetting(param) [[NSUserDefaults standardUserDefaults] integerForKey:(param)]

// 2.5 String Macros
#define DBNULL @"[NULL]"
#define NOT_AVAILABLE @""


//image
#define imageNamed(name)        [UIImage imageNamed:name] forState:UIControlStateNormal]

#endif

