//
//  JSPushBaseTableViewController.m
//  网易彩票
//
//  Created by  江苏 on 16/5/3.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "JSPushBaseTableViewController.h"


@interface JSPushBaseTableViewController ()

@end


@implementation JSPushBaseTableViewController
-(NSMutableArray *)groups{
    if (_groups==nil) {
        _groups=[NSMutableArray array];
    }
    return _groups;
}

-(instancetype)init{
    
    return [super initWithStyle:UITableViewStyleGrouped];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    

}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.groups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.groups[section] items].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    JSSettingTableViewCell* cell=[JSSettingTableViewCell cellWithTableView:tableView];
    
    cell.item=[self.groups[indexPath.section] items][indexPath.row];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    JSSettingItem* item=[self.groups[indexPath.section] items][indexPath.row];
    
    if (item.itemOperation) {
        item.itemOperation();
    }
    
    if ([item isKindOfClass:[JSArrowSettingItem class]]) {
        JSArrowSettingItem* arrItem=(JSArrowSettingItem*)item;
        if (arrItem.destVC) {
            UIViewController* vc=[[arrItem.destVC alloc]init];
            vc.title=arrItem.title;
            [self.navigationController pushViewController:vc animated:YES];
        }
    }
}

-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
   
    return [self.groups[section] footerTitle];
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [self.groups[section] headerTitle];
}

@end
