//
//  SVGetOrderList.h
//  ShipWarning
//
//  Created by sunjason on 15/5/9.
//
//

#import <Foundation/Foundation.h>

@interface SVGetOrderList : NSObject

- (void)getOrderListWithParameters:(NSDictionary *)dic
                    success:(void (^)(NSData *response))success
                    failure:(void (^)(NSError *error))failure;

@end
