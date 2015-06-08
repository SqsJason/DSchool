//
//  YTListCell.h
//  ZZList
//
//  Created by 黄 伟华 on 5/9/14.
//  Copyright (c) 2014 黄伟华. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZZListEntity,ZZImagesView;
@interface YTListCell : UITableViewCell
{
    IBOutlet UIImageView * head;
    IBOutlet UILabel * inCount;
    IBOutlet UILabel * outCount;
    
    IBOutlet UILabel * name;
    IBOutlet UILabel * content;
    IBOutlet ZZImagesView * bigImage;
    
    IBOutlet UILabel * date;
    IBOutlet UILabel * wantCount;

    IBOutlet UIImageView * state;
}
+(UIFont *)fontOfContent;
+(CGFloat)contentWidth;

-(void)setListEntity:(ZZListEntity *)entity;
@end

@interface ZZListEntity : NSObject
@property (nonatomic, weak) NSString * head;
@property (nonatomic, weak) NSString * inCount;
@property (nonatomic, weak) NSString * outCount;

@property (nonatomic, weak) NSString * name;
@property (nonatomic, weak) NSString * content;
@property (nonatomic, strong) NSArray * images;
@property (nonatomic, weak) NSString * date;
@property (nonatomic, weak) NSString * wantCount;
@property (nonatomic, weak) NSString * state;

+(CGFloat)getHightForListEntity:(ZZListEntity *)listEntity font:(UIFont *)font width:(CGFloat)width;
@end