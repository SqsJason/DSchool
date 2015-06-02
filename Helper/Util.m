//
//  Util.m
//  templateios
//
//  Created by nguyen trung on 10/2/13.
//  Copyright (c) 2013 nguyen trung. All rights reserved.
//


#import "Util.h"
#import "SHXMLParser.h"
#import "JSONKit.h"

#define kCalendarType NSYearCalendarUnit | NSMonthCalendarUnit | NSWeekCalendarUnit | NSWeekdayCalendarUnit | NSWeekdayOrdinalCalendarUnit | NSWeekOfMonthCalendarUnit | NSWeekOfYearCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit | NSTimeZoneCalendarUnit
#define IPAD_XIB_POSTFIX @"~iPad"

@implementation Util

+ (Util *)sharedUtil {
    static Util *_sharedUtil = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedUtil = [[Util alloc] init];
    });
    
    return _sharedUtil;
}

#pragma mark Validator -MobileNumber-
+ (BOOL)validateMobileNumber:(NSString*)mobileNum
{
    NSString *regExPattern = @"^((13[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$";
    NSRegularExpression *regEx = [[NSRegularExpression alloc] initWithPattern:regExPattern options:NSRegularExpressionCaseInsensitive error:nil];
    NSUInteger regExMatches = [regEx numberOfMatchesInString:mobileNum options:0 range:NSMakeRange(0, [mobileNum length])];
    DLog(@"%lu", (unsigned long)regExMatches);
    if (regExMatches == 0) {
        return NO;
    } else
        return YES;
}

#pragma mark Validator
+ (BOOL)validateEmail:(NSString*)email
{
	NSString *regExPattern = @"^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}$";//[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}
    NSRegularExpression *regEx = [[NSRegularExpression alloc] initWithPattern:regExPattern options:NSRegularExpressionCaseInsensitive error:nil];
    NSUInteger regExMatches = [regEx numberOfMatchesInString:email options:0 range:NSMakeRange(0, [email length])];
    DLog(@"%lu", (unsigned long)regExMatches);
    if (regExMatches == 0) {
        return NO;
    } else
        return YES;
}

+(BOOL)validateHypeLink:(NSString *)linkStr
{
//    NSString* substringForMatch = [[NSString alloc] init];
    NSString* substringForMatch_second = [[NSString alloc] init];
    NSError *error;
//    NSString *regulaStr = @"^\\s*((http(s)?://)|(ftp://)|())\\w+(\\.\\w+)+((:\\d{1,5})|)(/\\w*)*(/\\w+\\.(\\w+|))?([\\w- ./?％&=]*)?";
    NSString *regulaStr_second = @"((http[s]{0,1}|ftp)://[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)|(www.[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)";
    
//    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:regulaStr
//                                                                           options:NSRegularExpressionCaseInsensitive
//                                                                             error:&error];
    NSRegularExpression *regex_second = [NSRegularExpression regularExpressionWithPattern:regulaStr_second
                                                                           options:NSRegularExpressionCaseInsensitive
                                                                             error:&error];
    
    
//    NSArray *arrayOfAllMatches = [regex matchesInString:linkStr options:0 range:NSMakeRange(0, [linkStr length])];
    
//    for (NSTextCheckingResult *match in arrayOfAllMatches)
//    {
//        substringForMatch = [linkStr substringWithRange:match.range];
//    }
    
    NSArray *arrayOfAllMatches_second = [regex_second matchesInString:linkStr options:0 range:NSMakeRange(0, [linkStr length])];
    
    for (NSTextCheckingResult *match in arrayOfAllMatches_second)
    {
        substringForMatch_second = [linkStr substringWithRange:match.range];
    }
    
    
    if (substringForMatch_second.length != 0) {
        return YES;
    }else{
        return NO;
    }
}


