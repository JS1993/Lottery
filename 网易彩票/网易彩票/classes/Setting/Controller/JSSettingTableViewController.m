//
//  JSSettingTableViewController.m
//  网易彩票
//
//  Created by  江苏 on 16/5/3.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "JSSettingTableViewController.h"
#import "JSSettingTableViewCell.h"
#import "JSSettingGroup.h"
#import "JSArrowSettingItem.h"
#import "JSSwitchSettingItem.h"

#import "MBProgressHUD+XMG.h"
#import "JSCheckUpdateBlurView.h"

#import "JSPushViewController.h"
#import "JSHelpTableViewController.h"

@interface JSSettingTableViewController ()

@end

@implementation JSSettingTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title=@"设置";
    
    [self setUpGroup0];
    
    [self setUpGroup1];
    
    [self setUpGroup2];
    
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"常见问题" style:UIBarButtonItemStyleBordered target:self action:@selector(help)];
    self.navigationItem.rightBarButtonItem.tintColor=[UIColor whiteColor];
    
}

-(void)help{
   
    JSHelpTableViewController* helpVC=[[JSHelpTableViewController alloc]init];
    
    helpVC.title=@"帮助";
    
    [self.navigationController pushViewController:helpVC animated:YES];
}

-(void)setUpGroup0{
    JSArrowSettingItem * item0=[JSArrowSettingItem settingItemWithImage:[UIImage imageNamed:@"RedeemCode"] andTitle:@"使用兑换码"];
    
    JSSettingGroup* group=[JSSettingGroup settingGroupWithItems:@[item0]];
    
    [self.groups addObject:group];
}

-(void)setUpGroup1{
    JSArrowSettingItem * item0=[JSArrowSettingItem settingItemWithImage:[UIImage imageNamed:@"MorePush"] andTitle:@"推送和提醒"];
    item0.destVC=[JSPushViewController class];
    
    JSSwitchSettingItem * item1=[JSSwitchSettingItem settingItemWithImage:[UIImage imageNamed:@"more_homeshake"] andTitle:@"使用摇一摇机选"];
    
    JSSwitchSettingItem * item2=[JSSwitchSettingItem settingItemWithImage:[UIImage imageNamed:@"sound-Effect"] andTitle:@"声音效果"];
    
    JSSwitchSettingItem * item3=[JSSwitchSettingItem settingItemWithImage:[UIImage imageNamed:@"More_LotteryRecommend"] andTitle:@"购彩小助手"];
    
    JSSettingGroup* group=[JSSettingGroup settingGroupWithItems:@[item0,item1,item2,item3]];
    
    [self.groups addObject:group];
}

-(void)setUpGroup2{
    
    JSArrowSettingItem * item0=[JSArrowSettingItem settingItemWithImage:[UIImage imageNamed:@"MoreUpdate"] andTitle:@"检查新版本"];
    
    item0.itemOperation=^(){
        
        JSCheckUpdateBlurView* blurView=[[JSCheckUpdateBlurView alloc]initWithFrame:ScreenBounds];
        
        [KeyWindow addSubview:blurView];
        
        [MBProgressHUD showSuccess:@"当前木有最新的版本"];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.7 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            [blurView removeFromSuperview];
            
        });
        
    };
    
    JSArrowSettingItem * item1=[JSArrowSettingItem settingItemWithImage:[UIImage imageNamed:@"MoreShare"] andTitle:@"分享"];
    
    JSArrowSettingItem * item2=[JSArrowSettingItem settingItemWithImage:[UIImage imageNamed:@"MoreNetease"] andTitle:@"产品推荐"];
    
    JSArrowSettingItem * item3=[JSArrowSettingItem settingItemWithImage:[UIImage imageNamed:@"MoreAbout"] andTitle:@"关于"];
    
    JSSettingGroup* group=[JSSettingGroup settingGroupWithItems:@[item0,item1,item2,item3]];
    
    [self.groups addObject:group];
    
}


@end
