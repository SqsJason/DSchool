//
//  CellFriendsCircle.m
//  DSchool
//
//  Created by sunjason on 15/6/10.
//  Copyright (c) 2015年 sunjason. All rights reserved.
//

#import "CellFriendsCircle.h"
#import "ZZImagesView.h"
#import "NSString+Size.h"
#import "macro.h"

static const float IMV_HEAD_PADDING_L = 10.0;
static const float IMV_HEAD_PADDING_T = 10.0;
static const float IMV_HEAD_WH        = 40.0;

static const float IMV_NAME_W_MAX     = 180.0;
static const float IMV_NAME_H_MAX     = 20.0;
static const float IMV_TIME_W         = 120.0;
static const float IMV_TIME_H         = 20.0;

@implementation CellFriendsCircle
{
    CGRect bigImageFrame;
    CGRect contentFrame;
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        head = [[UIImageView alloc] initWithFrame:CGRectMake(IMV_HEAD_PADDING_L, IMV_HEAD_PADDING_T, IMV_HEAD_WH, IMV_HEAD_WH)];
        name = [[UILabel alloc] init];
        content = [[UILabel alloc] init];
        bigImage = [[ZZImagesView alloc] init];
        lblDateAndTime = [[UILabel alloc] init];
        lblComment = [[UILabel alloc] init];
        imvCommentBG = [[UIImageView alloc] init];
        genderIcon = [[UIImageView alloc] init];
        
        [self.contentView addSubview:head];
        [self.contentView addSubview:name];
        [self.contentView addSubview:genderIcon];
        [self.contentView addSubview:content];
        [self.contentView addSubview:bigImage];
        [self.contentView addSubview:lblDateAndTime];
        [self.contentView addSubview:imvCommentBG];
        [self.contentView addSubview:lblComment];
    }
    return self;
}

+(UIFont *)fontOfContent
{
    return [UIFont systemFontOfSize:14.f];
}

+(CGFloat)contentWidth
{
    return (SCREEN_WIDTH_PORTRAIT - 80);
}

-(void)removeFrames
{
    name.frame = CGRectZero;
    content.frame = CGRectZero;
    bigImage.frame = CGRectZero;
    for (UIView *subV in bigImage.subviews) {
        [subV removeFromSuperview];
    }
    lblDateAndTime.frame = CGRectZero;
    lblComment.frame = CGRectZero;
    imvCommentBG.frame = CGRectZero;
    genderIcon.frame = CGRectZero;
}

-(void)setListEntity:(FCListEntity *)entity
{
    if (!entity) {
        return;
    }
    
    //
    head.image = [UIImage imageNamed:entity.head];
    
    //
    name.text = entity.name;
    name.font = [self.class fontOfContent];
    CGSize nameSize = [entity.name textSizeWithFont:name.font constrainedToSize:CGSizeMake(IMV_NAME_W_MAX, IMV_NAME_H_MAX) lineBreakMode:NSLineBreakByWordWrapping];
    name.frame = CGRectMake(head.frame.size.width + 20, IMV_HEAD_PADDING_T, nameSize.width, IMV_NAME_H_MAX);
    
    
    //
    genderIcon.frame = CGRectMake(nameSize.width + name.frame.origin.x + 15, name.frame.origin.y, 18, 18);
    genderIcon.image = [UIImage imageNamed:@"icon_sex_female_red"];
    
    
    //
    content.lineBreakMode = NSLineBreakByWordWrapping;
    content.numberOfLines = 0;
    content.font = [self.class fontOfContent];
    content.text  = entity.content;
    CGSize sizeContent = [entity.content textSizeWithFont:[self.class fontOfContent] constrainedToSize:CGSizeMake([self.class contentWidth], 200) lineBreakMode:NSLineBreakByWordWrapping];
    content.frame = CGRectMake(head.frame.size.width + 20, nameSize.height + 2*IMV_HEAD_PADDING_T, sizeContent.width, sizeContent.height);
    
    
    //big image frame
    if (!entity.images)
    {
        bigImage.hidden = YES;
    }else
    {
        bigImage.hidden = NO;
        [bigImage setImags:entity.images];
    }
    
    //
    CGRect bimvFrame = bigImage.frame;
    bimvFrame.origin.x = head.frame.size.width + 20;
    bimvFrame.origin.y = content.frame.origin.y + content.frame.size.height + 10;
    bigImage.frame = bimvFrame;

    
    //
    lblDateAndTime.font = [self.class fontOfContent];
    lblDateAndTime.text = @"3小时前";
    lblDateAndTime.frame = CGRectMake(head.frame.size.width + 20, bimvFrame.origin.y + bimvFrame.size.height + IMV_HEAD_PADDING_T, IMV_TIME_W, IMV_TIME_H);
    
    
    //
    lblComment.font = [UIFont systemFontOfSize:13];
    lblComment.lineBreakMode = NSLineBreakByWordWrapping;
    lblComment.numberOfLines = 1;
    lblComment.text = entity.comment;
    CGSize sizeComment = [lblComment.text textSizeWithFont:lblComment.font constrainedToSize:CGSizeMake([self.class contentWidth], 300) lineBreakMode:NSLineBreakByWordWrapping];
    lblComment.frame = CGRectMake(head.frame.size.width + 25, lblDateAndTime.frame.origin.y + IMV_TIME_H + IMV_HEAD_PADDING_T, sizeComment.width - 10, sizeComment.height);
    
    
    imvCommentBG.frame = CGRectMake(head.frame.size.width + 15, lblComment.frame.origin.y - IMV_HEAD_PADDING_T, [self.class contentWidth], sizeComment.height + 15);
    imvCommentBG.image = [UIImage imageNamed:@"icon_discovery_content_bg"];
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
    CGFloat contentHeight = [contentString textSizeWithFont:[self.class fontOfContent] constrainedToSize:CGSizeMake([self.class contentWidth], 1000) lineBreakMode:NSLineBreakByWordWrapping].height;
    
    return contentHeight;
}

@end
/*
 *****************************************************
 */

@implementation FCListEntity


+(CGFloat)getHightForListEntity:(FCListEntity *)listEntity font:(UIFont *)font width:(CGFloat)width
{
    CGFloat headAddBottom = 13*IMV_HEAD_PADDING_T;
    
    CGFloat contentHeight = 0.f;
    CGFloat imageHeight  = 0.f;
    
    
    // 内容高度
    contentHeight = [listEntity.content textSizeWithFont:font constrainedToSize:CGSizeMake(width, 200) lineBreakMode:NSLineBreakByWordWrapping].height;
    
    //大图存在时的高度
    if (listEntity.images && listEntity.images.count >0) {
        imageHeight = [ZZImagesView heightForImages:listEntity.images] ;
    }
    return contentHeight + imageHeight + headAddBottom;
}

@end
