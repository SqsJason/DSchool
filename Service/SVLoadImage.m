//
//  SVLoadImage.m
//  ShipWarning
//
//  Created by sunjason on 15/5/10.
//
//

#import "SVLoadImage.h"
#import "AFHTTPRequestOperationManager.h"
#import "Logging.h"
#import "api.h"

@implementation SVLoadImage

- (void)getImageWithParameters:(NSDictionary *)dic
                       success:(void (^)(NSData *response))success
                       failure:(void (^)(NSError *error))failure
{
    NSString *strURL = [NSString stringWithFormat:@"%@",API_URL(aGetImage)];
    DLog(@"%@",strURL);
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/xml"];
    
    //发送请求
    [manager POST:strURL parameters:dic success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         success(responseObject);
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         NSLog(@"Error: %@", error);
         failure(error);
     }];
    
}

@end
