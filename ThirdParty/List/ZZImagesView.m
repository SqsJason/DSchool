//
//  ZZImagesView.m
//  ZZList
//
//  Created by 黄 伟华 on 5/9/14.
//  Copyright (c) 2014 黄伟华. All rights reserved.
//

#import "ZZImagesView.h"

@implementation ZZImagesView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
-(void)setImags:(NSArray *)imgs
{
    if (imgs && imgs >0)
    {
        if (imgs.count == 1)
        {
            UIImageView * one = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), onePictureHeight)];
            one.image = [UIImage imageNamed:imgs[0]];
            [self addSubview:one];
            self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, [self.class heightForImages:imgs]);
        }
        else
        {
            [imgs enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                int row = (int)idx/oneRowCount;
                int col = idx%oneRowCount;
                
                CGRect rect = CGRectMake(startX + colSpace * col + width*col, startY + heigth * row + rowSpace * row, width, heigth);
                UIImageView * imageV = [[UIImageView alloc] initWithFrame:rect];
                imageV.image = [UIImage imageNamed:imgs[idx]];
                [self addSubview:imageV];
                
            }];
            self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, [self.class heightForImages:imgs]);
            
        }
    }

}


+(float)heightForImages:(NSArray *)images
{
    int row = (int)images.count/oneRowCount;

    
    if (!images || images.count ==0) {
        return 0;
    }
    if (images.count ==1) {
        return onePictureHeight;
    }
    return startY + heigth * row + rowSpace * row;
}
@end
