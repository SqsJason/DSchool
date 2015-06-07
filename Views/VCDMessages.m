//
//  VCDMessages.m
//  DSchool
//
//  Created by sunjason on 15/6/5.
//  Copyright (c) 2015年 sunjason. All rights reserved.
//

#import "VCDMessages.h"
#import "CellMessage.h"

@interface VCDMessages ()
{
    NSMutableArray *arrMessagesList;
}

@end

@implementation VCDMessages

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"消息";
    
    arrMessagesList = [[NSMutableArray alloc] initWithObjects:@"One",@"Two",@"Three",@"One",@"Two",@"Three",@"One",@"Two",@"Three", nil];
}

#pragma mark - tableview deleagate datasource stuff
//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    return [UIView new];
//}
//
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    if (SCREEN_HEIGHT_PORTRAIT <= 568) {
//        return 180;
//    }else if(SCREEN_HEIGHT_PORTRAIT <= 667){
//        return 220;
//    }else if(SCREEN_HEIGHT_PORTRAIT <= 736){
//        return 260;
//    }else{
//        return 200;
//    }
//}
//
//- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
//{
//    return [UIView new];
//}
//
//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
//{
//    if (SCREEN_HEIGHT_PORTRAIT <= 568) {
//        return 60;
//    }else if(SCREEN_HEIGHT_PORTRAIT <= 667){
//        return 140;
//    }else if(SCREEN_HEIGHT_PORTRAIT <= 736){
//        return 160;
//    }else{
//        return 20;
//    }
//}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //return cell's height for particular row
    return 75;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //return number of cells for the table
    return arrMessagesList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CellMessage *cell;
    static NSString *cellBundleIdentifer = @"cellMessage_messages";
    cell = [tableView dequeueReusableCellWithIdentifier:cellBundleIdentifer];
    //return cell for particular row
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"CellMessage" owner:self options:nil] lastObject];
    }
    
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    cell.selectionStyle = UITableViewCellSelectionStyleDefault;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

@end