+(NSString *)urlEncodewithString:(NSString*)str{
    return (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(NULL,
                                                                                 (CFStringRef)str,
                                                                                 NULL,
                                                                                 (CFStringRef)@"!*'\"();:@&=+$,/?%#[]% ",
                                                                                 kCFStringEncodingUTF8));
}
+ (NSString*) decodeFromPercentEscapeString:(NSString *) string {
    return (__bridge NSString *) CFURLCreateStringByReplacingPercentEscapesUsingEncoding(NULL,
                                                                                         (__bridge CFStringRef) string,
                                                                                         CFSTR(""),
                                                                                         kCFStringEncodingUTF8);
}

+(NSString*)strimStringWithString:(NSString*)str{
    str = [str stringByTrimmingCharactersInSet:
           [NSCharacterSet whitespaceCharacterSet]];
    return str;
}
+(NSString*)formatNumber:(int)nub{
    NSNumberFormatter *formatter = [NSNumberFormatter new];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle]; // this line is important!
    
    NSString *formatted = [formatter stringFromNumber:[NSNumber numberWithInteger:nub]];
    return formatted;
}

// create image with color
+ (UIImage *)imageWithColor:(UIColor *)color withSize:(CGRect)rect{
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}


// create image have two color
+ (UIImage *)imageWithColorHigh:(UIColor *)hcolor withLowColor:(UIColor*)lcolor withSize:(CGRect)rect withHorizontal:(BOOL)horizontal{
    CGRect hrect,lrect;
    if (horizontal){
        hrect = CGRectMake(0, 0, rect.size.width, rect.size.height/2);
        lrect = CGRectMake(0, rect.size.height/2, rect.size.width, rect.size.height);
    }else{
        hrect = CGRectMake(0, 0, rect.size.width/2, rect.size.height);
        lrect = CGRectMake(rect.size.width/2, 0, rect.size.width, rect.size.height);
    }
    
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [hcolor CGColor]);
    CGContextFillRect(context, hrect);
    CGContextSetFillColorWithColor(context, [lcolor CGColor]);
    CGContextFillRect(context, lrect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

+(UIImage*)imageWithColorHigh:(UIColor*)hcolor withLowColor:(UIColor*)lcolor withsize:(CGRect)rect withHeightBottom:(CGFloat)height{
    CGRect hrect,lrect;
        hrect = CGRectMake(0, 0, rect.size.width, rect.size.height-height);
        lrect = CGRectMake(0, rect.size.height-height, rect.size.width, rect.size.height);
    
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [hcolor CGColor]);
    CGContextFillRect(context, hrect);
    CGContextSetFillColorWithColor(context, [lcolor CGColor]);
    CGContextFillRect(context, lrect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}


// create image for UINavigationBar
+ (UIImage *)imageWithColorRight:(UIColor *)rcolor withLeftColor:(UIColor*)lcolor withSize:(CGRect)rect withHeightBottom:(CGFloat)height{
    CGRect rrect,lrect;
    lrect = CGRectMake(0, 0, rect.size.width/2, height);
    rrect = CGRectMake(rect.size.width/2, 0, rect.size.width/2, height);
    
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    UIColor *reliantMagenta = [UIColor colorWithRed:255 / 255.0f green:255 / 255.0f blue:255 / 255.0f alpha:1.0];
    CGContextSetFillColorWithColor(context, [reliantMagenta CGColor]);
    CGContextFillRect(context, rect);
    
    CGContextSetFillColorWithColor(context, [rcolor CGColor]);
    CGContextFillRect(context, rrect);
    
    CGContextSetFillColorWithColor(context, [lcolor CGColor]);
    CGContextFillRect(context, lrect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

// set UINavigationBar
+(void)setNavigationBar:(UINavigationController*)nav {
    
    if ([nav.navigationBar respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)])
    {
        //Before V2.0.0
//        UIImage *image = [Util imageWithColorRight:UIColorFromRGB(CLNavRight)
//                                     withLeftColor:UIColorFromRGB(CLNavLeft)
//                                          withSize:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 48)
//                                  withHeightBottom:3];
//        [nav.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    }
}


+ (AppDelegate *)appDelegate {
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    return appDelegate;
}

#pragma mark - Message

+ (void)showMessage:(NSString *)message withTitle:(NSString *)title {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];
}

+ (void)showMessage:(NSString *)message withTitle:(NSString *)title andDelegate:(id)delegate
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:delegate cancelButtonTitle:@"No" otherButtonTitles:@"Yes", nil];
    [alert show];
    
}

