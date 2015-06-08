//
//  ZZImagesView.h
//  ZZList
//
//  Created by 黄 伟华 on 5/9/14.
//  Copyright (c) 2014 黄伟华. All rights reserved.
//

#import <UIKit/UIKit.h>


static float onePictureHeight = 145.f;  //一张图片的高度

static int oneRowCount = 3; // 一行 3 col

static float startX = 0.f;
static float startY = 10.f;

static float width = 70.f;
static float heigth = 70.f;

static float colSpace = 10.f;
static float rowSpace = 10.f;


@interface ZZImagesView : UIView

+(float)heightForImages:(NSArray *)images;
-(void)setImags:(NSArray *)imgs;
@end
