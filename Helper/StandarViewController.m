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
@synthesize isNotBackModel;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.navigationBar.barTintColor = k_LoginColor_Header;
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,nil];
    [self.navigationController.navigationBar setTitleTextAttributes:attributes];
    
    self.title = @"XXXX";
    
    if (self.navigationController.viewControllers.count > 1) {
        if (isNotBackModel) {
            // set button back
            UIButton *btnBack = [[UIButton alloc] initWithFrame:CGRectMake(0,
                                                                           0,
                                                                           40,
                                                                           40)];
            btnBack.enabled = NO;
            
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
        }else{
            // set button back
            UIButton *btnBack = [[UIButton alloc] initWithFrame:CGRectMake(0,
                                                                           0,
                                                                           40,
                                                                           40)];
            [btnBack setImage:[UIImage imageNamed:@"icon_common_back"]
                     forState:UIControlStateNormal];
            [btnBack setImage:[UIImage imageNamed:@"icon_header_back_arrow_small_red_v2"]
                     forState:UIControlStateHighlighted];
            [btnBack addTarget:self action:@selector(popBackMethodAtStandar)
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
        }
    }
}

- (void)setNavTitle:(NSString *)titleStr
{
    self.title = titleStr;
}

- (void)popBackMethodAtStandar
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
