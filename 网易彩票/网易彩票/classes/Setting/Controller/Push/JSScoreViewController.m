//
//  JSScoreViewController.m
//  网易彩票
//
//  Created by  江苏 on 16/5/3.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "JSScoreViewController.h"


@interface JSScoreViewController ()

@end

@implementation JSScoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpGrou0];
    
    [self setUpGrou1];
    
    [self setUpGrou2];
    
}

-(void)setUpGrou0{
    JSSwitchSettingItem * item0=[JSSwitchSettingItem settingItemWithImage:nil andTitle:@"推送我关注的比赛"];
    
    JSSettingGroup* group=[JSSettingGroup settingGroupWithItems:@[item0]];
    
    group.footerTitle=@"开启后，当我投注或关注的比赛开始、进球和结束时，会自动发送推送消息提醒我";
    
    [self.groups addObject:group];
}

-(void)setUpGrou1{
    JSSettingItem * item0=[JSSettingItem settingItemWithImage:nil andTitle:@"起始时间"];
    
    item0.subTitle=@"00:00";
    
    JSSettingGroup* group=[JSSettingGroup settingGroupWithItems:@[item0]];
    
    group.headerTitle=@"只在以下时间段接收比分推送";
    
    
    
    [self.groups addObject:group];
}

-(void)setUpGrou2{
    JSSettingItem * item0=[JSSettingItem settingItemWithImage:nil andTitle:@"起始时间"];
    
    item0.subTitle=@"00:00";
    
    JSSettingGroup* group=[JSSettingGroup settingGroupWithItems:@[item0]];
    
    [self.groups addObject:group];
}


@end
