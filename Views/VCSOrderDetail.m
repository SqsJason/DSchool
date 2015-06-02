//
//  VCSOrderDetail.m
//  ShipWarning
//
//  Created by sunjason on 15/5/10.
//
//

#import "VCSOrderDetail.h"
#import "SVLoadImage.h"
#import "UIImageView+WebCache.h"
#import "SlideImagesCell.h"
#import "LRImageCache.h"

#define LOADIMAGE_PAGESIZE      @"100"
#define DATE_FORMAT_TOTAL       @"dd MMM yyyy HH:mm aa"
#define DATE_FORMAT_FRONT       @"EEE, dd MMM yyyy"
#define DATE_FORMAT_LAST        @"hh:mm aa"
#define DATE_FORMAT_TOTAL_CHINA @"yyyy年M月d日H时m分"

@interface VCSOrderDetail (){
    int currentImageIndex;
    NSMutableDictionary *dicImagesInfo;
    NSMutableArray *arrListImages;
    
    NSString *currentDateStr;
    NSString *nowDateStr;
    NSDate *currentDate;
    NSString *currentDateStrLong;
    
    NSMutableArray *arrImagesForGallery;
    FGalleryViewController *networkGallery;
    LRImageCache *imageCache;
}

@end

@implementation VCSOrderDetail
@synthesize enOrderInfo;

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.cvSliderImages setContentOffset:CGPointMake(0,0) animated:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    if (![Util isNullOrNilObject:enOrderInfo.ship_no] &&
        ![enOrderInfo.ship_no isEqualToString:@""]) {
        self.title = enOrderInfo.ship_no;
    }else{
        self.title = @"船号";
    }
    
    // set button back
    UIButton *btnBack = [[UIButton alloc] initWithFrame:CGRectMake(0,0,40,40)];
    [btnBack setImage:[UIImage imageNamed:@"icon_back_white"]
             forState:UIControlStateNormal];
    [btnBack addTarget:self action:@selector(goBackMethod)
      forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *itemBack              = [[UIBarButtonItem alloc] initWithCustomView:btnBack];
    UIBarButtonItem *negativeSpacer        = [[UIBarButtonItem alloc]
                                              initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                              target:nil
                                              action:nil];
    [negativeSpacer setWidth:-10];
    self.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:
                                              negativeSpacer,
                                              itemBack,
                                              nil];
    
    self.view.backgroundColor           = [UIColor colorWithPatternImage:appDelegate().bgImage];
    _btnBackward.layer.cornerRadius     = 3.0f;
    _btnBackward.layer.masksToBounds    = YES;
    _btnForward.layer.cornerRadius      = 3.0f;
    _btnForward.layer.masksToBounds     = YES;
    _btnRefrash.layer.cornerRadius      = 3.0f;
    _btnRefrash.layer.masksToBounds     = YES;
    _btnSelecteTime.layer.cornerRadius  = 3.0f;
    _btnSelecteTime.layer.masksToBounds = YES;
    
    _vImageTimeBG.layer.cornerRadius    = 3.0;
    _vImageTimeBG.layer.masksToBounds   = YES;
    
    _vImageCountNew.layer.cornerRadius    = 3.0;
    _vImageCountNew.layer.masksToBounds   = YES;
    
    currentImageIndex = 0;
    if (dicImagesInfo == nil)
        dicImagesInfo = [[NSMutableDictionary alloc] init];
    if (arrListImages == nil)
        arrListImages = [[NSMutableArray alloc] init];
    if (currentDate == nil)
        currentDate = [[NSDate alloc] init];
    if (arrImagesForGallery == nil)
        arrImagesForGallery = [[NSMutableArray alloc] init];
    if(currentDateStrLong == nil)
        currentDateStrLong = [[NSString alloc] init];
    
    //初始化缓存控制器
    imageCache = [[LRImageCache alloc] initWithName:enOrderInfo.order_no];
    
    [_cvSliderImages registerNib:[UINib nibWithNibName:@"SlideImagesCell" bundle:nil] forCellWithReuseIdentifier:@"SlideImagesCell"];
    _cvSliderImages.frame = CGRectMake(0, 64, SCREEN_WIDTH_PORTRAIT, SCREEN_WIDTH_PORTRAIT*0.75);
    _vDatePickerBG.frame = CGRectMake(0, SCREEN_HEIGHT_PORTRAIT, SCREEN_WIDTH_PORTRAIT, SCREEN_HEIGHT_PORTRAIT-64);
    _vDatePickerBG.hidden = YES;
    
    [self initDatePicker];//初始化DateTime PickerView
    [self.view addSubview:_vDatePickerBG];
    //第一次加载图片 nowDateStr
    [self loadImageWithTimeStart:@"" TimeEnd:@"" PageSize:LOADIMAGE_PAGESIZE PageIndex:@"1"];
}

