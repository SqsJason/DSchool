//
//  ENGooCategory.h
//  LocalLife
//
//  Created by sunjason on 15/5/27.
//  Copyright (c) 2015年 sunjason. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ENGooCategory : NSObject

@property (nonatomic, strong) NSString *cateID;
@property (nonatomic, strong) NSString *cateName;
@property (nonatomic, strong) NSString *cateSketch;//简介
@property (nonatomic, strong) NSString *cateFatherID;//父分类ID

@end
