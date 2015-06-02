//
//  SVGetOrderList.m
//  ShipWarning
//
//  Created by sunjason on 15/5/9.
//
//

#import "SVGetOrderList.h"
#import "AFHTTPRequestOperationManager.h"
#import "Logging.h"
#import "api.h"

@implementation SVGetOrderList

- (void)getOrderListWithParameters:(NSDictionary *)dic
                           success:(void (^)(NSData *response))success
                           failure:(void (^)(NSError *error))failure
{
    NSString *strURL = [NSString stringWithFormat:@"%@",API_URL(aGetOrderList)];
    DLog(@"%@",strURL);
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/xml"];
    
    //发送请求
    [manager POST:strURL parameters:dic success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSLog(@"JSON: %@", responseObject);
         success(responseObject);
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         NSLog(@"Error: %@", error);
         failure(error);
     }];
}

@end
