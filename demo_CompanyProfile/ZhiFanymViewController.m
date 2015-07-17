//
//  ZhiFanymViewController.m
//  demo_CompanyProfile
//
//  Created by 邢晓亮 on 15/7/14.
//  Copyright (c) 2015年 wdl. All rights reserved.
//

#import "ZhiFanymViewController.h"

extern UIImage* Image(NSString* imageName) {
    return [UIImage imageNamed:imageName];
}

@interface ZhiFanymViewController ()
{
    CGPoint touchPoint;
    float zoomScale;
    int lastProvinceSelected;
}
@property(nonatomic, strong)UIView *holderView;
@property(nonatomic, strong)UIImageView *imageView;
@property(nonatomic, strong) NSArray *provinceCoordArray;
@property(nonatomic, strong) NSArray *provinceInfoArray;
@property(nonatomic, strong) NSMutableArray *provinceViewArray;

@property(nonatomic, strong) UILabel *infoLabel;
@end

@implementation ZhiFanymViewController

@synthesize holderView;
@synthesize imageView;
@synthesize provinceCoordArray;
@synthesize provinceInfoArray;
@synthesize provinceViewArray;


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.frame=CGRectMake( 0, 110,SCREEN_WIDTH, SCREEN_HEIGHT-60);
    self.view.backgroundColor=[UIColor clearColor];
    self.infoLabel = [[UILabel alloc] initWithFrame:CGRectMake(35,530,200,80)];
    self.infoLabel.text = @"太平人寿总公司设在上海，目前在国内28个省、自治区、直辖市开设35家分公司和800余家三、四级机构，服务网络基本覆盖全国。";
    self.infoLabel.font = [UIFont systemFontOfSize:12];
    self.infoLabel.numberOfLines = 0;
    self.infoLabel.backgroundColor=[UIColor clearColor];
    self.infoLabel.textColor=[UIColor blackColor];
    //[self.view addSubview:self.infoLabel];
    //界面旋转
    //self.view.transform=CGAffineTransformMakeRotation(3.14/2);
    //self.view.backgroundColor=[UIColor greenColor];
    //地图缩放比例
    zoomScale=0.8;
    
    self.view.userInteractionEnabled=YES;
    UIImage *ima=[UIImage imageNamed:@"zfym.png"];
    self.holderView=[[UIView alloc]initWithFrame:CGRectMake(-20, 130, ima.size.width*zoomScale, ima.size.height*zoomScale)];
    //self.holderView=[[UIView alloc]initWithFrame:CGRectMake(100, 25, ima.size.width*zoomScale, ima.size.height*zoomScale)];
    //旋转
    self.holderView.transform=CGAffineTransformMakeRotation(3.14/2);
    self.holderView.backgroundColor=[UIColor clearColor];
    
    self.imageView=[[UIImageView alloc]initWithImage:ima];
    self.imageView.frame=CGRectMake(0, 0, ima.size.width*zoomScale, ima.size.height*zoomScale);
    self.imageView.contentMode=UIViewContentModeScaleAspectFit;
    [self.holderView addSubview:self.imageView];
    
    //单击手势
    UITapGestureRecognizer *singleRecongnizer=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(SingleTap:)];
    [self.holderView addGestureRecognizer:singleRecongnizer];
    
    [self.view addSubview:self.holderView];
    
    [self setProvince];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)setProvince{
    lastProvinceSelected=1000;
    [self setprovinceCoordArray];
    
    NSMutableArray *provinceImageArray = [NSMutableArray array];
    
    [provinceImageArray addObject:Image(@"xinjiang.png")];//0
    [provinceImageArray addObject:Image(@"gansu.png")];
    [provinceImageArray addObject:Image(@"neimeng.png")];//2
    [provinceImageArray addObject:Image(@"sichuan.png")];
    [provinceImageArray addObject:Image(@"yunan.png")];//4
    [provinceImageArray addObject:Image(@"heilongjiang.png")];
    [provinceImageArray addObject:Image(@"jinin.png")];//6
    [provinceImageArray addObject:Image(@"liaoning.png")];
    [provinceImageArray addObject:Image(@"hebei.png")];//8
    [provinceImageArray addObject:Image(@"shanxi.png")];
    [provinceImageArray addObject:Image(@"shan2xi.png")];//10
    [provinceImageArray addObject:Image(@"shandong.png")];
    [provinceImageArray addObject:Image(@"hainan.png")];//12
    [provinceImageArray addObject:Image(@"henan.png")];
    [provinceImageArray addObject:Image(@"hubei.png")];//14
    [provinceImageArray addObject:Image(@"anhui.png")];
    [provinceImageArray addObject:Image(@"jiangsu.png")];//16
    [provinceImageArray addObject:Image(@"chongqing.png")];
    [provinceImageArray addObject:Image(@"guizhou.png")];//18
    [provinceImageArray addObject:Image(@"hunan.png")];
    [provinceImageArray addObject:Image(@"jiangxi.png")];//20
    [provinceImageArray addObject:Image(@"guangxi.png")];
    [provinceImageArray addObject:Image(@"guangdong.png")];//22
    [provinceImageArray addObject:Image(@"fujian.png")];
    [provinceImageArray addObject:Image(@"zhejiang.png")];//24
    [provinceImageArray addObject:Image(@"shanghai.png")];
    [provinceImageArray addObject:Image(@"beijing.png")];//26
    [provinceImageArray addObject:Image(@"tianjin.png")];
    for (int i=0;i<7;i++){
        [provinceImageArray addObject:Image(@"city.png")];
    }
    
    self.provinceViewArray=[NSMutableArray array];
    for (UIImage *ima in provinceImageArray) {
        UIView *tempView=[[UIImageView alloc]initWithImage:ima];
        tempView.backgroundColor=[UIColor clearColor];
        tempView.hidden=YES;
        [self.provinceViewArray addObject:tempView];
        [self.imageView addSubview:tempView];
    }
    ((UIView*)[self.provinceViewArray objectAtIndex:0]).frame = CGRectMake(2,53,206,156);
    ((UIView*)[self.provinceViewArray objectAtIndex:1]).frame = CGRectMake(175,136,144,122);
    ((UIView*)[self.provinceViewArray objectAtIndex:2]).frame = CGRectMake(218,6,225,192.5);
    ((UIView*)[self.provinceViewArray objectAtIndex:3]).frame = CGRectMake(209,239,111,97);
    ((UIView*)[self.provinceViewArray objectAtIndex:4]).frame = CGRectMake(206,300,89.5,93.5);
    ((UIView*)[self.provinceViewArray objectAtIndex:5]).frame = CGRectMake(402,2,113.5,103);
    ((UIView*)[self.provinceViewArray objectAtIndex:6]).frame = CGRectMake(420,83,85,57.5);
    ((UIView*)[self.provinceViewArray objectAtIndex:7]).frame = CGRectMake(407,117,59.5,56.5);
    ((UIView*)[self.provinceViewArray objectAtIndex:8]).frame = CGRectMake(363,133,55.5,79.5);
    ((UIView*)[self.provinceViewArray objectAtIndex:9]).frame = CGRectMake(335,159,34.5,75);
    ((UIView*)[self.provinceViewArray objectAtIndex:10]).frame = CGRectMake(291,176,50.5,91);
    ((UIView*)[self.provinceViewArray objectAtIndex:11]).frame = CGRectMake(380,186,73,43);
    ((UIView*)[self.provinceViewArray objectAtIndex:12]).frame = CGRectMake(324,405,27,22);
    ((UIView*)[self.provinceViewArray objectAtIndex:13]).frame = CGRectMake(338,210,58.5,58);
    ((UIView*)[self.provinceViewArray objectAtIndex:14]).frame = CGRectMake(319,250,77,48);
    ((UIView*)[self.provinceViewArray objectAtIndex:15]).frame = CGRectMake(382,229,48,59);
    ((UIView*)[self.provinceViewArray objectAtIndex:16]).frame = CGRectMake(394,221,59.5,56.5);
    ((UIView*)[self.provinceViewArray objectAtIndex:17]).frame = CGRectMake(291,265,44.5,46);
    ((UIView*)[self.provinceViewArray objectAtIndex:18]).frame = CGRectMake(270,298,60.5,52.5);
    ((UIView*)[self.provinceViewArray objectAtIndex:19]).frame = CGRectMake(326,287,54.5,63);
    ((UIView*)[self.provinceViewArray objectAtIndex:20]).frame = CGRectMake(375,284,48.5,65.5);
    ((UIView*)[self.provinceViewArray objectAtIndex:21]).frame = CGRectMake(279,330,79.5,60.5);
    ((UIView*)[self.provinceViewArray objectAtIndex:22]).frame = CGRectMake(337,339,80,63.5);
    ((UIView*)[self.provinceViewArray objectAtIndex:23]).frame = CGRectMake(399,301,44.5,60);
    ((UIView*)[self.provinceViewArray objectAtIndex:24]).frame = CGRectMake(419,267,67.5,44.5);
    ((UIView*)[self.provinceViewArray objectAtIndex:25]).frame = CGRectMake(445,245,42.5,22.5);
    ((UIView*)[self.provinceViewArray objectAtIndex:26]).frame = CGRectMake(379,141,37.5,29.5);
    ((UIView*)[self.provinceViewArray objectAtIndex:27]).frame = CGRectMake(391,161,33.5,28);
    
    ((UIView*)[self.provinceViewArray objectAtIndex:28]).frame = CGRectMake(434,164,6.5,6.5);
    ((UIView*)[self.provinceViewArray objectAtIndex:29]).frame = CGRectMake(433,187,6.5,6.5);
    ((UIView*)[self.provinceViewArray objectAtIndex:30]).frame = CGRectMake(437,252,6.5,6.5);
    ((UIView*)[self.provinceViewArray objectAtIndex:31]).frame = CGRectMake(446,274,6.5,6.5);
    ((UIView*)[self.provinceViewArray objectAtIndex:32]).frame = CGRectMake(425,334,6.5,6.5);
    ((UIView*)[self.provinceViewArray objectAtIndex:33]).frame = CGRectMake(378,357,6.5,6.5);
    ((UIView*)[self.provinceViewArray objectAtIndex:34]).frame = CGRectMake(394,365,6.5,6.5);
    
    for (int i=0; i<self.provinceViewArray.count; i++) {
        ((UIView *)[self.provinceViewArray objectAtIndex:i]).frame=CGRectMake(((UIView *)[self.provinceViewArray objectAtIndex:i]).frame.origin.x*zoomScale, ((UIView *)[self.provinceViewArray objectAtIndex:i]).frame.origin.y*zoomScale, ((UIView *)[self.provinceViewArray objectAtIndex:i]).frame.size.width*zoomScale, ((UIView *)[self.provinceViewArray objectAtIndex:i]).frame.size.height*zoomScale);
    };
    
    
}
-(void)setprovinceCoordArray{
    NSString *plistPath=[[[NSBundle mainBundle]resourcePath]stringByAppendingString:@"/TPLProvinceCoord.plist"];
    
    self.provinceCoordArray=[NSArray arrayWithContentsOfFile:plistPath];
    //NSLog(@"provinceCoordArray=%@",self.provinceCoordArray);
    
    plistPath=[[[NSBundle mainBundle]resourcePath]stringByAppendingString:@"/TPLProvinceInfo.plist"];
    self.provinceInfoArray=[NSArray arrayWithContentsOfFile:plistPath];
    //NSLog(@"TPLProvinceInfo==%@",self.provinceInfoArray);
    
    
    for (NSString *item in self.provinceCoordArray) {
        NSArray *arrAreaCoordinates=[item componentsSeparatedByString:@","];
        UIView *tmpView=[[UIView alloc]initWithFrame:CGRectMake(([[arrAreaCoordinates objectAtIndex:0] floatValue])*zoomScale,
                                                                ([[arrAreaCoordinates objectAtIndex:1] floatValue])*zoomScale,
                                                                ([[arrAreaCoordinates objectAtIndex:2] floatValue])*zoomScale,
                                                                ([[arrAreaCoordinates objectAtIndex:3] floatValue])*zoomScale)];
        //tmpView.backgroundColor=[UIColor redColor];
        
        [self.imageView addSubview:tmpView];
        if ([[arrAreaCoordinates objectAtIndex:4] floatValue]==2) {
            //tmpView.backgroundColor=[UIColor redColor];
        }
        
    }
}
- (void) SingleTap:(UITapGestureRecognizer*)recognizer{
//    NSLog(@"---=====----%@",self.provinceCoordArray);
    touchPoint = [recognizer locationInView:self.imageView];
    for (NSString *item in self.provinceCoordArray) {
//        NSLog(@"item==%@",item);
        NSArray *arrAreaCoordinates=[item componentsSeparatedByString:@","];
//        int c;
//        NSLog(@"arrAreaCoordinates[0]==%f  %d",[[arrAreaCoordinates objectAtIndex:0] floatValue],c++);
//        NSLog(@"arrAreaCoordinates[1]==%f",[[arrAreaCoordinates objectAtIndex:1] floatValue]);
//        NSLog(@"arrAreaCoordinates[2]==%f",[[arrAreaCoordinates objectAtIndex:2] floatValue]);
//        NSLog(@"arrAreaCoordinates[3]==%f",[[arrAreaCoordinates objectAtIndex:3] floatValue]);
//        NSLog(@"arrAreaCoordinates[4]==%f",[[arrAreaCoordinates objectAtIndex:4] floatValue]);
//        NSLog(@"count==%lu",(unsigned long)arrAreaCoordinates.count);
        
        if ( (touchPoint.x > [[arrAreaCoordinates objectAtIndex:0] floatValue]*zoomScale) &&
            (touchPoint.x < ([[arrAreaCoordinates objectAtIndex:0] floatValue]*zoomScale+[[arrAreaCoordinates objectAtIndex:2] floatValue]*zoomScale)) &&
            (touchPoint.y > [[arrAreaCoordinates objectAtIndex:1] floatValue]*zoomScale) &&
            ( touchPoint.y < ([[arrAreaCoordinates objectAtIndex:1] floatValue]*zoomScale+[[arrAreaCoordinates objectAtIndex:3] floatValue]*zoomScale))){
//            NSLog(@"ok arrAreaCoordinates==%@",arrAreaCoordinates);
            int i= [[arrAreaCoordinates objectAtIndex:4] intValue];
//            NSLog(@"i==%d",i);
            ((UIView *)[self.provinceViewArray objectAtIndex:i]).hidden=NO;
            if (lastProvinceSelected == 1000) lastProvinceSelected=i;
            
            if (lastProvinceSelected != i) {
                ((UIView *)[self.provinceViewArray objectAtIndex:lastProvinceSelected]).hidden=YES;
                lastProvinceSelected=i;
            }
            //[[self.view findFirstResponder] resignFirstResponder];
            
            break;
        }
//        NSLog(@"=======");
        
    }
    [self.view setNeedsDisplay];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
