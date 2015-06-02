//
//  Util.h
//  templateios
//
//  Created by nguyen trung on 10/2/13.
//  Copyright (c) 2013 nguyen trung. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SVProgressHUD.h"
#import "AppDelegate.h"
#import "Logging.h"
#import "OLGhostAlertView.h"

@interface Util : NSObject {
    SVProgressHUD *HUD;
    
}

+ (Util *) sharedUtil;
+ (AppDelegate *)appDelegate;

+ (BOOL)validateMobileNumber:(NSString*)mobileNum;
//validate email
+ (BOOL)validateEmail:(NSString*)email;
//encode & decode url
+(NSString *)urlEncodewithString:(NSString*)str;
+ (NSString*) decodeFromPercentEscapeString:(NSString *) string;
//strim string
+(NSString*)strimStringWithString:(NSString*)str;
//check number in string
+(NSString*)formatNumber:(int)nub;

//create image by color
+ (UIImage *)imageWithColor:(UIColor *)color withSize:(CGRect)rect;
//create image have two color
+ (UIImage *)imageWithColorHigh:(UIColor *)hcolor withLowColor:(UIColor*)lcolor withSize:(CGRect)rect withHorizontal:(BOOL)horizontal;
+(UIImage*)imageWithColorHigh:(UIColor*)hcolor withLowColor:(UIColor*)lcolor withsize:(CGRect)rect withHeightBottom:(CGFloat)height;
+ (UIImage *)imageWithColorRight:(UIColor *)rcolor withLeftColor:(UIColor*)lcolor withSize:(CGRect)rect withHeightBottom:(CGFloat)height;

// for UINavigationBar

+(void)setNavigationBar:(UINavigationController*)nav;


//for message
+ (void)showMessage:(NSString *)message withTitle:(NSString *)title;
+ (void)showMessage:(NSString *)message withTitle:(NSString *)title andDelegate:(id)delegate;
+ (void)showMessage:(NSString *)message withTitle:(NSString *)title delegate:(id)delegate andTag:(NSInteger)tag;
+ (void)showMessage:(NSString *)message withTitle:(NSString *)title cancelButtonTitle:(NSString *)cancelTitle otherButtonTitles:(NSString *)otherTitle delegate:(id)delegate andTag:(NSInteger)tag;

//for date
+ (NSDate *)dateFromString:(NSString *)dateString withFormat:(NSString *)dateFormat;
+ (NSString *)stringFromDate:(NSDate *)date withFormat:(NSString *)dateFormat;
+ (NSString *)stringFromDateString:(NSString *)dateString;
+(NSString*)timestamp2date:(NSString*)timestamp;

+(BOOL)compareLoca2Timestamp:(NSString*)timestamp;//New Added
+(NSString*)timestamp2dateV2:(NSString*)timestamp;//New Added
+(NSString*)timestamp2dateWithFormat:(NSString*)timestamp Format:(NSString *)format;//New Added
+(NSDate *)getUTCDateFromNowDate:(NSDate *)anyDate;


+(BOOL)compare2Timestamp:(NSString*)timestamp;
+(NSString*)getTimeStamp;

// get number follow format
+ (NSNumber *)getSafeInt:(id)obj;
+ (NSNumber *)getSafeFloat:(id)obj;
+ (NSNumber *)getSafeBool:(id)obj;
+ (NSString *)getSafeString:(id)obj;

//check null nil
+ (BOOL)isNullOrNilObject:(id)object;

//loading view
- (void)showLoadingViewWithTitle:(NSString *)title;
- (void)hideLoadingView;


//object
+ (void)setValue:(id)value forKey:(NSString *)key;
+ (void)setValue:(id)value forKeyPath:(NSString *)keyPath;
+ (void)setObject:(id)obj forKey:(NSString *)key;
+ (id)valueForKey:(NSString *)key;
+ (id)valueForKeyPath:(NSString *)keyPath;
+ (id)objectForKey:(NSString *)key;
+ (void)removeObjectForKey:(NSString *)key;

// get file xib
+ (NSString *)getXIB:(Class)fromClass;

//fonts
+ (void)printAllSystemFonts;

/// set font Miller
+ (UIFont *)fontMillerTextWithSize:(CGFloat)fontSize;
+ (UIFont *)fontMillerTextBoldWithSize:(CGFloat)fontSize;
+ (UIFont *)fontMillerTextBoldItalicWithSize:(CGFloat)fontSize;
+ (UIFont *)fontMillerTextItalicWithSize:(CGFloat)fontSize;


// set font Gotham
+ (UIFont *)fontGothamThinWithSize:(CGFloat)fontSize;
+ (UIFont *)fontGothamLightWithSize:(CGFloat)fontSize;
+ (UIFont *)fontGothamBoldItalicWithSize:(CGFloat)fontSize;
+ (UIFont *)fontGothamBoldWithSize:(CGFloat)fontSize;
+ (UIFont *)fontGothamMediumWithSize:(CGFloat)fontSize;

//cache

+(NSString*) cacheDirectoryWithName:(NSString*)name;
+(void)removeCachesWithName:(NSString*)name;
+(BOOL)createFolderWithName:(NSString*)directory;
+(BOOL)checkFileExistWithDirectory:(NSString*)directory;
+(BOOL)removeFileWithDirectory:(NSString*)directory;
+(BOOL)copyFileInProjectWithFilePath:(NSString*)path toFolder:(NSString*)folder;

//Image.
+(BOOL)saveImageToLocalWithImage:(UIImage*)img andFolderName:(NSString*)folder withImgName:(NSString*)imgName;

+(BOOL)validateHypeLink:(NSString *)linkStr;

+(NSMutableDictionary *)parseToJson:(id)originData;
+(NSString *)getDateTimeFromNumber:(NSString *)numberStr;

@end