+ (void)showMessage:(NSString *)message withTitle:(NSString *)title delegate:(id)delegate andTag:(NSInteger)tag
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:delegate cancelButtonTitle:@"No" otherButtonTitles:@"Yes", nil];
    alert.tag = tag;
    [alert show];
}

+ (void)showMessage:(NSString *)message withTitle:(NSString *)title cancelButtonTitle:(NSString *)cancelTitle otherButtonTitles:(NSString *)otherTitle delegate:(id)delegate andTag:(NSInteger)tag
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:delegate cancelButtonTitle:cancelTitle otherButtonTitles:otherTitle, nil];
    alert.tag = tag;
    alert.delegate = delegate;
    [alert show];
}

#pragma mark - for Date

+ (NSDate *)dateFromString:(NSString *)dateString withFormat:(NSString *)dateFormat {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"GMT"]];
    [formatter setDateFormat:dateFormat];
    NSDate *ret = [formatter dateFromString:dateString];
    return ret;
}

+ (NSString *)stringFromDate:(NSDate *)date withFormat:(NSString *)dateFormat {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:dateFormat];
    NSString *ret = [formatter stringFromDate:date];
    return ret;
}

+ (NSString *)stringFromDateString:(NSString *)dateString
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"GMT"]];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *utcDate = [formatter dateFromString:dateString];
    [formatter setTimeZone:[NSTimeZone systemTimeZone]];
//    [formatter setTimeZone:[NSTimeZone localTimeZone]];
    [formatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"]];
    [formatter setDateFormat:@"MM/dd/yyyy h:mm a"];
    return [formatter stringFromDate:utcDate];
}

+ (NSString*)timestamp2date:(NSString*)timestamp {
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timestamp.longLongValue/1000];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setAMSymbol:@"am"];
    [dateFormatter setPMSymbol:@"pm"];
    [dateFormatter setDateFormat:@"HH:mm a"];
    [dateFormatter setTimeZone:[NSTimeZone systemTimeZone]];
//    [dateFormatter setTimeZone:[NSTimeZone localTimeZone]];
    NSString *dateString = [dateFormatter stringFromDate:date];
    return dateString;
}

+ (NSString*)timestamp2dateV2:(NSString*)timestamp {
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timestamp.longLongValue/1000];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"EEE, d MMM yyyy h:mm aa"];

    [dateFormatter setTimeZone:[NSTimeZone systemTimeZone]];
//    [dateFormatter setTimeZone:[NSTimeZone localTimeZone]];
    NSString *dateString = [dateFormatter stringFromDate:date];
    return dateString;
}

+(NSString*)timestamp2dateWithFormat:(NSString*)timestamp Format:(NSString *)format
{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timestamp.longLongValue/1000];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    
    [dateFormatter setTimeZone:[NSTimeZone systemTimeZone]];
    NSString *dateString = [dateFormatter stringFromDate:date];
    return dateString;
}


+(BOOL)compare2Timestamp:(NSString*)timestamp{
    long long ts = [timestamp longLongValue];
    NSDate *date = [NSDate date];
    long long ti = (long long)[date timeIntervalSince1970]*1000+3600*1000*4;
    if (ts>=ti) {
        return TRUE;
    }else return FALSE;
}

+(BOOL)compareLoca2Timestamp:(NSString*)timestamp{
    long long ts = [timestamp longLongValue];
    NSDate *date = [NSDate date];
    long long ti = (long long)[date timeIntervalSince1970]*1000;
    if (ts>=ti) {
        return TRUE;
    }else return FALSE;
}

