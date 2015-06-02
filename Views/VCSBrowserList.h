//
//  VCSBrowserList.h
//  ShipWarning
//
//  Created by sunjason on 15/5/8.
//
//

#import <UIKit/UIKit.h>
#import "StandarViewController.h"

@interface VCSBrowserList : StandarViewController

@property (nonatomic) BrowserListStyle listStyle;//标识
@property (weak, nonatomic) IBOutlet UITableView *tblBrowserList;
@property (weak, nonatomic) IBOutlet UILabel *lbNoData;

@end
