//
//  JianJieViewController.m
//  demo_CompanyProfile
//
//  Created by 邢晓亮 on 15/7/13.
//  Copyright (c) 2015年 wdl. All rights reserved.
//

#import "JianJieViewController.h"

@interface JianJieViewController ()
{
    UITextView *infoLabel;
}

@end

@implementation JianJieViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.frame=CGRectMake(0, 108, SCREEN_WIDTH, SCREEN_HEIGHT);

    // Do any additional setup after loading the view.
}
-(void)viewWillLayoutSubviews{
    
    infoLabel = [[UITextView alloc] initWithFrame:CGRectMake(20 ,240,SCREEN_WIDTH-40,SCREEN_HEIGHT-350)];
    infoLabel.text = @"中国太平保险集团有限责任公司，简称“中国太平”，是管理总部设在香港的中管金融保险集团，原名中国太平保险集团公司。2013年，中国太平同步推进集团改制和整体上市，整体改制为有限责任公司，7月正式启用新名。\n\n中国太平市当今中国保险业历史最为悠久的民族品牌，1929年创立于上海。1956年太平保险与其他民族保险创业一起成为原中国人民保险公司的成员公司，根据国家统一部署，专营境外业务。1999年受命全名控股原中国人民保险公司所有境外经营性机构，并逐步发展成为中国保险业唯一的跨境综合经营的保险集团。2001年重新进军国内市场。2009年，完成下属各公司品牌整合，更名为中国太平保险集团公司。";
    infoLabel.userInteractionEnabled=NO;
    infoLabel.editable=NO;
    infoLabel.font = [UIFont systemFontOfSize:14];
    //infoLabel.numberOfLines = 0;
    infoLabel.backgroundColor=[UIColor clearColor];
    infoLabel.textColor=[UIColor blackColor];
    [self.view addSubview:infoLabel];
    //[self.view addSubview:bkimageView];
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
