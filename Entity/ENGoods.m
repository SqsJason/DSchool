//
//  ENGoods.m
//  LocalLife
//
//  Created by sunjason on 15/5/26.
//  Copyright (c) 2015年 sunjason. All rights reserved.
//

#import "ENGoods.h"

@implementation ENGoods
@synthesize goodsID;
@synthesize goodsType;//商品类型
@synthesize goodsName;
@synthesize goodsImagePath;
@synthesize goodsImage;
@synthesize goodsSketch;//商品简介
@synthesize goodsDescribe;//商品详情
@synthesize goodsPrice;//商品普通价格
@synthesize isDiscount;
@synthesize goodsDCPrice;//折扣价
@synthesize isGroupPurchase;
@synthesize goodsGPPrice;//团购价
@synthesize isSeckill;//秒杀
@synthesize goodsSKPrice;//秒杀价
@synthesize goodsInventory;//库存数量
@synthesize goodsSalesVolume;//商品销量
@synthesize goodsClickRate;//商品浏览数 或 点击量
@synthesize isHotGoods;//是否热门
@synthesize isNewGoods;//是否新品
@synthesize goodsCateID;
@synthesize goodsBrandID;//商品品牌
@synthesize goodsSpecificationsID;//商品规格

@end
