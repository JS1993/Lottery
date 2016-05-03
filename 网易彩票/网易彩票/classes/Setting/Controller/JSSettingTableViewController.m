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

@interface JSSettingTableViewController ()

@property(nonatomic,strong)NSMutableArray* groups;

@end

@implementation JSSettingTableViewController

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
    
    self.title=@"设置";
    
    [self setUpGroup0];
    
    [self setUpGroup1];
    
    [self setUpGroup2];
    
}

-(void)setUpGroup0{
    JSArrowSettingItem * item0=[JSArrowSettingItem settingItemWithImage:[UIImage imageNamed:@"RedeemCode"] andTitle:@"使用兑换码"];
    
    JSSettingGroup* group=[JSSettingGroup settingGroupWithItems:@[item0]];
    
    [self.groups addObject:group];
}

-(void)setUpGroup1{
    JSArrowSettingItem * item0=[JSArrowSettingItem settingItemWithImage:[UIImage imageNamed:@"MorePush"] andTitle:@"推送和提醒"];
    
    JSSwitchSettingItem * item1=[JSSwitchSettingItem settingItemWithImage:[UIImage imageNamed:@"more_homeshake"] andTitle:@"使用摇一摇机选"];
    
    JSSwitchSettingItem * item2=[JSSwitchSettingItem settingItemWithImage:[UIImage imageNamed:@"sound-Effect"] andTitle:@"声音效果"];
    
    JSSwitchSettingItem * item3=[JSSwitchSettingItem settingItemWithImage:[UIImage imageNamed:@"More_LotteryRecommend"] andTitle:@"购彩小助手"];
    
    JSSettingGroup* group=[JSSettingGroup settingGroupWithItems:@[item0,item1,item2,item3]];
    
    [self.groups addObject:group];
}

-(void)setUpGroup2{
    
    JSArrowSettingItem * item0=[JSArrowSettingItem settingItemWithImage:[UIImage imageNamed:@"MoreUpdate"] andTitle:@"检查新版本"];
    
    JSArrowSettingItem * item1=[JSArrowSettingItem settingItemWithImage:[UIImage imageNamed:@"MoreShare"] andTitle:@"分享"];
    
    JSArrowSettingItem * item2=[JSArrowSettingItem settingItemWithImage:[UIImage imageNamed:@"MoreNetease"] andTitle:@"产品推荐"];
    
    JSArrowSettingItem * item3=[JSArrowSettingItem settingItemWithImage:[UIImage imageNamed:@"MoreAbout"] andTitle:@"关于"];
    
    JSSettingGroup* group=[JSSettingGroup settingGroupWithItems:@[item0,item1,item2,item3]];
    
    [self.groups addObject:group];
    
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

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
