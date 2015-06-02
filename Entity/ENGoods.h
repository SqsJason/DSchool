//
//  ENGoods.h
//  LocalLife
//
//  Created by sunjason on 15/5/26.
//  Copyright (c) 2015年 sunjason. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ENGoods : NSObject

@property (nonatomic, strong) NSString *goodsID;
@property (nonatomic, strong) NSString *goodsType;//商品类型
@property (nonatomic, strong) NSString *goodsName;
@property (nonatomic, strong) NSString *goodsImagePath;
@property (nonatomic, strong) UIImage  *goodsImage;

@property (nonatomic, strong) NSString *goodsSketch;//商品简介
@property (nonatomic, strong) NSString *goodsDescribe;//商品详情

@property (nonatomic, strong) NSString *goodsPrice;//商品普通价格
@property(nonatomic)          BOOL      isDiscount;
@property (nonatomic, strong) NSString *goodsDCPrice;//折扣价

@property(nonatomic)          BOOL      isGroupPurchase;
@property (nonatomic, strong) NSString *goodsGPPrice;//团购价

@property(nonatomic)          BOOL      isSeckill;//秒杀
@property (nonatomic, strong) NSString *goodsSKPrice;//秒杀价

@property (nonatomic)         NSInteger goodsInventory;//库存数量
@property (nonatomic)         NSInteger goodsSalesVolume;//商品销量
@property (nonatomic)         NSInteger goodsClickRate;//商品浏览数 或 点击量

@property(nonatomic)          BOOL      isHotGoods;//是否热门
@property(nonatomic)          BOOL      isNewGoods;//是否新品

@property (nonatomic, strong) NSString *goodsCateID;
@property (nonatomic, strong) NSString *goodsBrandID;//商品品牌

@property (nonatomic, strong) NSString *goodsSpecificationsID;//商品规格

@end