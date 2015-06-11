//
//  CellColectionCustom.h
//  Lola
//
//  Created by hnsunflower1807 on 2/28/14.
//  Copyright (c) 2014 Harry Nguyen. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CellColectionCustom;
@protocol CellColectionCustomDelegate <NSObject>
@optional

-(void)btnStarClicked:(CellColectionCustom*)colCustom;
-(void)btnCrossClicked:(CellColectionCustom*)colCustom;
-(void)btnAddClicked:(CellColectionCustom*)colCustom;

@end


@interface CellColectionCustom : UICollectionViewCell {
    
}

@property (nonatomic, strong) id<CellColectionCustomDelegate>delegate;

@property (nonatomic, strong) IBOutlet UIImageView *imgAvatar;
@property (nonatomic, strong) IBOutlet UIButton *btnCamera;
@property (nonatomic, strong) IBOutlet UILabel *lbBg;
@property (nonatomic, strong) IBOutlet UIButton *btnStart, *btnCross;

@property (nonatomic, strong) IBOutlet UIImageView *imgPendingApproved;

-(IBAction)clickeBtnStar:(id)sender;
-(IBAction)clickeBtnCrosss:(id)sender;
-(IBAction)clickeBtnAdd:(id)sender;

@end
