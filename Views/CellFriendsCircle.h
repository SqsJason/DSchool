//
//  CellFriendsCircle.h
//  DSchool
//
//  Created by sunjason on 15/6/10.
//  Copyright (c) 2015年 sunjason. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FCListEntity,ZZImagesView;

@interface CellFriendsCircle : UITableViewCell

{
    UIImageView  * head;
    UILabel      * inCount;
    UILabel      * outCount;
    
    UILabel      * name;
    UILabel      * content;
    ZZImagesView * bigImage;
    
    UILabel      * date;
    UILabel      * wantCount;
    UIImageView  * state;
    
    UILabel      *lblDateAndTime;
    UIImageView  * imvCommentBG;
    UILabel      *lblComment;
    UIImageView  * genderIcon;
}
+(UIFont *)fontOfContent;
+(CGFloat)contentWidth;

-(void)setListEntity:(FCListEntity *)entity;
-(void)removeFrames;

@end

@interface FCListEntity : NSObject
@property (nonatomic, weak)   NSString  * head;
@property (nonatomic, weak)   NSString  * inCount;
@property (nonatomic, weak)   NSString  * outCount;

@property (nonatomic, weak)   NSString  * name;
@property (nonatomic, weak)   NSString  * content;
@property (nonatomic, strong) NSArray   * images;
@property (nonatomic, weak)   NSString  * date;
@property (nonatomic, weak)   NSString  * wantCount;
@property (nonatomic, weak)   NSString  * state;
@property (nonatomic, weak)   NSString  * comment;

+(CGFloat)getHightForListEntity:(FCListEntity *)listEntity font:(UIFont *)font width:(CGFloat)width;

@end
