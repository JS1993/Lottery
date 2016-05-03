//
//  JSAwardViewController.m
//  网易彩票
//
//  Created by  江苏 on 16/5/3.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "JSAwardViewController.h"

@interface JSAwardViewController ()

@end

@implementation JSAwardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpGroup];
}

-(void)setUpGroup{
    
    JSSwitchSettingItem * item0=[JSSwitchSettingItem settingItemWithImage:nil andTitle:@"双色球"];
    item0.subTitle=@"每周二、四、日开奖";
    
    JSSwitchSettingItem * item1=[JSSwitchSettingItem settingItemWithImage:nil andTitle:@"大乐透"];
    item1.subTitle=@"每周一、三、六开奖";
    
    JSSwitchSettingItem * item2=[JSSwitchSettingItem settingItemWithImage:nil andTitle:@"3D"];
    item2.subTitle=@"每天开奖，包括试机号提醒";
    
    JSSwitchSettingItem * item3=[JSSwitchSettingItem settingItemWithImage:nil andTitle:@"七乐彩"];
    item3.subTitle=@"每周一、三、五开奖";
    
    JSSwitchSettingItem * item4=[JSSwitchSettingItem settingItemWithImage:nil andTitle:@"七星彩"];
    item4.subTitle=@"每周二、五、日开奖";
    
    JSSwitchSettingItem * item5=[JSSwitchSettingItem settingItemWithImage:nil andTitle:@"排列3"];
    item5.subTitle=@"每天开奖";
    
    JSSwitchSettingItem * item6=[JSSwitchSettingItem settingItemWithImage:nil andTitle:@"排列5"];
    item6.subTitle=@"每天开奖";
    
    JSSettingGroup* group=[JSSettingGroup settingGroupWithItems:@[item0,item1,item2,item3,item4,item5,item6]];
    
    [self.groups addObject:group];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JSSettingTableViewCell* cell=[JSSettingTableViewCell cellWithTableView:tableView andTableViewCellStyle:UITableViewCellStyleSubtitle];
    
    cell.item=[self.groups[indexPath.section] items][indexPath.row];
    
    
    return cell;
}

@end
