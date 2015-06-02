//
//  GoodsSketchCell.h
//  LocalLife
//
//  Created by sunjason on 15/5/26.
//  Copyright (c) 2015年 sunjason. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BeanTransitionManager.h"
#import "ENGoods.h"

@interface GoodsSketchCell : UICollectionViewCell <BeanTransitionManagerCellExpanding>

@property (nonatomic, readonly) UIImageView *cellImageView;
@property (nonatomic, strong)   UIImageView *photoImageView;


- (void)setupViewWithPhoto:(ENGoods *)goods;

@end
