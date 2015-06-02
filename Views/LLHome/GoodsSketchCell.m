//
//  GoodsSketchCell.m
//  LocalLife
//
//  Created by sunjason on 15/5/26.
//  Copyright (c) 2015年 sunjason. All rights reserved.
//

#import "GoodsSketchCell.h"

@interface GoodsSketchCell()

@property (nonatomic, strong) UILabel *cellLabel;
@property (nonatomic, strong) ENGoods *detailGoods;

@end

@implementation GoodsSketchCell

- (void)setupViewWithPhoto:(ENGoods *)goods
{
    self.photoImageView.image = goods.goodsImage;
    self.cellLabel.text = goods.goodsName;
}

#pragma mark - setup
- (void)prepareForReuse
{
    [super prepareForReuse];
}

#pragma mark - lazy loaders
- (UIImageView *)cellImageView
{
    return self.photoImageView;
}

@end
