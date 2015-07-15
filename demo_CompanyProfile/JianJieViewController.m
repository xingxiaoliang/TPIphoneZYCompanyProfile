//
//  JianJieViewController.m
//  demo_CompanyProfile
//
//  Created by 邢晓亮 on 15/7/13.
//  Copyright (c) 2015年 wdl. All rights reserved.
//

#import "JianJieViewController.h"

@interface JianJieViewController ()

@end

@implementation JianJieViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.frame=CGRectMake(0, 108, SCREEN_WIDTH, SCREEN_HEIGHT);
    self.view.backgroundColor=[UIColor clearColor];
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    //view.backgroundColor=[UIColor greenColor];
    [self.view addSubview:view];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
