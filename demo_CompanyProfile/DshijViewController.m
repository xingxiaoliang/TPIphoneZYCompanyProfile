//
//  DshijViewController.m
//  demo_CompanyProfile
//
//  Created by 邢晓亮 on 15/7/13.
//  Copyright (c) 2015年 wdl. All rights reserved.
//

#import "DshijViewController.h"

@interface DshijViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *tableV;
}
@property (nonatomic ,strong) UITableView *tableV;
@end

@implementation DshijViewController

@synthesize tableV;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.frame=CGRectMake(0, 108, SCREEN_WIDTH, SCREEN_HEIGHT);
    self.view.backgroundColor=[UIColor clearColor];
    tableV=[[UITableView alloc]initWithFrame:CGRectMake(0, 150, SCREEN_WIDTH, SCREEN_HEIGHT-150) style:UITableViewStyleGrouped];
    tableV.delegate=self;
    tableV.dataSource=self;
    //tableView.backgroundColor=[UIColor grayColor];
    [self.view addSubview:tableV];
    // Do any additional setup after loading the view.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //定义个静态字符串为了防止与其他类的tableivew重复
    static NSString *CellIdentifier =@"Cell";
    //定义cell的复用性当处理大量数据时减少内存开销
    UITableViewCell *cell = [tableView  dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell ==nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle  reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text=[NSString stringWithFormat:@"%ld-%ld",(long)indexPath.section,(long)indexPath.row];
    
    return cell;
}
// 添加索引控件
-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return @[@"1",@"2"];
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
