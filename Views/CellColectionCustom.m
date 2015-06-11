//
//  CellColectionCustom.m
//  Lola
//
//  Created by hnsunflower1807 on 2/28/14.
//  Copyright (c) 2014 Harry Nguyen. All rights reserved.
//

#import "CellColectionCustom.h"

@implementation CellColectionCustom

@synthesize delegate;
@synthesize lbBg;
@synthesize imgAvatar, btnStart, btnCross,btnCamera;
@synthesize imgPendingApproved;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */


//////////////////////////////////////////////////////
//////////////////  METHODS. ////////////////////////
////////////////////////////////////////////////////
#pragma mark - METHODS.




//////////////////////////////////////////////////////
//////////////////  ACTIONS. ////////////////////////
////////////////////////////////////////////////////
#pragma mark - ACTIONS.

-(IBAction)clickeBtnStar:(id)sender {
    [delegate btnStarClicked:self];
    
}

-(IBAction)clickeBtnCrosss:(id)sender {
    [delegate btnCrossClicked:self];
    
    
}
-(IBAction)clickeBtnAdd:(id)sender {
    [delegate btnAddClicked:self];
    
    
}


//////////////////////////////////////////////////////
//////////////////  DELEGATE. ///////////////////////
////////////////////////////////////////////////////
#pragma mark - DELEGATE.





@end
