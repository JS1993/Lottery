//
//  JSTabBarController.m
//  网易彩票
//
//  Created by  江苏 on 16/4/26.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "JSTabBarController.h"
#import "JSAranaViewController.h"
#import "JSHallTableViewController.h"
#import "JSDiscoverTableViewController.h"
#import "JSMyLotteryViewController.h"
#import "JSHistoryTableViewController.h"
#import "JSTabBar.h"
#import "JSNavigationController.h"
#import "JSArenaNavigationController.h"

@interface JSTabBarController ()<JSTabBarDelegate>

@property(nonatomic,strong)NSMutableArray* items;

@end

@implementation JSTabBarController

-(NSMutableArray *)items{
    if (_items==nil) {
        _items=[NSMutableArray array];
    }
    return _items;
}


-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    //把所有除了tabBar之外的子控件移除
    for (UIView* view in self.tabBar.subviews) {
        if (![view isKindOfClass:[JSTabBar class]]) {
            [view removeFromSuperview];
        }
    }

}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpViewControllers];
    
    [self setUpTabBar];
    
}

#pragma mark-JSTabBarDelegate方法
-(void)tabBar:(JSTabBar *)tabBar didClickButtonIndex:(NSInteger)index{
   
    self.selectedIndex=(NSInteger)index;
    
}

#pragma mark--创建tabBar
-(void)setUpTabBar{
    
    JSTabBar* tabBar=[[JSTabBar alloc]init];
    
    tabBar.items=self.items;
    
    tabBar.frame=self.tabBar.bounds;
    
    tabBar.delegate=self;
    
    tabBar.backgroundColor=[UIColor blackColor];
    
    [self.tabBar addSubview:tabBar];
}

#pragma mark-- 创建子界面
-(void)setUpViewControllers{
    
    JSHallTableViewController* hallVC=[[JSHallTableViewController alloc]init];
    [self setUpViewController:hallVC andImage:[UIImage imageNamed:@"TabBar_LotteryHall_new"] andSelImage:[UIImage imageNamed:@"TabBar_LotteryHall_selected_new"] andTitle:@"购彩大厅"];
    
    JSAranaViewController* arenaVC=[[JSAranaViewController alloc]init];
    [self setUpViewController:arenaVC andImage:[UIImage imageNamed:@"TabBar_Arena_new"] andSelImage:[UIImage imageNamed:@"TabBar_Arena_selected_new"] andTitle:@"竞技场"];
    
    UIStoryboard* stroyBoard=[UIStoryboard storyboardWithName:@"JSDiscoverTableViewController" bundle:nil];
    
    JSDiscoverTableViewController* discoverVC=[stroyBoard instantiateInitialViewController];
    [self setUpViewController:discoverVC andImage:[UIImage imageNamed:@"TabBar_Discovery_new"] andSelImage:[UIImage imageNamed:@"TabBar_Discovery_selected_new"] andTitle:@"发现"];
    
    JSHistoryTableViewController* historyVC=[[JSHistoryTableViewController alloc]init];
    [self setUpViewController:historyVC andImage:[UIImage imageNamed:@"TabBar_History_new"] andSelImage:[UIImage imageNamed:@"TabBar_History_selected_new"] andTitle:@"开奖信息"];
    
    JSMyLotteryViewController* myLotteryVC=[[JSMyLotteryViewController alloc]init];
    [self setUpViewController:myLotteryVC andImage:[UIImage imageNamed:@"TabBar_MyLottery_new"] andSelImage:[UIImage imageNamed:@"TabBar_MyLottery_selected_new"] andTitle:@"我的彩票"];
}

#pragma mark--将控制器统一包装的方法
-(void)setUpViewController:(UIViewController*)vc andImage:(UIImage*)image andSelImage:(UIImage*)selImage andTitle:(NSString*)title{
    
    vc.tabBarItem.image=image;
    
    vc.tabBarItem.selectedImage=selImage;
    
    vc.navigationItem.title=title;
    
    UINavigationController* navi=[[JSNavigationController alloc]initWithRootViewController:vc];
    
    if ([vc isMemberOfClass:[JSAranaViewController class]]) {
        navi=[[JSArenaNavigationController alloc]initWithRootViewController:vc];
    }
    
    [self addChildViewController:navi];
    
    [self.items addObject:vc.tabBarItem];
    
}


#pragma mark--生成随机色
-(UIColor*)randomColor{
    
    CGFloat r=arc4random_uniform(256)/255.0;
    CGFloat g=arc4random_uniform(256)/255.0;
    CGFloat b=arc4random_uniform(256)/255.0;
    
    return [UIColor colorWithRed:r green:g blue:b alpha:1.0];
}

@end
