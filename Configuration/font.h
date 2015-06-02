//
//  font.h
//  Lola
//
//  Created by Harry Nguyen on 1/13/14.
//  Copyright (c) 2014 Harry Nguyen. All rights reserved.
//
//[1/15/14, 11:03:00 AM] Say Jon: for small font sizes, use 10px
//for normal font sizes, use 14px
//for logo, 24px
//for headers (slightly larger font size e.g.: modal header), 24px
//for countdown, 72px
//[1/15/14, 11:03:39 AM] Say Jon: only 4 kinds of fonts. normal GothamBook, thin GothamThin(only used for countdown), bold (GothamMedium), and italic (MillerItalic)


////// define custom font name

/// set font Miller

#define fMillerText                 @"Miller-Text"
#define fMillerTextBold             @"Miller-TextBold"
#define fMillerTextBoldItalic       @"Miller-TextBoldItalic"
#define fMillerTextItalic           @"Miller-TextItalic"

// set font Gotham

#define fGothamThin                 @"Gotham-Thin"
#define fGothamLight                @"Gotham-Light"
#define fGothamBoldItalic           @"Gotham-BoldItalic"
#define fGothamBold                 @"Gotham-Bold"
#define fGothamMedium               @"Gotham-Medium"
#define fGothamBook                 @"Gotham-Book"

//> Font Brandon
#define fBrandonMedium              @"BrandonGrotesque-Medium"
#define fBrandonRegular             @"BrandonGrotesque-Regular"
#define fBrandonThin                @"BrandonGrotesque-Light"

#define fTopBar_Title_Size              17.0
#define fChatMessage_Text_Size          15.0
#define fMessageTimestamp_Text_Size     12.0
#define fSelectQuestions_Content_Size   14.0


////////////////////////////////////////////////////////////
// define font each view

#define fSizeMicro                   9
#define fSizeMini                   10
#define fSizeSmall                  12
#define fSizeNormal                 14

#define fSizeDateProposal           15

#define fSizeBig                    18
#define fSizeLogo                   24
#define fSizeHero                   42
#define fSizeMid                    24
#define fSizeHuge                   72
#define fSizeHelp                   16
#define selQuestionsFont            14


///// VCLFirstView

#define fFVBtnSignInFB                  [UIFont systemFontOfSize:fSizeNormal]


////// VCLSignUp.
#define fSUVBtnSave                     [UIFont systemFontOfSize:fSizeNormal]
#define fSUVCustomCell                  [UIFont systemFontOfSize:fSizeNormal]
#define fSUVCellLookingFor              [UIFont systemFontOfSize:fSizeNormal]

////// VCLDateIdea.
#define fSUVBtnSubmit                   [UIFont systemFontOfSize:fSizeNormal]

////// VCLProfilePhoto.
#define fSUVBtnDone                     [UIFont systemFontOfSize:fSizeHelp]


///// VCLMenuLeft

#define fMLTitle                        [UIFont systemFontOfSize:fSizeNormal]
#define fMLPoint                        [UIFont systemFontOfSize:fSizeNormal]
#define fMLEarnFreePoint                [UIFont systemFontOfSize:fSizeNormal]
#define fGothamMediumSizeNormal         [UIFont systemFontOfSize:fSizeNormal]


///// VCLHome

#define fHomeNavTitle                   [UIFont systemFontOfSize:fSizeNormal]
#define fHomeClock                      [UIFont fontWithName:fGothamThin size:fSizeHero]
//#define fHomeClock                      [UIFont systemFontOfSize:fSizeHuge]

#define fThinMicro                      [UIFont systemFontOfSize:fSizeMicro]
#define fThinMini                       [UIFont systemFontOfSize:fSizeMini]
#define fThinSmall                      [UIFont systemFontOfSize:fSizeSmall]
#define fThinNormal                     [UIFont systemFontOfSize:fSizeNormal]

#define fHomeStatusProfile              [UIFont systemFontOfSize:fSizeNormal]
#define fHomeGuide                      [UIFont systemFontOfSize:fSizeNormal]
#define fHomeTakeHour                   [UIFont systemFontOfSize:fSizeNormal]

///// VCLTodayMatch

#define fTodayProfileJob                [UIFont systemFontOfSize:fSizeNormal]
#define fTodayAddress                   [UIFont systemFontOfSize:fSizeSmall]
#define fTodayHurry                     [UIFont systemFontOfSize:fSizeMini]
#define fTodayDateIdea                  [UIFont systemFontOfSize:fSizeNormal]
#define fTodayBtnPass                   [UIFont systemFontOfSize:fSizeNormal]
#define fTodayBtnLike                   [UIFont systemFontOfSize:fSizeNormal]

///// VCLPassReasons.
#define fPassReasonsHelp                [UIFont systemFontOfSize:fSizeHelp]
#define fPassReasonsSelect              [UIFont systemFontOfSize:fSizeNormal]
#define fGothamBoldSizeSmall            [UIFont systemFontOfSize:fSizeSmall]
#define fGothamBoldSizeNormal           [UIFont systemFontOfSize:fSizeNormal]
#define fPassReasonsTitleCell           [UIFont systemFontOfSize:fSizeNormal]

