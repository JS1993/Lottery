//
//  JSSettingTableViewCell.h
//  网易彩票
//
//  Created by  江苏 on 16/5/3.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JSSettingItem.h"

@interface JSSettingTableViewCell : UITableViewCell

+(instancetype)cellWithTableView:(UITableView*)tableView andTableViewCellStyle:(UITableViewCellStyle)style;

@property(strong,nonatomic)JSSettingItem* item;

@end