-(void)initDatePicker
{
    if (currentDateStr == nil)
        currentDateStr = [[NSString alloc] init];
    if (nowDateStr == nil)
        nowDateStr = [[NSString alloc] init];
    
    NSDate* _date = [NSDate date];
    currentDate = [NSDate date];
    long long ti = (long long)([currentDate timeIntervalSince1970])*1000;
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    unsigned int unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    
    NSDateComponents *currentComps = [[NSDateComponents alloc] init];
    currentComps = [calendar components:unitFlags fromDate:_date];
    
    currentDateStr = [NSString stringWithFormat:@"%04d%02d%02d%02d%02d",(int)[currentComps year],(int)[currentComps month],(int)[currentComps day],(int)[currentComps hour],(int)[currentComps minute]];
    nowDateStr = currentDateStr;
    currentDateStrLong = [NSString stringWithFormat:@"%lld",ti];
    
    _dpPicker.datePickerMode = UIDatePickerModeDateAndTime;
    _dpPicker.timeZone = [NSTimeZone systemTimeZone];//使用系统时区
    _dpPicker.minuteInterval = 11;
    _dpPicker.backgroundColor = [UIColor whiteColor];

    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
    [inputFormatter setTimeZone:[NSTimeZone systemTimeZone]];
    [inputFormatter setDateFormat:DATE_FORMAT_TOTAL];
    
    [_dpPicker addTarget:self action:@selector(dateChanged:) forControlEvents:UIControlEventValueChanged];
}

#pragma mark - 下载图片path -
-(void)loadImageWithTimeStart:(NSString *)timeStart
                      TimeEnd:(NSString *)timeEnd
                     PageSize:(NSString *)pageSize
                    PageIndex:(NSString *)pageIndex
{
    [SVProgressHUD show];
    SVLoadImage *loadImage = [[SVLoadImage alloc] init];
    NSDictionary *parameters  = @{@"order_no":enOrderInfo.order_no,
                                  @"start_time":timeStart,
                                  @"endTime":timeEnd,
                                  @"pageSize":pageSize,
                                  @"page_index":pageIndex
                                  };
    
    [loadImage getImageWithParameters:parameters
                              success:^(NSData *response) {
                                  [SVProgressHUD dismiss];
                                  dicImagesInfo = [Util parseToJson:response];
                                  DLog(@"%@",dicImagesInfo);
                                  if ([[dicImagesInfo objectForKey:@"status"] isEqualToString:@"ok"]) {
                                      [self showImageWithIndex:0];
                                  }else{
                                      OLGhostAlertView *toastName = [[OLGhostAlertView alloc] initWithTitle:nil message:LSSTRING(@"Str_Images_RequestFailed")];
                                      [toastName show];
                                  }
                              } failure:^(NSError *error) {
                                  [SVProgressHUD dismiss];
                                  OLGhostAlertView *toastName = [[OLGhostAlertView alloc] initWithTitle:nil message:LSSTRING(@"Str_Overall_RequestFailed")];
                                  [toastName show];
                              }];
}

#pragma mark - 显示图片 -
-(void)showImageWithIndex:(int)index
{
    NSArray *arrImages = [dicImagesInfo objectForKey:@"data"];
    [arrListImages removeAllObjects];
    [arrListImages addObjectsFromArray:arrImages];
    _lblImageCountNew.text = [NSString stringWithFormat:@"%d/%d",currentImageIndex + 1,(int)[arrListImages count]];
    
    [arrImagesForGallery removeAllObjects];
    for (int i=0;i<arrListImages.count;i++) {
        NSDictionary *dic = [arrListImages objectAtIndex:i];
        [arrImagesForGallery addObject:[dic objectForKey:@"path"]];
    }
    
    [_cvSliderImages reloadData];
    currentImageIndex = 0;
    NSArray *arr = [[[arrListImages objectAtIndex:currentImageIndex] objectForKey:@"fileName"] componentsSeparatedByString:@"."];
    _lblImageCount.text = [arr objectAtIndex:0];
}

