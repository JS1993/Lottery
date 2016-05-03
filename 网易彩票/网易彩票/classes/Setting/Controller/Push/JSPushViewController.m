//
//  JSPushViewController.m
//  网易彩票
//
//  Created by  江苏 on 16/5/3.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "JSPushViewController.h"
#import "JSScoreViewController.h"
#import "JSAwardViewController.h"


@interface JSPushViewController ()

@end

@implementation JSPushViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpGroup];
}


-(void)setUpGroup{
    
    JSArrowSettingItem * item0=[JSArrowSettingItem settingItemWithImage:nil andTitle:@"开奖推送"];
    item0.destVC=[JSAwardViewController class];
    
    item0.itemOperation=^(){
        

        
    };
    
    JSArrowSettingItem * item1=[JSArrowSettingItem settingItemWithImage:nil andTitle:@"比分直播推送"];
    item1.destVC=[JSScoreViewController class];
    
    JSArrowSettingItem * item2=[JSArrowSettingItem settingItemWithImage:nil andTitle:@"中奖动画"];
    
    JSArrowSettingItem * item3=[JSArrowSettingItem settingItemWithImage:nil andTitle:@"购彩提醒"];
    
    JSSettingGroup* group=[JSSettingGroup settingGroupWithItems:@[item0,item1,item2,item3]];
    
    [self.groups addObject:group];
    
}

@end
