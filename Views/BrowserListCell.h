//
//  BrowserListCell.h
//  ShipWarning
//
//  Created by sunjason on 15/5/9.
//
//

#import <UIKit/UIKit.h>
#import "TKRoundedView.h"

@interface BrowserListCell : UITableViewCell

@property (weak, nonatomic) IBOutlet TKRoundedView *vHolder;
@property (weak, nonatomic) IBOutlet UILabel *lblTitleName;
@property (weak, nonatomic) IBOutlet UILabel *lblDescription;
@property (weak, nonatomic) IBOutlet UIButton *btnArrow;
@property (weak, nonatomic) IBOutlet UILabel *lblName;

@end
