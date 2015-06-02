//
//  ENOrder.m
//  ShipWarning
//
//  Created by sunjason on 15/5/16.
//
//

#import "ENOrder.h"
#import "Util.h"

@implementation ENOrder

@synthesize order_no;
@synthesize customer;
@synthesize ship_no;
@synthesize order_status;
@synthesize ship_contact_name;
@synthesize contact_mobilephone;

-(instancetype)initWithAttributes:(NSDictionary *)attributes
{
    self = [super init];
    if (!self) {
        return nil;
    }
    
    if (![Util isNullOrNilObject:[attributes objectForKey:@"order_no"]]) {
        order_no = [attributes objectForKey:@"order_no"];
    }
    
    if (![Util isNullOrNilObject:[attributes objectForKey:@"customer"]]) {
        customer = [attributes objectForKey:@"customer"];
    }
    
    if (![Util isNullOrNilObject:[attributes objectForKey:@"ship_no"]]) {
        ship_no = [attributes objectForKey:@"ship_no"];
    }
    
    if (![Util isNullOrNilObject:[attributes objectForKey:@"order_status"]]) {
        order_status = [attributes objectForKey:@"order_status"];
    }
    
    if (![Util isNullOrNilObject:[attributes objectForKey:@"ship_contact_name"]]) {
        ship_contact_name = [attributes objectForKey:@"ship_contact_name"];
    }
    
    if (![Util isNullOrNilObject:[attributes objectForKey:@"contact_mobilephone"]]) {
       contact_mobilephone = [attributes objectForKey:@"contact_mobilephone"];
    }
    
    return self;
}

@end
