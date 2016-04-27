//
//  JSAranaViewController.m
//  网易彩票
//
//  Created by  江苏 on 16/4/26.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "JSAranaViewController.h"

@interface JSAranaViewController ()

@end

@implementation JSAranaViewController

-(void)loadView{

    UIImageView* imageView=[[UIImageView alloc]init];
    
    imageView.image=[UIImage imageNamed:@"NLArenaBackground"];
    
    imageView.userInteractionEnabled=YES;
    
    self.view=imageView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //自定义分段指示控件
    UISegmentedControl* segmentControl=[[UISegmentedControl alloc]initWithItems:@[@"足球",@"篮球"]];
    
    [segmentControl setBackgroundImage:[UIImage imageNamed:@"CPArenaSegmentBG"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    
    [segmentControl setBackgroundImage:[UIImage imageNamed:@"CPArenaSegmentSelectedBG"] forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
    
    segmentControl.selectedSegmentIndex=0;
    
    segmentControl.bounds=CGRectMake(0, 0, segmentControl.bounds.size.width+40, segmentControl.bounds.size.height);
    
    [segmentControl setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]} forState:UIControlStateNormal];
    
    segmentControl.tintColor=[UIColor colorWithRed:0.0/255.0 green:142/255.0 blue:143/255.0 alpha:1.0];
    
    self.navigationItem.titleView=segmentControl;
    
}



@end
