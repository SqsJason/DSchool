//
//  ENOrder.h
//  ShipWarning
//
//  Created by sunjason on 15/5/16.
//
//

#import <Foundation/Foundation.h>

/*
{
 "order_no":"0000000004",
 "customer":"武钢股份",
 "ship_no":"SP00002",
 "order_status":0,
 "ship_contact_name":"kk",
 "contact_mobilephone":"13800138000"
 }
 */

@interface ENOrder : NSObject

@property (nonatomic, strong) NSString* order_no;
@property (nonatomic, strong) NSString* customer;
@property (nonatomic, strong) NSString* ship_no;
@property (nonatomic, strong) NSString* order_status;
@property (nonatomic, strong) NSString* ship_contact_name;
@property (nonatomic, strong) NSString* contact_mobilephone;

-(instancetype)initWithAttributes:(NSDictionary *)attributes;

@end
