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
    UIScrollView *headScrollView;
    UIImageView *headImageView;
    NSMutableArray *btnArray;
    NSArray *titleArray;
    UILabel *label;
    UIView *lineView;
    NSMutableArray *lineArray;
    JianJieViewController *jiana;
    DshijViewController *jianb;
    ZhiFanymViewController *zhiFan;
    NSString *seletedString;

}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    lineArray=[NSMutableArray array];
    btnArray=[NSMutableArray array];
    
    label=[[UILabel alloc]initWithFrame:CGRectMake(100, 100, 100, 50)];
    
    
    btnArray=[NSMutableArray array];
    titleArray=@[@"辉煌太平",@"公司简介",@"大事记",@"数说太平",@"股东介绍",@"枝繁叶茂",@"太平投资",@"辉煌太平",@"公司简介",@"大事记",@"数说太平"];
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
    
    headScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH , 44)];
    headScrollView.backgroundColor = [UIColor clearColor];
    // 是否支持滑动最顶端
    //    headScrollView.scrollsToTop = NO;
    headScrollView.delegate = self;
    //设置滚动条
    headScrollView.showsHorizontalScrollIndicator=NO;
    // 设置内容大小
    headScrollView.contentSize = CGSizeMake(SCREEN_WIDTH/3*titleArray.count, 44);
    // 是否反弹
        headScrollView.bounces = NO;
    // 是否分页
    //    headScrollView.pagingEnabled = YES;
    // 是否滚动
    //    headScrollView.scrollEnabled = NO;
    //    headScrollView.showsHorizontalScrollIndicator = NO;
    // 设置indicator风格
    //    headScrollView.indicatorStyle = UIheadScrollViewIndicatorStyleWhite;
    // 设置内容的边缘和Indicators边缘
    //    headScrollView.contentInset = UIEdgeInsetsMake(0, 50, 50, 0);
    //    headScrollView.scrollIndicatorInsets = UIEdgeInsetsMake(0, 50, 0, 0);
    // 提示用户,Indicators flash
    [headScrollView flashScrollIndicators];
    // 是否同时运动,lock
    headScrollView.directionalLockEnabled = YES;
    [self.view addSubview:headScrollView];

    for (int i=0; i<titleArray.count; i++) {
        UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/3*i, 0, SCREEN_WIDTH/3, 44)];
        btn.tag=i;
        [btn setTitle:titleArray[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];

        [btn addTarget:self action:@selector(selectorBtn:) forControlEvents:UIControlEventTouchUpInside];
        [btnArray addObject:btn];
        [headScrollView addSubview:btn];
        
        lineView=[[UIButton alloc]initWithFrame:CGRectMake(20, 37, 85, 1)];
        lineView.backgroundColor=[UIColor colorWithRed:35.0/255.0 green:150.0/255.0 blue:218.0/255.0 alpha:0.2];
        [btn addSubview:lineView];
        [lineArray addObject:lineView];
    }
    
    jiana=[[JianJieViewController alloc]init];
    [self addChildViewController:jiana];
    [self.view addSubview:jiana.view];
    
    label.text=@"公司简介";
    [self.view addSubview:label];
    
    ((UIView *)lineArray[1]).backgroundColor=[UIColor colorWithRed:35.0/255.0 green:150.0/255.0 blue:218.0/255.0 alpha:1.0];
    ((UIView *)lineArray[8]).backgroundColor=[UIColor colorWithRed:35.0/255.0 green:150.0/255.0 blue:218.0/255.0 alpha:1.0];

    [headScrollView scrollRectToVisible:CGRectMake(SCREEN_WIDTH, 0, SCREEN_WIDTH/3, 44) animated:NO];

    headImageView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"公司简介121.png"]];
    headImageView.frame=CGRectMake(0, 64, headImageView.frame.size.width*(SCREEN_WIDTH/headImageView.frame.size.width), headImageView.frame.size.height*(SCREEN_WIDTH/headImageView.frame.size.width));
    [self.view addSubview:headImageView];
    [self.view insertSubview:headImageView atIndex:0];
    
}
-(void)selectorBtn:(UIButton *)sender{
    
    if ([seletedString isEqualToString:sender.titleLabel.text]){
        return;
    }
    seletedString=sender.titleLabel.text;

    NSLog(@"%@",sender.titleLabel.text);
    [headImageView removeFromSuperview];
    
    if (sender.titleLabel.text) {
        [label removeFromSuperview];
    }
   
    label.text=sender.titleLabel.text;
    [self.view addSubview:label];
    for (int i=0; i<lineArray.count; i++) {
        ((UIView *)lineArray[i]).backgroundColor=[UIColor colorWithRed:35.0/255.0 green:150.0/255.0 blue:218.0/255.0 alpha:0.2];
    }
    
    ((UIView *)lineArray[sender.tag]).backgroundColor=[UIColor colorWithRed:35.0/255.0 green:150.0/255.0 blue:218.0/255.0 alpha:1.0];
    
    
    if (sender.tag+7<titleArray.count) {
        ((UIView *)lineArray[sender.tag+7]).backgroundColor=[UIColor colorWithRed:35.0/255.0 green:150.0/255.0 blue:218.0/255.0 alpha:1.0];
    }if(sender.tag>7){
        ((UIView *)lineArray[sender.tag-7]).backgroundColor=[UIColor colorWithRed:35.0/255.0 green:150.0/255.0 blue:218.0/255.0 alpha:1.0];
    }
    

    [jiana.view removeFromSuperview];
    [jianb.view removeFromSuperview];
    [zhiFan.view removeFromSuperview];
    
    if ([sender.titleLabel.text isEqualToString:@"公司简介"]) {
        jiana=[[JianJieViewController alloc]init];
        [self addChildViewController:jiana];
        [self.view addSubview:jiana.view];

        headImageView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"公司简介121.png"]];
        headImageView.frame=CGRectMake(0, 64, headImageView.frame.size.width*(SCREEN_WIDTH/headImageView.frame.size.width), headImageView.frame.size.height*(SCREEN_WIDTH/headImageView.frame.size.width));
        [self.view addSubview:headImageView];
        [self.view insertSubview:headImageView atIndex:0];
        
    }else if ([sender.titleLabel.text isEqualToString:@"大事记"]) {
        jianb=[[DshijViewController alloc]init];
        [self addChildViewController:jianb];
        [self.view addSubview:jianb.view];

    }else if ([sender.titleLabel.text isEqualToString:@"数说太平"]) {

    }else if ([sender.titleLabel.text isEqualToString:@"股东介绍"]) {

    }else if ([sender.titleLabel.text isEqualToString:@"枝繁叶茂"]) {
        
        zhiFan=[[ZhiFanymViewController alloc]init];
        [self addChildViewController:zhiFan];
        [self.view addSubview:zhiFan.view];

    }else if ([sender.titleLabel.text isEqualToString:@"太平投资"]) {

    }else if ([sender.titleLabel.text isEqualToString:@"辉煌太平"]) {
        
    }
}
//只要滚动了就会触发  循环滚动
- (void)scrollViewDidScroll:(UIScrollView *)scrollView;
{
    
    if (headScrollView.contentOffset.x==0) {
        [headScrollView scrollRectToVisible:CGRectMake(SCREEN_WIDTH/3*9, 0, SCREEN_WIDTH/3, 44) animated:NO];
    }if ((int)(headScrollView.contentOffset.x)==(int)(SCREEN_WIDTH/3*8)) {
        [headScrollView scrollRectToVisible:CGRectMake(SCREEN_WIDTH/3, 0, SCREEN_WIDTH/3, 44) animated:NO];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
