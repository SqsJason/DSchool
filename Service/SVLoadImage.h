//
//  SVLoadImage.h
//  ShipWarning
//
//  Created by sunjason on 15/5/10.
//
//

#import <Foundation/Foundation.h>

@interface SVLoadImage : NSObject

- (void)getImageWithParameters:(NSDictionary *)dic
                           success:(void (^)(NSData *response))success
                           failure:(void (^)(NSError *error))failure;

@end