///// VCLPoints.
#define fPointsCommingSoon              [UIFont systemFontOfSize:fSizeNormal]
#define fPointsCellTitle                [UIFont systemFontOfSize:fSizeNormal]
#define fPointsCellDescription          [UIFont systemFontOfSize:fSizeMicro]
#define fPointsCell                     [UIFont systemFontOfSize:fSizeNormal]
#define fGothomLightSizeMicro           [UIFont systemFontOfSize:fSizeMicro]
#define fSubHeading                     [UIFont systemFontOfSize:fSizeNormal]



/////// VCLFirstView
//
//#define fFVBtnSignInFB                    [UIFont fontWithName:fGothamBook size:fSizeNormal]
//
//
//////// VCLSignUp.
//#define fSUVBtnSave                     [UIFont fontWithName:fGothamBook size:fSizeNormal]
//#define fSUVCustomCell                  [UIFont fontWithName:fGothamBook size:fSizeNormal]
//#define fSUVCellLookingFor              [UIFont fontWithName:fMillerTextItalic size:fSizeNormal]
//
//////// VCLDateIdea.
//#define fSUVBtnSubmit                     [UIFont fontWithName:fGothamBook size:fSizeNormal]
//
//////// VCLProfilePhoto.
//#define fSUVBtnDone                     [UIFont fontWithName:fGothamBold size:fSizeNormal]
//
//
//
/////// VCLMenuLeft
//
//#define fMLTitle                        [UIFont fontWithName:fGothamBook size:fSizeNormal]
//#define fMLPoint                        [UIFont fontWithName:fGothamBook size:fSizeNormal]
//#define fMLEarnFreePoint                [UIFont fontWithName:fGothamBold size:fSizeNormal]
//#define fGothamMediumSizeNormal               [UIFont fontWithName:fGothamMedium size:fSizeNormal]
//
//
/////// VCLHome
//
//#define fHomeNavTitle                   [UIFont fontWithName:fGothamMedium size:fSizeNormal]
//#define fHomeClock                      [UIFont fontWithName:fGothamThin size:fSizeHuge]
//#define fThinMicro                           [UIFont fontWithName:fGothamLight size:fSizeMicro]
//#define fThinMini                           [UIFont fontWithName:fGothamLight size:fSizeMini]
//#define fThinSmall                           [UIFont fontWithName:fGothamLight size:fSizeSmall]
//#define fThinNormal                           [UIFont fontWithName:fGothamLight size:fSizeNormal]
//
//#define fHomeStatusProfile              [UIFont fontWithName:fGothamMedium size:fSizeNormal]
//#define fHomeGuide                      [UIFont fontWithName:fGothamBook size:fSizeNormal]
//#define fHomeTakeHour                   [UIFont fontWithName:fGothamBold size:fSizeNormal]
//
/////// VCLTodayMatch
//
//#define fTodayProfileJob                [UIFont fontWithName:fGothamBold size:fSizeSmall]
//#define fTodayAddress                   [UIFont fontWithName:fGothamBook size:fSizeMini]
//#define fTodayHurry                     [UIFont fontWithName:fGothamBook size:fSizeMini]
//#define fTodayDateIdea                  [UIFont fontWithName:fGothamBook size:fSizeNormal]
//#define fTodayBtnPass                   [UIFont fontWithName:fGothamBold size:fSizeNormal]
//#define fTodayBtnLike                   [UIFont fontWithName:fGothamBold size:fSizeNormal]
//
/////// VCLPassReasons.
//#define fPassReasonsHelp                [UIFont fontWithName:fGothamBoldItalic size:fSizeHelp]
//#define fPassReasonsSelect              [UIFont fontWithName:fGothamBold size:fSizeNormal]
//#define fGothamBoldSizeSmall             [UIFont fontWithName:fGothamBold size:fSizeSmall]
//#define fGothamBoldSizeNormal             [UIFont fontWithName:fGothamBold size:fSizeNormal]
//#define fPassReasonsTitleCell           [UIFont fontWithName:fGothamBold size:fSizeNormal]
//
//
//
/////// VCLPoints.
//#define fPointsCommingSoon              [UIFont fontWithName:fGothamBoldItalic size:fSizeNormal]
//#define fPointsCellTitle                [UIFont fontWithName:fGothamMedium size:fSizeNormal]
//#define fPointsCellDescription          [UIFont fontWithName:fGothamBook size:fSizeMicro]
//#define fPointsCell                     [UIFont fontWithName:fGothamLight size:fSizeNormal]
//#define fGothomLightSizeMicro           [UIFont fontWithName:fGothamBook size:fSizeMicro]
//#define fSubHeading                     [UIFont fontWithName:fMillerTextItalic size:fSizeNormal]
