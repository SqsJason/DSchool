//
//  BrowserListCell.m
//  ShipWarning
//
//  Created by sunjason on 15/5/9.
//
//

#import "BrowserListCell.h"
#import "color.h"
#import "macro.h"

const float CELL_HOLDER_HEIGHT = 100.0f;
const float CELL_HOLDER_WIDTH_PADDING = 20.0;


@implementation BrowserListCell
@synthesize vHolder;
@synthesize lblTitleName;
@synthesize lblDescription;

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)layoutSubviews{
    vHolder.frame = CGRectMake(vHolder.frame.origin.x, vHolder.frame.origin.y, SCREEN_WIDTH_PORTRAIT -  CELL_HOLDER_WIDTH_PADDING, CELL_HOLDER_HEIGHT);
    vHolder.roundedCorners = TKRoundedCornerAll;
    vHolder.drawnBordersSides = TKDrawnBorderSidesAll;
    vHolder.borderColor = CLQAChatMsgBorder;
    vHolder.fillColor = [UIColor whiteColor];;
    vHolder.borderWidth = 1.0f;
    vHolder.cornerRadius = 5.0f;
}

- (void)drawRect:(CGRect)rect
{
    
}

@end
