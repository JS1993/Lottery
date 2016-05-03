//
//  JSPushBaseTableViewController.h
//  网易彩票
//
//  Created by  江苏 on 16/5/3.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JSSettingTableViewCell.h"
#import "JSArrowSettingItem.h"
#import "JSSwitchSettingItem.h"
#import "JSSettingItem.h"
#import "JSSettingGroup.h"


@interface JSPushBaseTableViewController : UITableViewController

@property(nonatomic,strong)NSMutableArray* groups;

@end
