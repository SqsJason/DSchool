//
//  VCDLaunghMood.m
//  DSchool
//
//  Created by sunjason on 15/6/11.
//  Copyright (c) 2015年 sunjason. All rights reserved.
//

#import "VCDLaunghMood.h"
#import <QBImagePickerController/QBImagePickerController.h>

@interface VCDLaunghMood () <QBImagePickerControllerDelegate>
{
    BOOL isLowQuality;
}

@property(nonatomic, strong) NSArray *arrTblDataSource;
@property(nonatomic, strong) NSMutableArray *arrSelectedPhotosL;
@property(nonatomic, strong) NSMutableArray *arrSelectedPhotosH;

@end

@implementation VCDLaunghMood

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [_cvPubMood registerNib:[UINib nibWithNibName:@"CellColectionCustom" bundle:nil] forCellWithReuseIdentifier:@"CELL"];
    
    [self initNavBar];
    [self initTBLDataSource];
    [self initCVDataSource];
}

#pragma mark - 初始化导航栏内容 -
- (void)initNavBar
{
    //=>    标题
    self.title = @"发表";
    
    //=>    发布按钮
    UIButton *btnPublish = [[UIButton alloc]initWithFrame:CGRectMake(0,
                                                                     0,
                                                                     80,
                                                                     40)];
    [btnPublish setTitle:@"确认" forState:UIControlStateNormal];
    [btnPublish addTarget:self
                     action:@selector(publishBtn_action)
           forControlEvents:UIControlEventTouchUpInside];
    btnPublish.titleLabel.font = [UIFont boldSystemFontOfSize:14];
    [btnPublish setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btnPublish setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    
    UIBarButtonItem *itemRight   = [[UIBarButtonItem alloc] initWithCustomView:btnPublish];
    UIBarButtonItem *pozSpacer   = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                                                                target:nil
                                                                                action:nil];
    [pozSpacer setWidth:-30];
    
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:pozSpacer,
                                               itemRight,
                                               nil];
}

#pragma mark - 点击发布朋友圈 -
- (void)publishBtn_action{
    
}

- (void)initTBLDataSource
{
    _arrTblDataSource = @[_CellTime, _CellContent, _CellReward, _CellPeopleNumber];
}

- (void)initCVDataSource
{
    if (_arrSelectedPhotosL == nil) {
        _arrSelectedPhotosL = [[NSMutableArray alloc] init];
    }
    
    if (_arrSelectedPhotosH == nil) {
        _arrSelectedPhotosH = [[NSMutableArray alloc] init];
    }
}

#pragma mark - tableview deleagate datasource stuff
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *_vHeader = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH_PORTRAIT, 10)];
    return _vHeader;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *_vFooter = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH_PORTRAIT, 0)];
    return _vFooter;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //return cell's height for particular row
    return ((UITableViewCell*)[_arrTblDataSource objectAtIndex:indexPath.row]).frame.size.height;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //return number of cells for the table
    return _arrTblDataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    //return cell for particular row
    cell = [_arrTblDataSource objectAtIndex:indexPath.row];
    
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}


#pragma mark - DELEGATES.
#pragma mark - CollectionDelegate.
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _arrSelectedPhotosL.count + 1;
}


- (CellColectionCustom *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CellColectionCustom *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CELL" forIndexPath:indexPath];
    
    cell.delegate = self;
    
    if (indexPath.row == _arrSelectedPhotosL.count) {
        cell.backgroundColor        = [UIColor colorWithRed:224/255.0 green:224/255.0 blue:224/255.0 alpha:1.0];
        cell.btnCamera.hidden       = NO;
        cell.imgAvatar.hidden       = YES;
    }else {
        cell.btnCamera.hidden = YES;
        cell.imgAvatar.hidden = NO;
        cell.imgAvatar.contentMode = UIViewContentModeScaleAspectFill;
        cell.imgAvatar.image = [_arrSelectedPhotosL objectAtIndex:indexPath.row];
    }
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    float cvCellSize = (SCREEN_WIDTH_PORTRAIT - 40)/3;
    return CGSizeMake(cvCellSize, cvCellSize);
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
}

-(void)btnAddClicked:(CellColectionCustom*)colCustom
{
    QBImagePickerController *imagePickerController = [QBImagePickerController new];
    imagePickerController.delegate = self;
    imagePickerController.mediaType = QBImagePickerMediaTypeAny;
    imagePickerController.allowsMultipleSelection = YES;
    imagePickerController.showsNumberOfSelectedAssets = YES;
    imagePickerController.maximumNumberOfSelection = 12;
    
    isLowQuality = YES;
    
    [self presentViewController:imagePickerController animated:YES completion:NULL];
}

#pragma mark - QBImagePickerControllerDelegate

- (void)qb_imagePickerController:(QBImagePickerController *)imagePickerController didFinishPickingAssets:(NSArray *)assets
{
    for (PHAsset *imageAsset in assets) {
        PHImageRequestOptions *imgOption = [[PHImageRequestOptions alloc] init];
        [imgOption setResizeMode:PHImageRequestOptionsResizeModeFast];
        [imgOption setDeliveryMode:PHImageRequestOptionsDeliveryModeOpportunistic];
        [imgOption setVersion:PHImageRequestOptionsVersionCurrent];
        
        [[PHImageManager defaultManager] requestImageForAsset:imageAsset targetSize:CGSizeMake((float)320.0, (float)320.0) contentMode:PHImageContentModeAspectFill options:imgOption resultHandler:^(UIImage *result, NSDictionary *info) {
            DLog(@"%@",info);
            if (isLowQuality) {
                [_arrSelectedPhotosL addObject:result];
            }else{
                [_arrSelectedPhotosH addObject:result];
            }
        }];
    }
    isLowQuality = NO;
    [self dismissViewControllerAnimated:YES completion:NULL];

    [_cvPubMood reloadData];
}

- (void)qb_imagePickerControllerDidCancel:(QBImagePickerController *)imagePickerController
{
    NSLog(@"Canceled.");
    
    [self dismissViewControllerAnimated:YES completion:NULL];
}

@end
