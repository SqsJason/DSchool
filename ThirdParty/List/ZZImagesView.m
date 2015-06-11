//
//  ZZImagesView.m
//  ZZList
//
//  Created by 黄 伟华 on 5/9/14.
//  Copyright (c) 2014 黄伟华. All rights reserved.
//

#import "ZZImagesView.h"
#import "macro.h"

@implementation ZZImagesView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor lightGrayColor];
        
        onePicture_Max_W = (SCREEN_WIDTH_PORTRAIT - 100);
        onePicture_Max_H = 200;
        
        multiPhoto_W     = (SCREEN_WIDTH_PORTRAIT - 120)/3;
        multiPhoto_H     = multiPhoto_W;
    }
    return self;
}
-(void)setImags:(NSArray *)imgs
{
    if (imgs && imgs >0)
    {
        if (imgs.count == 1)
        {
            UIImageView * one = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, onePictureHeight)];
            UIImage *img = [UIImage imageNamed:imgs[0]];
            
            float photoW;
            float photoH;
            
            if (img.size.width > img.size.height) {
                if (img.size.width > onePicture_Max_W) {
                    photoW = onePicture_Max_W;
                    photoH = (img.size.height/img.size.width)*onePicture_Max_W;
                }else{
                    photoW = img.size.width;
                    photoH = img.size.height;
                }
                one.frame = CGRectMake(0, 0, photoW, photoH);
            }else{
                if (img.size.height > onePicture_Max_H) {
                    photoH = onePicture_Max_H;
                    photoW = (img.size.width/img.size.height)*onePicture_Max_H;
                }else{
                    photoW = img.size.width;
                    photoH = img.size.height;
                }
                one.frame = CGRectMake(0, 0, photoW, photoH);
            }
            
            one.image = img;
            
            [self addSubview:one];
            self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, [self.class heightForImages:imgs]);
        }
        else
        {
            [imgs enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                if (idx < 6) {
                    int row = (int)idx/oneRowCount;
                    int col = idx%oneRowCount;
                    
                    CGRect rect = CGRectMake(startX + colSpace * col + multiPhoto_W*col, startY + multiPhoto_W * row + rowSpace * row, multiPhoto_W, multiPhoto_H);
                    UIImageView * imageV = [[UIImageView alloc] initWithFrame:rect];
                    imageV.image = [UIImage imageNamed:imgs[idx]];
                    [self addSubview:imageV];
                }
            }];
            self.backgroundColor = [UIColor lightGrayColor];
            NSLog( @"%f",[self.class heightForImages:imgs]);
            self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, [self.class heightForImages:imgs]);
        }
    }

}


+(float)heightForImages:(NSArray *)images
{
    int row;
    if (images.count % 3 == 0) {
        row = (int)images.count/oneRowCount;
    }else{
        row = (int)images.count/oneRowCount + 1;
    }
    
    float multiPhoto_WH = (SCREEN_WIDTH_PORTRAIT - 120)/3;
    
    if (row == 0) {
        row = 1;
    }else if (row > 2) {
        row = 2;
    }
    
    if (!images || images.count ==0) {
        return 0;
    }
    if (images.count ==1) {
        float photoW;
        float photoH;
        
        float maxW = (SCREEN_WIDTH_PORTRAIT - 100);
        float maxH = 200;
        
        UIImage *img = [UIImage imageNamed:images[0]];
        
        if (img.size.width > img.size.height) {
            if (img.size.width > maxW) {
                photoW = maxW;
                photoH = (img.size.height/img.size.width)*maxW;
            }else{
                photoW = img.size.width;
                photoH = img.size.height;
            }
        }else{
            if (img.size.height > maxH) {
                photoH = maxH;
                photoW = (img.size.width/img.size.height)*maxH;
            }else{
                photoW = img.size.width;
                photoH = img.size.height;
            }
        }
        return photoH;
    }
    return startY + multiPhoto_WH * row + rowSpace * row;
}
@end
