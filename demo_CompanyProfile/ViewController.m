//
//  ViewController.m
//  demo_CompanyProfile
//
//  Created by 邢晓亮 on 15/7/13.
//  Copyright (c) 2015年 wdl. All rights reserved.
//

#import "ViewController.h"
#import "JianJieViewController.h"
#import "DshijViewController.h"
#import "ZhiFanymViewController.h"
@interface ViewController ()<UIScrollViewDelegate,UIScrollViewAccessibilityDelegate>
{
    UIScrollView *scrollView;
    NSMutableArray *btnArray;
    NSArray *titleArray;
    UILabel *label;
    UIView *lineView;
    NSMutableArray *lineArray;
    JianJieViewController *jiana;
    DshijViewController *jianb;
    ZhiFanymViewController *zhiFan;
}


@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    lineArray=[NSMutableArray array];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
    NSDate *adate = [dateFormatter dateFromString:@"1991-04-14"];
    NSLog(@"adate==%@", adate);
    
    label=[[UILabel alloc]initWithFrame:CGRectMake(100, 100, 100, 50)];
    
    
    btnArray=[NSMutableArray array];
    titleArray=@[@"公司简介",@"大事记",@"数说太平",@"股东介绍",@"枝繁叶茂",@"太平投资",@"辉煌太平"];
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    
    UINavigationBar *navigationBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, screenRect.size.width, 64)];
    [navigationBar setTranslucent:NO];
    [navigationBar setBarTintColor:[UIColor colorWithRed:35.0/255.0 green:150.0/255.0 blue:218.0/255.0 alpha:1.0]];
    //navigationBar.backgroundColor=[UIColor colorWithRed:35.0/255.0 green:150.0/255.0 blue:218.0/255.0 alpha:0];
    //nav.tintColor = COLOR(200, 100, 162);;
    //创建UINavigationItem
    UINavigationItem * navigationBarTitle = [[UINavigationItem alloc] initWithTitle:@"中国太平"];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [navigationBar pushNavigationItem: navigationBarTitle animated:YES];
    [self.view addSubview: navigationBar];    // Do any additional setup after loading the view, typically from a nib.
    
    scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH , 44)];
    scrollView.backgroundColor = [UIColor clearColor];
    // 是否支持滑动最顶端
    //    scrollView.scrollsToTop = NO;
    scrollView.delegate = self;
    //设置滚动条
    scrollView.showsHorizontalScrollIndicator=NO;
    // 设置内容大小
    scrollView.contentSize = CGSizeMake(875, 44);
    // 是否反弹
        scrollView.bounces = NO;
    // 是否分页
    //    scrollView.pagingEnabled = YES;
    // 是否滚动
    //    scrollView.scrollEnabled = NO;
    //    scrollView.showsHorizontalScrollIndicator = NO;
    // 设置indicator风格
    //    scrollView.indicatorStyle = UIScrollViewIndicatorStyleWhite;
    // 设置内容的边缘和Indicators边缘
    //    scrollView.contentInset = UIEdgeInsetsMake(0, 50, 50, 0);
    //    scrollView.scrollIndicatorInsets = UIEdgeInsetsMake(0, 50, 0, 0);
    // 提示用户,Indicators flash
    [scrollView flashScrollIndicators];
    // 是否同时运动,lock
    scrollView.directionalLockEnabled = YES;
    [self.view addSubview:scrollView];

    for (int i=0; i<7; i++) {
        UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(125*i, 0, 125, 44)];
        btn.tag=i;
        [btn setTitle:titleArray[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(selectorBtn:) forControlEvents:UIControlEventTouchUpInside];
        [btnArray addObject:btn];
        [scrollView addSubview:btn];
        
        lineView=[[UIButton alloc]initWithFrame:CGRectMake(20, 37, 85, 1)];
        lineView.backgroundColor=[UIColor grayColor];
        [btn addSubview:lineView];
        [lineArray addObject:lineView];
    }
    
    jiana=[[JianJieViewController alloc]init];
    [self addChildViewController:jiana];
    [self.view addSubview:jiana.view];
    
    label.text=@"公司简介";
    [self.view addSubview:label];
    ((UIView *)lineArray[0]).backgroundColor=[UIColor greenColor];
    
}
-(void)selectorBtn:(UIButton *)sender{
    NSLog(@"%@",sender.titleLabel.text);
    if (sender.titleLabel.text) {
        [label removeFromSuperview];
    }
    for (int i=0; i<lineArray.count; i++) {
        ((UIView *)lineArray[i]).backgroundColor=[UIColor grayColor];
    }
    ((UIView *)lineArray[sender.tag]).backgroundColor=[UIColor greenColor];


    [jiana.view removeFromSuperview];
    [jianb.view removeFromSuperview];
    [zhiFan.view removeFromSuperview];
    if ([sender.titleLabel.text isEqualToString:@"公司简介"]) {
        jiana=[[JianJieViewController alloc]init];
        [self addChildViewController:jiana];
        [self.view addSubview:jiana.view];
        
        label.text=sender.titleLabel.text;
        [self.view addSubview:label];
    }else if ([sender.titleLabel.text isEqualToString:@"大事记"]) {
        jianb=[[DshijViewController alloc]init];
        [self addChildViewController:jianb];
        [self.view addSubview:jianb.view];
        
        label.text=sender.titleLabel.text;
        [self.view addSubview:label];
    }else if ([sender.titleLabel.text isEqualToString:@"数说太平"]) {
        label.text=sender.titleLabel.text;
        [self.view addSubview:label];
    }else if ([sender.titleLabel.text isEqualToString:@"股东介绍"]) {
        label.text=sender.titleLabel.text;
        [self.view addSubview:label];
    }else if ([sender.titleLabel.text isEqualToString:@"枝繁叶茂"]) {

        zhiFan=[[ZhiFanymViewController alloc]init];
        [self addChildViewController:zhiFan];
        [self.view addSubview:zhiFan.view];

        label.text=sender.titleLabel.text;
        [self.view addSubview:label];
    }else if ([sender.titleLabel.text isEqualToString:@"太平投资"]) {
        label.text=sender.titleLabel.text;
        [self.view addSubview:label];
    }else if ([sender.titleLabel.text isEqualToString:@"辉煌太平"]) {
        label.text=sender.titleLabel.text;
        [self.view addSubview:label];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
