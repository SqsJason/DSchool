//
//  UITextField+ASTextField.m
//  ASTextViewDemo
//
//  Created by Adil Soomro on 4/14/14.
//  Copyright (c) 2014 Adil Soomro. All rights reserved.
//

#import "ASTextField.h"
#define kLeftPadding 10
#define kVerticalPadding 12
#define kHorizontalPadding 10

@interface IQPopUp : UIView

@property (nonatomic,assign) CGRect showOnRect;
@property (nonatomic,assign) int popWidth;
@property (nonatomic,assign) CGRect fieldFrame;
@property (nonatomic,copy) NSString *strMsg;
@property (nonatomic,retain) UIColor *popUpColor;

@end

@implementation IQPopUp
@synthesize showOnRect,popWidth,fieldFrame,popUpColor;

-(void)drawRect:(CGRect)rect{
    const CGFloat *color=CGColorGetComponents(popUpColor.CGColor);
    
    UIGraphicsBeginImageContext(CGSizeMake(30, 20));
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetRGBFillColor(ctx, color[0], color[1], color[2], 1);
    CGContextSetShadowWithColor(ctx, CGSizeMake(0, 0), 7.0, [UIColor blackColor].CGColor);
    CGPoint points[3] = { CGPointMake(15, 5), CGPointMake(25, 25),
        CGPointMake(5,25)};
    CGContextAddLines(ctx, points, 3);
    CGContextClosePath(ctx);
    CGContextFillPath(ctx);
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    CGRect imgframe=CGRectMake((showOnRect.origin.x+((showOnRect.size.width-30)/2)), ((showOnRect.size.height/2)+showOnRect.origin.y), 30, 13);
    
    UIImageView *img=[[UIImageView alloc] initWithImage:viewImage highlightedImage:nil];
    [self addSubview:img];
    img.translatesAutoresizingMaskIntoConstraints=NO;
    NSDictionary *dict=NSDictionaryOfVariableBindings(img);
    [img.superview addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:[NSString stringWithFormat:@"H:|-%f-[img(%f)]",imgframe.origin.x,imgframe.size.width] options:NSLayoutFormatDirectionLeadingToTrailing  metrics:nil views:dict]];
    [img.superview addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:[NSString stringWithFormat:@"V:|-%f-[img(%f)]",imgframe.origin.y,imgframe.size.height] options:NSLayoutFormatDirectionLeadingToTrailing  metrics:nil views:dict]];
    
    UIFont *font=[UIFont fontWithName:FontName size:FontSize];
    CGSize size=[self.strMsg boundingRectWithSize:CGSizeMake(fieldFrame.size.width-(PaddingInErrorPopUp*2), 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil].size;
    size=CGSizeMake(ceilf(size.width), ceilf(size.height));
    
    UIView *view=[[UIView alloc] initWithFrame:CGRectZero];
    [self insertSubview:view belowSubview:img];
    view.backgroundColor=self.popUpColor;
    view.layer.cornerRadius=5.0;
    view.layer.shadowColor=[[UIColor blackColor] CGColor];
    view.layer.shadowRadius=5.0;
    view.layer.shadowOpacity=1.0;
    view.layer.shadowOffset=CGSizeMake(0, 0);
    view.translatesAutoresizingMaskIntoConstraints=NO;
    dict=NSDictionaryOfVariableBindings(view);
    [view.superview addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:[NSString stringWithFormat:@"H:|-%f-[view(%f)]",fieldFrame.origin.x+(fieldFrame.size.width-(size.width+(PaddingInErrorPopUp*2))),size.width+(PaddingInErrorPopUp*2)] options:NSLayoutFormatDirectionLeadingToTrailing  metrics:nil views:dict]];
    [view.superview addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:[NSString stringWithFormat:@"V:|-%f-[view(%f)]",imgframe.origin.y+imgframe.size.height,size.height+(PaddingInErrorPopUp*2)] options:NSLayoutFormatDirectionLeadingToTrailing  metrics:nil views:dict]];
    
    UILabel *lbl=[[UILabel alloc] initWithFrame:CGRectZero];
    lbl.font=font;
    lbl.numberOfLines=0;
    lbl.backgroundColor=[UIColor clearColor];
    lbl.text=self.strMsg;
    lbl.textColor=ColorFont;
    [view addSubview:lbl];
    
    lbl.translatesAutoresizingMaskIntoConstraints=NO;
    dict=NSDictionaryOfVariableBindings(lbl);
    [lbl.superview addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:[NSString stringWithFormat:@"H:|-%f-[lbl(%f)]",(float)PaddingInErrorPopUp,size.width] options:NSLayoutFormatDirectionLeadingToTrailing  metrics:nil views:dict]];
    [lbl.superview addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:[NSString stringWithFormat:@"V:|-%f-[lbl(%f)]",(float)PaddingInErrorPopUp,size.height] options:NSLayoutFormatDirectionLeadingToTrailing  metrics:nil views:dict]];
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    [self removeFromSuperview];
    return NO;
}

@end


