//
//  StandarViewController.h
//  ShipWarning
//
//  Created by sunjason on 15/5/7.
//
//

#import <UIKit/UIKit.h>
#import "Logging.h"
#import "macro.h"
#import "Util.h"
#import "color.h"
#import "JSONKit.h"

typedef NS_ENUM(NSUInteger, BrowserListStyle) {
    BrowserListStyleOntime,
    BrowserListStyleHistory,
    BrowserListStyleAlarm
};

@interface StandarViewController : UIViewController

@property (nonatomic) BOOL isNotBackModel;
@end
