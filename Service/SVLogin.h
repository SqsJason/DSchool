//
//  SVLogin.h
//  ShipWarning
//
//  Created by sunjason on 15/5/6.
//
//


#import <Foundation/Foundation.h>

@interface SVLogin : NSObject


@property (nonatomic, strong) NSString *authValue;
@property (nonatomic, strong) NSString *pid;
@property (nonatomic, strong) NSString *createdOn;
@property (nonatomic, strong) NSString *profileImageId;
@property (nonatomic, strong) NSString *userEmailAddress;
@property (nonatomic, strong) NSString *userFirstName;
@property (nonatomic, strong) NSString *userLastName;
@property (nonatomic, strong) NSString *userThirdPartyId;
@property (nonatomic, strong) NSString *userThirdPartyAuthorizationKey;

@property (nonatomic, strong) NSString *city, *educationLevel;

- (instancetype)init;
- (NSMutableDictionary *)getJsonFromLocal;
- (BOOL)saveProfileWithDictToFileLocal:(NSMutableDictionary*)dict;
+ (NSString*) convertDictionaryToString:(NSMutableDictionary*) dict;

- (void)loginWithParameters:(NSDictionary *)dic
                     success:(void (^)(NSData *response))success
                     failure:(void (^)(NSError *error))failure;

@end
