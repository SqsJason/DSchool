//
//  StandarViewController.m
//  ShipWarning
//
//  Created by sunjason on 15/5/7.
//
//

#import "StandarViewController.h"

@interface StandarViewController ()

@end

@implementation StandarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.navigationBar.barTintColor = k_LoginColor_Header;
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,nil];
    [self.navigationController.navigationBar setTitleTextAttributes:attributes];
}

@end