@interface ASTextField (){
    ASTextFieldType _type;
    NSString *strMsg;
    IQPopUp *popUp;
    UIColor *popUpColor;
}

@end

@implementation ASTextField
@synthesize presentInView,validateOnCharacterChanged,popUpColor,isMandatory,validateOnResign;

- (CGRect)textRectForBounds:(CGRect)bounds {
    UIEdgeInsets edge = [self edgeInsetsForType:_type];
    
    CGFloat x = bounds.origin.x + edge.left +kLeftPadding;
//    CGFloat y = bounds.origin.y + kVerticalPadding;
    
    
    return CGRectMake(x,0,bounds.size.width - kHorizontalPadding*2, bounds.size.height);
    
}
- (CGRect)editingRectForBounds:(CGRect)bounds {
    return [self textRectForBounds:bounds];
}

- (void)setupTextFieldWithIconName:(NSString *)name{
    [self setupTextFieldWithType:ASTextFieldTypeDefault withIconName:name];
}
- (void)setupTextFieldWithType:(ASTextFieldType)type withIconName:(NSString *)name{
    UIEdgeInsets edge = [self edgeInsetsForType:type];
    NSString *imageName = [self backgroundImageNameForType:type];
    CGRect imageViewFrame = [self iconImageViewRectForType:type];
    _type = type;
    
    
    UIImage *image = [UIImage imageNamed:imageName];
    image = [image resizableImageWithCapInsets:edge];
    
    [self setBackground:image];
    
    UIImage *icon = [UIImage imageNamed:name];
    
    //make an imageview to show an icon on the left side of textfield
    UIImageView * iconImage = [[UIImageView alloc] initWithFrame:imageViewFrame];
    [iconImage setImage:icon];
    [iconImage setContentMode:UIViewContentModeCenter];
    self.leftView = iconImage;
    self.leftViewMode = UITextFieldViewModeAlways;

    [self setNeedsDisplay]; //force reload for updated editing rect for bound to take effect.
}
- (CGRect)iconImageViewRectForType:(ASTextFieldType) type{
    UIEdgeInsets edge = [self edgeInsetsForType:type];
    if (type == ASTextFieldTypeRound) {
        return CGRectMake(0, 0, edge.left*2, self.frame.size.height); //to put the icon inside
    }
    /*
     if (type == ASTextFieldTypeBlahBlah) {
     return 786; //whatever suits your field
     }
     */
    
    return CGRectMake(0, 0, edge.left, self.frame.size.height); // default
}
- (UIEdgeInsets)edgeInsetsForType:(ASTextFieldType) type{
    if (type == ASTextFieldTypeRound) {
        return UIEdgeInsetsMake(13, 13, 13, 13);
    }
    /*
     if (type == ASTextFieldTypeBlahBlah) {
     return UIEdgeInsetsMake(15, 15, 15, 15); //whatever suits your field
     }
     */
    
    return UIEdgeInsetsMake(10, 43, 10, 19); // default
}
- (NSString *)backgroundImageNameForType:(ASTextFieldType) type{
    if (type == ASTextFieldTypeRound) {
        return @"round_textfield";
    }
    /*
     if (type == ASTextFieldTypeBlahBlah) {
        return @""; // return suitable
     }
     */
    
    return @"text_field"; // default
}


-(void)dismissPopup{
    [popUp removeFromSuperview];
}

#pragma mark - Internal Methods

-(void)didHideKeyboard{
    [popUp removeFromSuperview];
}

-(void)tapOnError{
    [self showErrorWithMsg:strMsg];
}

- (BOOL)validateString:(NSString*)stringToSearch withRegex:(NSString*)regexString {
    NSPredicate *regex = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regexString];
    return [regex evaluateWithObject:stringToSearch];
}

-(void)showErrorIconForMsg:(NSString *)msg{
    UIButton *btnError=[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 25, 25)];
    [btnError addTarget:self action:@selector(tapOnError) forControlEvents:UIControlEventTouchUpInside];
    [btnError setBackgroundImage:[UIImage imageNamed:IconImageName] forState:UIControlStateNormal];
    self.rightView=btnError;
    self.rightViewMode=UITextFieldViewModeAlways;
    strMsg=[msg copy];
}

-(void)showErrorWithMsg:(NSString *)msg{
    popUp=[[IQPopUp alloc] initWithFrame:CGRectZero];
    popUp.strMsg=msg;
    popUp.popUpColor=popUpColor;
    popUp.showOnRect=[self convertRect:self.rightView.frame toView:presentInView];
    popUp.fieldFrame=[self.superview convertRect:self.frame toView:presentInView];
    popUp.backgroundColor=[UIColor clearColor];
    [presentInView addSubview:popUp];
    
    popUp.translatesAutoresizingMaskIntoConstraints=NO;
    NSDictionary *dict=NSDictionaryOfVariableBindings(popUp);
    [popUp.superview addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[popUp]-0-|" options:NSLayoutFormatDirectionLeadingToTrailing  metrics:nil views:dict]];
    [popUp.superview addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[popUp]-0-|" options:NSLayoutFormatDirectionLeadingToTrailing  metrics:nil views:dict]];
}

@end
