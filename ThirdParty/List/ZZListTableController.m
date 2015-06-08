//
//  ZZListTableController.m
//  ZZList
//
//  Created by 黄 伟华 on 5/9/14.
//  Copyright (c) 2014 黄伟华. All rights reserved.
//

#import "ZZListTableController.h"
#import "YTListCell.h"
@interface ZZListTableController ()

@end

@implementation ZZListTableController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    

    self.dataArray = [NSMutableArray array];
    
    for (int i = 0; i<10; i++)
    {
        if (i%2 == 0)
        {
            ZZListEntity * entity = [[ZZListEntity alloc] init];
            entity.head = @"test_icon_image";
            entity.inCount = @"10";
            entity.outCount = @"20";
            entity.name = @"黄伟华测试";
            entity.content = @"I’m telling you that if you can read this article, look through this list and not claim it as your own, then you should be a little worried.\
            \
            Actually, you should be very worried. You should drop everything and immediately  question your existence on earth. You should find a mirror, look yourself in the eyes, raise your hand and slap yourself in the face.\
            Got it? Now repeat that until you come to your senses and continue reading whenever you’re ready.";
            entity.images = @[@"test_icon_image",@"test_icon_image",@"test_icon_image",@"test_icon_image",@"test_icon_image",@"test_icon_image",@"test_icon_image",@"test_icon_image",@"test_icon_image"];
            entity.date = @"1分钟前";
            entity.state = @"1";
            entity.wantCount = @"007";
            [self.dataArray addObject:entity];
        }else
        {
            ZZListEntity * entity = [[ZZListEntity alloc] init];
            entity.head = @"test_icon_head2";
            entity.inCount = @"321";
            entity.outCount = @"123";
            entity.name = @"just believe me ";
            entity.content = @"one line";
            entity.images = @[@"test_icon_image"];
            entity.date = @"100分钟前";
            entity.state = @"2";
            entity.wantCount = @"700";
            [self.dataArray addObject:entity];
        }
        
        
    }
    
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    ZZListEntity * entity = self.dataArray[indexPath.row];
    
    CGFloat height = [ZZListEntity getHightForListEntity:entity font:[YTListCell fontOfContent] width:[YTListCell contentWidth]];
    NSLog(@"cell 高度 :%f",height);
    return height;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return self.dataArray.count;
}


- (YTListCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * identify = @"Cell";
    
    YTListCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    
    // Configure the cell...
    
    if (!cell) {
        NSArray *nib = [[NSBundle mainBundle]loadNibNamed:@"YTListCell" owner:nil options:nil];
        cell = [nib lastObject];
    }
    
    [cell setListEntity:self.dataArray[indexPath.row]];
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"点击" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
    [alert show];
}


@end