/****************/
#pragma mark - UICollectionView Datasource
// 1
- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section {
    
    return [arrListImages count];
}
// 2
- (NSInteger)numberOfSectionsInCollectionView: (UICollectionView *)collectionView {
    return 1;
}
// 3
- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    SlideImagesCell *cell = [cv dequeueReusableCellWithReuseIdentifier:@"SlideImagesCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor clearColor];
    
    NSString *strApi = [[arrListImages objectAtIndex:indexPath.row] objectForKey:@"path"];
    NSURL *imageURL= [NSURL URLWithString:[NSString stringWithFormat:@"%@",strApi]];
    
    UIImage *cacheImageForSlider = [imageCache diskCachedImageForKey:[[arrListImages objectAtIndex:indexPath.row] objectForKey:@"fileName"]];
    
    if (cacheImageForSlider != nil) {
        cell.imgSlideImage.image = cacheImageForSlider;
    }else{
        __weak typeof(SlideImagesCell *) weakCell = cell;
        [weakCell.imgSlideImage sd_setImageWithURL:imageURL placeholderImage:nil options:SDWebImageProgressiveDownload progress:^(NSInteger receivedSize, NSInteger expectedSize) {
            
        } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            if (image) {
                weakCell.imgSlideImage.frame = CGRectMake(0, 0, SCREEN_WIDTH_PORTRAIT, 0.75*SCREEN_WIDTH_PORTRAIT);
                weakCell.imgSlideImage.image = image;
                if (indexPath.row == 0) {
                    [imageCache diskCachedImageForKey:[[arrListImages objectAtIndex:indexPath.row] objectForKey:@"fileName"]];
                }
            }else{
                weakCell.imgSlideImage.frame = CGRectMake((SCREEN_WIDTH_PORTRAIT-30)/2, (0.75*SCREEN_WIDTH_PORTRAIT-30)/2, 30, 30);
                weakCell.imgSlideImage.image = [UIImage imageNamed:@"icon_image_broken"];
            }
        }];
    }
    
    return cell;
}

//定义每个UICollectionView 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(SCREEN_WIDTH_PORTRAIT, SCREEN_WIDTH_PORTRAIT*0.75);
}
//定义每个UICollectionView 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    // TODO: Select Item
    networkGallery = [[FGalleryViewController alloc] initWithPhotoSource:self];
    networkGallery.startingIndex = indexPath.row;
    [self.navigationController pushViewController:networkGallery animated:YES];
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    currentImageIndex = (int)scrollView.contentOffset.x/SCREEN_WIDTH_PORTRAIT;
    if (scrollView == self.cvSliderImages) {
        _lblImageCountNew.text = [NSString stringWithFormat:@"%d/%d",currentImageIndex + 1,(int)[arrListImages count]];
        
        NSArray *arr = [[[arrListImages objectAtIndex:currentImageIndex] objectForKey:@"fileName"] componentsSeparatedByString:@"."];
        _lblImageCount.text = [arr objectAtIndex:0];
    }
}


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if (scrollView == self.cvSliderImages) {
        if (currentImageIndex < 5) {
            [imageCache diskCachedImageForKey:[[arrListImages objectAtIndex:currentImageIndex] objectForKey:@"fileName"]];
        }else{
            [imageCache clearDiskCacheForKey:[[arrListImages objectAtIndex:currentImageIndex - 5] objectForKey:@"fileName"]];
            [imageCache diskCachedImageForKey:[[arrListImages objectAtIndex:currentImageIndex] objectForKey:@"fileName"]];
            if (arrListImages.count > currentImageIndex + 2) {
                [imageCache diskCachedImageForKey:[[arrListImages objectAtIndex:currentImageIndex + 1] objectForKey:@"fileName"]];
                [imageCache diskCachedImageForKey:[[arrListImages objectAtIndex:currentImageIndex + 2] objectForKey:@"fileName"]];
            }else if (arrListImages.count > currentImageIndex + 1){
                [imageCache diskCachedImageForKey:[[arrListImages objectAtIndex:currentImageIndex + 1] objectForKey:@"fileName"]];
            }
        }
    }
}


/****************/

#pragma mark - FGalleryViewControllerDelegate Methods
- (int)numberOfPhotosForPhotoGallery:(FGalleryViewController *)gallery
{
    int num;
    num = (int)[arrImagesForGallery count];
    return num;
}

- (FGalleryPhotoSourceType)photoGallery:(FGalleryViewController *)gallery sourceTypeForPhotoAtIndex:(NSUInteger)index
{
    return FGalleryPhotoSourceTypeNetwork;
}

- (NSString*)photoGallery:(FGalleryViewController *)gallery captionForPhotoAtIndex:(NSUInteger)index
{
    NSString *caption;
    caption = [arrImagesForGallery objectAtIndex:index];
    return caption;
}

- (NSString*)photoGallery:(FGalleryViewController*)gallery nameForPhotoAtIndex:(NSUInteger)index
{
    NSString *name;
    NSArray *arr = [[[arrListImages objectAtIndex:index] objectForKey:@"fileName"] componentsSeparatedByString:@"."];
    name = [arr objectAtIndex:0];
    return name;
}

- (NSString*)photoGallery:(FGalleryViewController *)gallery urlForPhotoSize:(FGalleryPhotoSize)size atIndex:(NSUInteger)index {
    return [arrImagesForGallery objectAtIndex:index];
}
/****************/

