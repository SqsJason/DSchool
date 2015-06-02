//
//  VCSOrderDetail.h
//  ShipWarning
//
//  Created by sunjason on 15/5/10.
//
//

#import "StandarViewController.h"
#import "FGalleryViewController.h"
#import "ENOrder.h"

@interface VCSOrderDetail : StandarViewController<FGalleryViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imgMainImage;
@property (weak, nonatomic) IBOutlet UIButton *btnBackward;
- (IBAction)btnBackWardClicked:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *btnForward;
- (IBAction)btnForwardClicked:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *btnRefrash;
- (IBAction)btnRefrashClicked:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *btnSelecteTime;
- (IBAction)btnSelecteTimeClicked:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *lblImageName;

@property (strong, nonatomic) IBOutlet UIView *vDatePickerBG;
@property (weak, nonatomic) IBOutlet UIView *vDatePickerHolder;

@property (weak, nonatomic) IBOutlet UIView *btnPickerCancel;
- (IBAction)btnDPCancelClicked:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *btnPickerDone;
- (IBAction)btnDPDoneClicked:(id)sender;

@property (weak, nonatomic) IBOutlet UIDatePicker *dpPicker;
@property (weak, nonatomic) IBOutlet UIView *vPickerTitle;

@property (weak, nonatomic) IBOutlet UILabel *lblImageCount;
@property (weak, nonatomic) IBOutlet UICollectionView *cvSliderImages;
@property (weak, nonatomic) IBOutlet UILabel *lblDateTime;
@property (weak, nonatomic) IBOutlet UIView *vImageTimeBG;


//@property (nonatomic, strong) NSDictionary *dicOrderInfo;
@property (nonatomic, strong) ENOrder *enOrderInfo;

@property (weak, nonatomic) IBOutlet UIView *vImageCountNew;
@property (weak, nonatomic) IBOutlet UILabel *lblImageCountNew;


@end
