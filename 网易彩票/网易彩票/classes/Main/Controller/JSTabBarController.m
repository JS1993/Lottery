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
#import "JSMyLotteryTableViewController.h"
#import "JSHistoryTableViewController.h"
#import "JSTabBar.h"
#import "JSNavigationController.h"

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
    //移除自身的tabBar
    [self.tabBar removeFromSuperview];
    
    JSTabBar* tabBar=[[JSTabBar alloc]init];
    
    tabBar.items=self.items;
    
    tabBar.frame=self.tabBar.frame;
    
    tabBar.delegate=self;
    
    tabBar.backgroundColor=[self randomColor];
    
    [self.view addSubview:tabBar];
}

#pragma mark-- 创建子界面
-(void)setUpViewControllers{
    
    JSHallTableViewController* hallVC=[[JSHallTableViewController alloc]init];
    [self setUpViewController:hallVC andImage:[UIImage imageNamed:@"TabBar_LotteryHall_new"] andSelImage:[UIImage imageNamed:@"TabBar_LotteryHall_selected_new"] andTitle:@"购彩大厅"];
    
    JSAranaViewController* arenaVC=[[JSAranaViewController alloc]init];
    [self setUpViewController:arenaVC andImage:[UIImage imageNamed:@"TabBar_Arena_new"] andSelImage:[UIImage imageNamed:@"TabBar_Arena_selected_new"] andTitle:@"竞技场"];
    
    JSDiscoverTableViewController* discoverVC=[[JSDiscoverTableViewController alloc]init];
    [self setUpViewController:discoverVC andImage:[UIImage imageNamed:@"TabBar_Discovery_new"] andSelImage:[UIImage imageNamed:@"TabBar_Discovery_selected_new"] andTitle:@"发现"];
    
    JSHistoryTableViewController* historyVC=[[JSHistoryTableViewController alloc]init];
    [self setUpViewController:historyVC andImage:[UIImage imageNamed:@"TabBar_History_new"] andSelImage:[UIImage imageNamed:@"TabBar_History_selected_new"] andTitle:@"开奖信息"];
    
    JSMyLotteryTableViewController* myLotteryVC=[[JSMyLotteryTableViewController alloc]init];
    [self setUpViewController:myLotteryVC andImage:[UIImage imageNamed:@"TabBar_MyLottery_new"] andSelImage:[UIImage imageNamed:@"TabBar_MyLottery_selected_new"] andTitle:@"我的彩票"];
}

#pragma mark--将控制器统一包装的方法
-(void)setUpViewController:(UIViewController*)vc andImage:(UIImage*)image andSelImage:(UIImage*)selImage andTitle:(NSString*)title{
    
    vc.tabBarItem.image=image;
    
    vc.tabBarItem.selectedImage=selImage;
    
    vc.navigationItem.title=title;
    
    vc.view.backgroundColor=[self randomColor];
    
    JSNavigationController* navi=[[JSNavigationController alloc]initWithRootViewController:vc];
    
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