#pragma mark - 快退30mins -
- (IBAction)btnBackWardClicked:(id)sender {
    long long ti = [currentDateStrLong longLongValue];
    long long newTi = ti - 30*60*1000;//30分钟转化为毫秒
    currentDate = [NSDate dateWithTimeIntervalSince1970:newTi/1000];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    unsigned int unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    
    NSDateComponents *currentComps = [[NSDateComponents alloc] init];
    currentComps = [calendar components:unitFlags fromDate:currentDate];
    
    currentDateStr = [NSString stringWithFormat:@"%04d%02d%02d%02d%02d",(int)[currentComps year],(int)[currentComps month],(int)[currentComps day],(int)[currentComps hour],(int)[currentComps minute]];
    currentDateStrLong = [NSString stringWithFormat:@"%lld",newTi];
    
//    [self eventDoneDatePicker];
    [_btnSelecteTime setTitle:currentDateStr forState:UIControlStateNormal];
    [self loadImageWithTimeStart:currentDateStr TimeEnd:@"" PageSize:@"30" PageIndex:@"1"];
}

#pragma mark - 快进30mins -
- (IBAction)btnForwardClicked:(id)sender {
    long long ti = [currentDateStrLong longLongValue];
    long long newTi = ti + 30*60*1000;//30分钟转化为毫秒
    currentDate = [NSDate dateWithTimeIntervalSince1970:newTi/1000];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    unsigned int unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    
    NSDateComponents *currentComps = [[NSDateComponents alloc] init];
    currentComps = [calendar components:unitFlags fromDate:currentDate];
    
    currentDateStr = [NSString stringWithFormat:@"%04d%02d%02d%02d%02d",(int)[currentComps year],(int)[currentComps month],(int)[currentComps day],(int)[currentComps hour],(int)[currentComps minute]];
    currentDateStrLong = [NSString stringWithFormat:@"%lld",newTi];
    
//    [self eventDoneDatePicker];
    [_btnSelecteTime setTitle:currentDateStr forState:UIControlStateNormal];
    [self loadImageWithTimeStart:currentDateStr TimeEnd:@"" PageSize:@"30" PageIndex:@"1"];
}

- (IBAction)btnRefrashClicked:(id)sender {
    [self showImageWithIndex:currentImageIndex];
}

- (IBAction)btnSelecteTimeClicked:(id)sender {
    [self showDateInputWithDate:currentDate];
}

- (void) showDateInputWithDate:(NSDate*)date {
    _vDatePickerBG.hidden = NO;
    UIView *animateView = _vDatePickerBG;
    
    _dpPicker.date = date;
    [UIView animateWithDuration:0.3 animations:^{
        [animateView setFrame:CGRectMake(0, 64, SCREEN_WIDTH_PORTRAIT, SCREEN_HEIGHT_PORTRAIT-64)];
    }];
}

- (void)hideVCInput {
    _vDatePickerBG.hidden = YES;
    UIView *animateView = _vDatePickerBG;
    
    [UIView animateWithDuration:0.3 animations:^{
        [animateView setFrame:CGRectMake(0, [[UIScreen mainScreen] bounds].size.height, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-64)];
    }];
}

- (IBAction)btnDPDoneClicked:(id)sender {
    [self hideVCInput];
    [self eventDoneDatePicker];
}

- (IBAction)btnDPCancelClicked:(id)sender
{
    [self hideVCInput];
}

#pragma mark - 选定时间 -
-(void)eventDoneDatePicker
{
    [_btnSelecteTime setTitle:currentDateStr forState:UIControlStateNormal];
    [self loadImageWithTimeStart:currentDateStr TimeEnd:@"" PageSize:LOADIMAGE_PAGESIZE PageIndex:@"1"];
}

#pragma mark - 时间改变 -
-(void)dateChanged:(id)sender{
    UIDatePicker* control = (UIDatePicker*)sender;
    NSDate* _date = control.date;
    
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
    [inputFormatter setTimeZone:[NSTimeZone systemTimeZone]];
    [inputFormatter setDateFormat:DATE_FORMAT_TOTAL_CHINA];
    
    NSString *changingDT = [inputFormatter stringFromDate:_date];
    _lblDateTime.text = changingDT;
    currentDate = control.date;
    
    long long ti = (long long)([_date timeIntervalSince1970])*1000;
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    unsigned int unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    
    NSDateComponents *currentComps = [[NSDateComponents alloc] init];
    currentComps = [calendar components:unitFlags fromDate:_date];
    
    currentDateStr = [NSString stringWithFormat:@"%04d%02d%02d%02d%02d",(int)[currentComps year],(int)[currentComps month],(int)[currentComps day],(int)[currentComps hour],(int)[currentComps minute]];
    currentDateStrLong = [NSString stringWithFormat:@"%lld",ti];
}

-(void)goBackMethod
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
