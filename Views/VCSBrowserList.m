//
//  VCSBrowserList.m
//  ShipWarning
//
//  Created by sunjason on 15/5/8.
//
//

#import "VCSBrowserList.h"
#import "BrowserListCell.h"
#import "SVGetOrderList.h"
#import "SHXMLParser.h"
#import "VCSOrderDetail.h"
#import "ENOrder.h"

@interface VCSBrowserList ()
{
    NSString *orderStatus;
}

@property (nonatomic, strong) NSMutableArray *arrTableCellElements;

@end

@implementation VCSBrowserList
@synthesize listStyle;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    if (_arrTableCellElements == nil)
        _arrTableCellElements = [[NSMutableArray alloc] init];
    
    if (orderStatus == nil)
        orderStatus = [[NSString alloc] init];
    
    if (listStyle == BrowserListStyleOntime) {
        self.title = @"实时浏览";
        orderStatus = @"1";
        _lbNoData.text = @"没有实时数据..";
    }else if (listStyle == BrowserListStyleHistory){
        self.title = @"历史回放";
        orderStatus = @"2";
        _lbNoData.text = @"没有历史数据..";
    }else{
        self.title = @"报警信息";
        orderStatus = @"0";
        _lbNoData.text = @"没有报警信息..";
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
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:appDelegate().bgImage];
    
    if (listStyle == BrowserListStyleOntime ||
        listStyle == BrowserListStyleHistory) {
        [self getDataFromServer];
    }else{
        //待续..
        [self getDataFromServer];
    }
}

#pragma  mark - 从服务器端获取数据 -
-(void)getDataFromServer
{
    [SVProgressHUD show];
    SVGetOrderList *svGetData = [[SVGetOrderList alloc] init];
    NSDictionary *parameters  = @{@"customer":[appDelegate().dicProfiles objectForKey:@"customer"],
                                  @"orderStatus":orderStatus
                                 };
    
    [svGetData getOrderListWithParameters:parameters success:^(NSData *response) {
        [SVProgressHUD dismiss];
        
        NSDictionary *contentDic = [Util parseToJson:response];

        if ([[contentDic objectForKey:@"status"] isEqualToString:@"ok"]) {
            for (NSDictionary *dic in [contentDic objectForKey:@"data"]) {
                ENOrder *order = [[ENOrder alloc] initWithAttributes:dic];
                [_arrTableCellElements addObject:order];
                [self didReloadTableView];
            }
        }
    } failure:^(NSError *error) {
        [SVProgressHUD dismiss];
        
        OLGhostAlertView *toastName = [[OLGhostAlertView alloc] initWithTitle:nil message:LSSTRING(@"Str_Overall_RequestFailed")];
        [toastName show];
    }];
}

-(void)goBackMethod
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)didReloadTableView
{
    if (_arrTableCellElements.count != 0) {
        _tblBrowserList.hidden = NO;
        _lbNoData.hidden = YES;
    }else{
        _tblBrowserList.hidden = YES;
        _lbNoData.hidden = NO;
    }
    
    [_tblBrowserList reloadData];
}

#pragma mark - UITableviewDeleagate datasource stuff
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headView         = [[UIView alloc] initWithFrame:CGRectMake(0,
                                                                        0,
                                                                        SCREEN_HEIGHT_PORTRAIT,
                                                                        10)];
    
    headView.backgroundColor = [UIColor clearColor];
    return headView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *headView         = [[UIView alloc] initWithFrame:CGRectMake(0,
                                                                        0,
                                                                        SCREEN_HEIGHT_PORTRAIT,
                                                                        0)];
    headView.backgroundColor = [UIColor blackColor];
    return headView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //return cell's height for particular row
    return 110;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //return number of cells for the table
    return self.arrTableCellElements.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifierStr = @"BrowserListCell_Ontime";
    BrowserListCell *cell;
    //return cell for particular row
    cell = [tableView dequeueReusableCellWithIdentifier:identifierStr];
    
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"BrowserListCell" owner:self options:nil] lastObject];
    }
    
    [cell setBackgroundColor:[UIColor clearColor]];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    cell.selectionStyle      = UITableViewCellSelectionStyleNone;
    
    ENOrder *order = [_arrTableCellElements objectAtIndex:indexPath.row];
    if (![Util isNullOrNilObject:order.ship_no] &&
        ![order.ship_no isEqualToString:@""]) {
        cell.lblTitleName.text = order.ship_no;
    }else{
        cell.lblTitleName.text = @"船号";
    }
    
    if (![Util isNullOrNilObject:order.ship_contact_name] &&
        ![order.ship_contact_name isEqualToString:@""]) {
        cell.lblName.text = order.ship_contact_name;
    }
    
    if (![Util isNullOrNilObject:order.contact_mobilephone] &&
        ![order.contact_mobilephone isEqualToString:@""]) {
        cell.lblDescription.text = order.contact_mobilephone;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ENOrder *order = [_arrTableCellElements objectAtIndex:indexPath.row];
    VCSOrderDetail *orderDetail = [[VCSOrderDetail alloc] initWithNibName:@"VCSOrderDetail" bundle:nil];
    orderDetail.enOrderInfo = order;
    [self.navigationController pushViewController:orderDetail animated:YES];
}

@end
