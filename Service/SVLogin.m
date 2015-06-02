//
//  SVLogin.h
//  ShipWarning
//
//  Created by sunjason on 15/5/6.
//
//


#import "SVLogin.h"
#import "AFHTTPRequestOperationManager.h"
#import "Logging.h"
#import "api.h"
#import "Util.h"
#import "Config.h"
#import "JSONKit.h"

@implementation SVLogin

- (instancetype)init {
    self = [super init];
    if (!self) {
        return nil;
    }
    return self;
}

/*
 接口地址：http://120.26.126.94:80/ServiceHost/ShipMonitorService.asmx/Login
 请求方式：POST
 
 登录
 传入参数：
 userName(string)用户名,
 userPassword(string)用户密码,
 IMEI(string)手机端唯一识别码
 
 {
    'order_no':'0000000001',
    'start_time':'',
    'endTime':'',
    'pageSize':'2',
    'page_index':'1'
 }
 
 返回参数：
 1.start:调用失败或成功，
 2.customer：账户所属客户；
 3.user_name:用户名
 4.status:用户状态（0，表示用户为禁用状态 禁止登录，1.表示启用状态，可登录）
 */

- (void)loginWithParameters:(NSDictionary *)dic
                     success:(void (^)(NSData *response))success
                     failure:(void (^)(NSError *error))failure
{
    NSString *strURL = [NSString stringWithFormat:@"%@",API_URL(aLogin)];
    DLog(@"%@",strURL);
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/xml"];
    
    //发送请求
    [manager POST:strURL parameters:dic success:^(AFHTTPRequestOperation *operation, id responseObject)
    {
        NSMutableDictionary *dicResponse = [Util parseToJson:responseObject];
        DLog(@" -- getSynProfile %@",dicResponse);
        
        if ([[dicResponse objectForKey:@"status"] isEqualToString:@"ok"]) {
            NSMutableDictionary *dicToSave = [[dicResponse objectForKey:@"data"] objectAtIndex:0];
            if ([self saveProfileWithDictToFileLocal:dicToSave]) {
                appDelegate().dicProfiles = [NSMutableDictionary dictionaryWithDictionary:[self getJsonFromLocal]];
            }
        }
        success(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        failure(error);
    }];
}

#pragma mark - local
-(NSMutableDictionary*)getJsonFromLocal{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error = nil; // This so that we can access the error if something goes wrong
    //NSData *JSONData;
    
    NSString *filePath = [NSString stringWithFormat:@"%@/%@",[Util cacheDirectoryWithName:folderData],@"Profile.json"];
    DLog(@"(Profile)get filePath = %@",filePath);
    if (![fileManager fileExistsAtPath:filePath]){
        NSString *filePathFromApp = [[NSBundle mainBundle] pathForResource:@"Profile" ofType:@"json"];
        [Util copyFileInProjectWithFilePath:filePathFromApp toFolder:folderData];
    }
    
    NSString *strJson=[NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:&error];
    if (!error){
        
        DLog(@"JSON VALUE = %@",strJson);
        return [strJson objectFromJSONString];
    }else{
        return nil;
    }
}

-(BOOL)saveProfileWithDictToFileLocal:(NSMutableDictionary*)dict {
    if ([dict count]){
        NSFileManager *fileManager = [NSFileManager defaultManager];
        
        NSString *filePath = [NSString stringWithFormat:@"%@/%@",[Util cacheDirectoryWithName:folderData],@"Profile.json"];
        DLog(@"write filePath = %@",filePath);
        if ([fileManager fileExistsAtPath:filePath]){
            [Util removeFileWithDirectory:filePath];
        }
        
        DLog(@"dicProfile = %@",dict);
        NSString *fileString = [SVLogin convertDictionaryToString:dict];
        NSData *fileContents = [fileString dataUsingEncoding:NSUTF8StringEncoding];
        [[NSFileManager defaultManager] createFileAtPath:filePath
                                                contents:fileContents
                                              attributes:nil];
        return YES;
    }else{
        return NO;
    }
}

+ (NSString*) convertDictionaryToString:(NSMutableDictionary*) dict
{
    NSError* error;
    NSDictionary* tempDict = [dict copy]; // get Dictionary from mutable Dictionary
    //giving error as it takes dic, array,etc only. not custom object.
    NSData* jsonData = [NSJSONSerialization dataWithJSONObject:tempDict
                                                       options:NSJSONWritingPrettyPrinted error:&error];
    
    NSString* strNSJson=  [[NSString alloc] initWithData:jsonData
                                                encoding:NSUTF8StringEncoding];
    return strNSJson;
}

@end