//获取当前时间
+(NSString*)getTimeStamp{
    NSDate *date = [NSDate date];
    //NSTimeInterval ti = [date timeIntervalSince1970]*1000;
    long long ti = (long long)[date timeIntervalSince1970];
    return [NSString stringWithFormat:@"%lld",ti*1000];
}


+(NSDate *)getUTCDateFromNowDate:(NSDate *)anyDate
{
    DLog(@"Now Time = %@",anyDate);
    //设置源日期时区
    NSTimeZone* sourceTimeZone = [NSTimeZone timeZoneWithAbbreviation:@"UTC"];//或GMT
    //设置转换后的目标日期时区
    NSTimeZone* destinationTimeZone = [NSTimeZone localTimeZone];
    //得到源日期与世界标准时间的偏移量
    NSInteger sourceGMTOffset = [sourceTimeZone secondsFromGMTForDate:anyDate];
    //目标日期与本地时区的偏移量
    NSInteger destinationGMTOffset = [destinationTimeZone secondsFromGMTForDate:anyDate];
    //得到时间偏移量的差值
    NSTimeInterval interval = destinationGMTOffset - sourceGMTOffset;
    //转为现在时间
    NSDate* destinationDateNow = [[NSDate alloc] initWithTimeInterval:interval sinceDate:anyDate];
    DLog(@"UTC0 Time = %@",destinationDateNow);
    return destinationDateNow;
}


#pragma mark

+ (NSNumber *)getSafeInt:(id)obj {
    if (obj == nil || [obj isKindOfClass:[NSNull class]]) {
        return [NSNumber numberWithInt:INT_MIN];
    }
    if ([obj isKindOfClass:[NSNumber class]]) {
        return obj;
    }
    if ([obj length] == 0) {
        return [NSNumber numberWithInt:INT_MIN];
    }
    if ([obj isKindOfClass:[NSDictionary class]]) {
        return [NSNumber numberWithInt:INT_MIN];
    }
    return [NSNumber numberWithInt:[obj intValue]];
}

+ (NSNumber *)getSafeFloat:(id)obj {
    if (obj == nil || [obj isKindOfClass:[NSNull class]]) {
        return [NSNumber numberWithInt:INT_MIN];
    }
    if ([obj isKindOfClass:[NSNumber class]]) {
        return obj;
    }
    if ([obj length] == 0) {
        return [NSNumber numberWithInt:INT_MIN];
    }
    if ([obj isKindOfClass:[NSDictionary class]]) {
        return [NSNumber numberWithInt:INT_MIN];
    }
    return [NSNumber numberWithFloat:[obj floatValue]];
}

+ (NSNumber *)getSafeBool:(id)obj {
    if (obj == nil || [obj isKindOfClass:[NSNull class]]) {
        return [NSNumber numberWithInt:INT_MIN];
    }
    if ([obj isKindOfClass:[NSNumber class]]) {
        return obj;
    }
    if ([obj length] == 0) {
        return [NSNumber numberWithInt:INT_MIN];
    }
    if ([obj isKindOfClass:[NSDictionary class]]) {
        return [NSNumber numberWithInt:INT_MIN];
    }
    return [NSNumber numberWithBool:[obj boolValue]];
}

+ (NSString *)getSafeString:(id)obj {
    if (obj == nil || [obj isKindOfClass:[NSNull class]]) {
        return @"";
    }
    if ([obj isKindOfClass:[NSString class]]) {
        return obj;
    }
    if ([obj isKindOfClass:[NSDictionary class]]) {
        return @"";
    }
    return [obj stringValue];
}

#pragma mark - Null or nil
//判断数据是否是Null或者nil
+ (BOOL)isNullOrNilObject:(id)object
{
    if ([object isKindOfClass:[NSNull class]]) {
        return YES;
    }else{
        NSString *str = [NSString stringWithFormat:@"%@",object];
        if ([str isEqualToString:@"nil"]) {
            return YES;
        }
        if ([str isEqualToString:@"Nil"]) {
            return YES;
        }
        if ([str isEqualToString:@"null"]) {
            return YES;
        }
    }
    
    if (object == Nil) {
        return YES;
    }
    
    if (object == nil) {
        return YES;
    }
    return NO;
}

