//
//  ENBrand.h
//  LocalLife
//
//  Created by sunjason on 15/5/27.
//  Copyright (c) 2015年 sunjason. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ENBrand : NSObject

@property (nonatomic, strong) NSString *brandID;
@property (nonatomic, strong) NSString *brandName;
@property (nonatomic, strong) NSString *brandSketch;//简介
@property (nonatomic, strong) NSString *brandDescribe;//详情
@property (nonatomic, strong) NSString *brandLogo;//分类ID

@end
