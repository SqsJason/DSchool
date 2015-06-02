//
//  VCSAlarmDetail.m
//  ShipWarning
//
//  Created by sunjason on 15/5/16.
//
//

#import "VCSAlarmDetail.h"

@interface VCSAlarmDetail ()

@end

@implementation VCSAlarmDetail

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
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
    
}

-(void)goBackMethod
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