#pragma mark - Loading View

- (void)showLoadingViewWithTitle:(NSString *)title
{
    
}

- (void)hideLoadingView {
    
#ifndef ARC_ENABLED
    
#endif
    
}


#pragma mark - get XIB
+ (NSString *)getXIB:(Class)fromClass
{
	NSString *className = NSStringFromClass(fromClass);
	
	return className;
}



#pragma mark - Object

+ (void)setValue:(id)value forKey:(NSString *)key
{
    [[NSUserDefaults standardUserDefaults] setValue:value forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (void)setValue:(id)value forKeyPath:(NSString *)keyPath
{
    [[NSUserDefaults standardUserDefaults] setValue:value forKeyPath:keyPath];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (void)setObject:(id)obj forKey:(NSString *)key
{
    [[NSUserDefaults standardUserDefaults] setObject:obj forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (id)valueForKey:(NSString *)key
{
    return [[NSUserDefaults standardUserDefaults] valueForKey:key];
}

+ (id)valueForKeyPath:(NSString *)keyPath
{
    return [[NSUserDefaults standardUserDefaults] valueForKeyPath:keyPath];
}

+ (id)objectForKey:(NSString *)key
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:key];
}

+ (void)removeObjectForKey:(NSString *)key
{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}


#pragma mark - Font

+ (void)printAllSystemFonts
{
    printf("--------------------------------------------------------------------\n");
    NSArray *familyNames = [UIFont familyNames];
    for( NSString *familyName in familyNames ){
        printf( "Family: %s \n", [familyName UTF8String] );
        NSArray *fontNames = [UIFont fontNamesForFamilyName:familyName];
        for( NSString *fontName in fontNames ){
            printf( "\tFont: %s \n", [fontName UTF8String] );
        }
    }
    printf("--------------------------------------------------------------------\n");
}

/// set font Miller
+ (UIFont *)fontMillerTextWithSize:(CGFloat)fontSize
{
//    return [UIFont fontWithName:@"Miller-Text" size:fontSize];
    return [UIFont systemFontOfSize:fontSize];
}
+ (UIFont *)fontMillerTextBoldWithSize:(CGFloat)fontSize
{
//    return [UIFont fontWithName:@"Miller-TextBold" size:fontSize];
    return [UIFont systemFontOfSize:fontSize];
}
+ (UIFont *)fontMillerTextBoldItalicWithSize:(CGFloat)fontSize
{
//    return [UIFont fontWithName:@"Miller-TextBoldItalic" size:fontSize];
    return [UIFont systemFontOfSize:fontSize];
}
+ (UIFont *)fontMillerTextItalicWithSize:(CGFloat)fontSize
{
//    return [UIFont fontWithName:@"Miller-TextItalic" size:fontSize];
    return [UIFont systemFontOfSize:fontSize];
}


// set font Gotham
+ (UIFont *)fontGothamThinWithSize:(CGFloat)fontSize
{
//    return [UIFont fontWithName:@"Gotham-Thin" size:fontSize];
    return [UIFont systemFontOfSize:fontSize];
}
+ (UIFont *)fontGothamLightWithSize:(CGFloat)fontSize
{
//    return [UIFont fontWithName:@"Gotham-Light" size:fontSize];
    return [UIFont systemFontOfSize:fontSize];
}
+ (UIFont *)fontGothamBoldItalicWithSize:(CGFloat)fontSize
{
//    return [UIFont fontWithName:@"Gotham-BoldItalic" size:fontSize];
    return [UIFont systemFontOfSize:fontSize];
}
+ (UIFont *)fontGothamBoldWithSize:(CGFloat)fontSize
{
//    return [UIFont fontWithName:@"Gotham-Bold" size:fontSize];
    return [UIFont systemFontOfSize:fontSize];
}
+ (UIFont *)fontGothamMediumWithSize:(CGFloat)fontSize
{
//    return [UIFont fontWithName:@"Gotham-Medium" size:fontSize];
    return [UIFont systemFontOfSize:fontSize];
}

/// cache

#pragma mark - cache

+(NSString*) cacheDirectoryWithName:(NSString*)name {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *cacheDirectoryName = [documentsDirectory stringByAppendingPathComponent:name];
    return cacheDirectoryName;
}

+(void)removeCachesWithName:(NSString*)name{
    NSFileManager *fm = [NSFileManager defaultManager];
    NSString *directory = [self cacheDirectoryWithName:name];
    NSError *error = nil;
    for (NSString *file in [fm contentsOfDirectoryAtPath:directory error:&error]) {
        BOOL success = [fm removeItemAtPath:[NSString stringWithFormat:@"%@%@", directory, file] error:&error];
        if (!success || error) {
            // it failed.
            DLog(@"it failed");
        }
    }
}


+(BOOL)createFolderWithName:(NSString*)directory{
    BOOL isDir;
    NSFileManager *fileManager= [NSFileManager defaultManager];
    if(![fileManager fileExistsAtPath:directory isDirectory:&isDir]){
        if(![fileManager createDirectoryAtPath:directory withIntermediateDirectories:YES attributes:nil error:NULL]){
            DLog(@"Error: Create folder failed %@", directory);
            return NO;
        }else{
            return YES;
        }
    }else{
        DLog(@"folder exist");
        return NO;
    }
}

+(BOOL)checkFileExistWithDirectory:(NSString*)directory{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if ([fileManager fileExistsAtPath:directory]){
        return YES;
    }
    return NO;
}

+(BOOL)removeFileWithDirectory:(NSString*)directory{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL success = [fileManager removeItemAtPath:directory error:NULL];
    if (!success) {
        return NO;
    }
    return YES;
}

+(BOOL)copyFileInProjectWithFilePath:(NSString*)path toFolder:(NSString*)folder{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
	if(![fileManager fileExistsAtPath:[NSString stringWithFormat:@"%@/%@",[self cacheDirectoryWithName:folder],[path lastPathComponent]]]){
        [self createFolderWithName:[self cacheDirectoryWithName:folder]];
		[fileManager copyItemAtPath:path toPath:[NSString stringWithFormat:@"%@/%@",[self cacheDirectoryWithName:folder],[path lastPathComponent]] error:&error];
        
        if(error)
        {
//         DLog(@"Error: %@",[error description]);
            return FALSE;
        }

    }
    
    
    return YES;
}



#pragma mark - ActionLocalImage.
+(BOOL)saveImageToLocalWithImage:(UIImage*)img andFolderName:(NSString*)folder withImgName:(NSString*)imgName {
    [Util createFolderWithName:[Util cacheDirectoryWithName:folder]];
    
    NSData *imageData = UIImagePNGRepresentation(img);
    
    NSString *imagePath =[[Util cacheDirectoryWithName:folder] stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.png",imgName]];
    [self removeFileWithDirectory:imagePath];
    
    DLog(@"pre writing to file");
    if (![imageData writeToFile:imagePath atomically:NO])
    {
        DLog(@"Failed to cache image data to disk");
        return NO;
    }
    else
    {
        DLog(@"the cachedImagedPath is %@",imagePath);
    }
    
    return YES;
}

+(NSMutableDictionary *)parseToJson:(id)originData
{
    SHXMLParser		*parser			= [[SHXMLParser alloc] init];
    NSDictionary	*resultObject	= [parser parseData:originData];
    
    NSMutableDictionary *contentDic = [[[resultObject objectForKey:@"string"] objectForKey:@"leafContent"] objectFromJSONString];
    return contentDic;
}

+(NSString *)getDateTimeFromNumber:(NSString *)numberStr
{
    //numberStr = 201505181212
    
    return nil;
}

@end