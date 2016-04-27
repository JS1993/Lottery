//
//  JSMyLotteryViewController.m
//  网易彩票
//
//  Created by  江苏 on 16/4/27.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "JSMyLotteryViewController.h"

@interface JSMyLotteryViewController ()

@end

@implementation JSMyLotteryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建右边按钮
    UIImage *rightImage=[UIImage imageNamed:@"Mylottery_config"];
    
    UIImage* rightImageX=[rightImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithImage:rightImageX style:UIBarButtonItemStylePlain target:self action:@selector(rightButtonClicked)];
    
    //创建左边自定义按钮
    UIButton* btn=[UIButton buttonWithType:UIButtonTypeCustom];
    
    UIImage* leftImage=[UIImage imageNamed:@"FBMM_Barbutton"];
    
    [btn setImage:leftImage forState:UIControlStateNormal];
    
    [btn setTitle:@"客服" forState:UIControlStateNormal];
    
    [btn sizeToFit];
    
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithCustomView:btn];
}

-(void)rightButtonClicked{
    
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
