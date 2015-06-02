//
//  UITextField+ASTextField.h
//  ASTextViewDemo
//
//  Created by Adil Soomro on 4/14/14.
//  Copyright (c) 2014 Adil Soomro. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 Image name for showing error on textfield.
 */
#define IconImageName @"error.png"

/**
 Background color of message popup.
 */
#define ColorPopUpBg [UIColor colorWithRed:0.702 green:0.000 blue:0.000 alpha:1.000]

/**
 Font color of the message.
 */
#define ColorFont [UIColor whiteColor]

/**
 Font size of the message.
 */
#define FontSize 15

/**
 Font style name of the message.
 */
#define FontName @"Helvetica-Bold"

/**
 Padding in pixels for the popup.
 */
#define PaddingInErrorPopUp 5

/**
 Default message for validating length, you can also assign message separately using method 'updateLengthValidationMsg:' for textfields.
 */
#define MsgValidateLength @"This field cannot be blank"

typedef enum {
    ASTextFieldTypeDefault,
    ASTextFieldTypeRound
}ASTextFieldType;

@interface ASTextField : UITextField

@property (nonatomic,assign) BOOL isMandatory;   /**< Default is YES*/

@property (nonatomic,retain) IBOutlet UIView *presentInView;    /**< Assign view on which you want to show popup and it would be good if you provide controller's view*/

@property (nonatomic,retain) UIColor *popUpColor;   /**< Assign popup background color, you can also assign default popup color from macro "ColorPopUpBg" at the top*/

@property (nonatomic,assign) BOOL validateOnCharacterChanged; /**< Default is YES, Use it whether you want to validate text on character change or not.*/

@property (nonatomic,assign) BOOL validateOnResign; /**< Default is YES, Use it whether you want to validate text on resign or not.*/



/**
 Use to dismiss error popup.
 */
-(void)dismissPopup;

@end


@interface UITextField ()
- (void)setupTextFieldWithIconName:(NSString *)name;
- (void)setupTextFieldWithType:(ASTextFieldType)type withIconName:(NSString *)name;
@end
