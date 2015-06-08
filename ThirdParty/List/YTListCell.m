//
//  YTListCell.m
//  ZZList
//
//  Created by 黄 伟华 on 5/9/14.
//  Copyright (c) 2014 黄伟华. All rights reserved.
//

#import "YTListCell.h"
#import "ZZImagesView.h"
@implementation YTListCell
{
    CGRect bigImageFrame;
    CGRect contentFrame;
}
- (void)awakeFromNib
{
    // Initialization code
    
    bigImageFrame = bigImage.frame;
    contentFrame  = content.frame;
    
}
+(UIFont *)fontOfContent
{
    return [UIFont systemFontOfSize:14.f];
}
+(CGFloat)contentWidth
{
    return 250.f;
}

-(void)setListEntity:(ZZListEntity *)entity
{
    if (!entity) {
        return;
    }
    head.image = [UIImage imageNamed:entity.head];
    name.text = entity.name;
    inCount.text = entity.inCount;
    outCount.text = entity.outCount;
    content.text  = entity.content;
    date.text = entity.date;
    wantCount.text = [NSString stringWithFormat:@"%@个小伙伴想要",entity.wantCount];
    state.image = nil;
    
    
    
    
    
    //big image frame
    if (!entity.images)
    {
        bigImage.hidden = YES;
    }else
    {
        bigImage.hidden = NO;

        [bigImage setImags:entity.images];
    }
    
    // content frame
    CGRect frame = CGRectMake(contentFrame.origin.x, contentFrame.origin.y, [self.class contentWidth], [self heightOfContent:entity.content]);
    
    content.frame = frame;
    
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
#pragma mark -  resize
-(CGFloat)heightOfContent:(NSString *)contentString
{
    // 内容高度
    CGFloat contentHeight = [contentString sizeWithFont:[self.class fontOfContent] constrainedToSize:CGSizeMake([self.class contentWidth], 1000)].height;
    
    return contentHeight;
}

@end
/*
 
 *****************************************************
 
 */

@implementation ZZListEntity


+(CGFloat)getHightForListEntity:(ZZListEntity *)listEntity font:(UIFont *)font width:(CGFloat)width
{
    CGFloat originalHeight = 150.f;
    
    CGFloat headAddBottom = 80.f;
    
    CGFloat contentHeight = 0.f;
    CGFloat imageHeight  = 0.f;
    
    
    // 内容高度
    contentHeight = [listEntity.content sizeWithFont:font constrainedToSize:CGSizeMake(width, 1000)].height;
    
    
    //大图存在时的高度
    if (listEntity.images && listEntity.images.count >0) {
        imageHeight = [ZZImagesView heightForImages:listEntity.images] ;
    }
    
    
//    if ((contentHeight + imageHeight + headAddBottom)< originalHeight) {
//        return originalHeight;
//    }
    
    return contentHeight + imageHeight + headAddBottom;
}
@end