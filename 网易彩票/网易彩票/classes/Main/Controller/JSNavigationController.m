//
//  JSNavigationController.m
//  网易彩票
//
//  Created by  江苏 on 16/4/26.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "JSNavigationController.h"

@interface JSNavigationController ()<UIGestureRecognizerDelegate>

@end

@implementation JSNavigationController

//此方法仅在程序刚启动加载类的时候对调用，因此只调用一次就可以设置所有属于该类的内容
+(void)initialize{
    
    //当在自己类的时候，统一naviBar的样式
    UINavigationBar* naviBar=[UINavigationBar appearanceWhenContainedIn:self, nil];
    
    [naviBar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
    
    [naviBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:20],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
}

-(void)viewDidLoad{
    
    //关闭系统的滑动返回手势
    self.interactivePopGestureRecognizer.enabled=NO;
   
    UIPanGestureRecognizer* pan=[[UIPanGestureRecognizer alloc]initWithTarget:self.interactivePopGestureRecognizer.delegate action:@selector(handleNavigationTransition:)];
    
    pan.delegate=self;
    
    [self.view addGestureRecognizer:pan];
}

#pragma mark--手势识别代理
-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    
    //如果不是跟控制器，才可以触发滑动返回事件
    return (self.topViewController!=[self.viewControllers firstObject]);
    
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    //如果不是根控制器，才需要设置
    if (self.viewControllers.count!=0) {
        
        viewController.hidesBottomBarWhenPushed=YES;
        
        UIImage * image=[UIImage imageNamed:@"NavBack"];
        
        image=[image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        //自定义返回按钮
        viewController.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithImage:image style:UIBarButtonItemStyleBordered target:self action:@selector(back)];
    }
    
    [super pushViewController:viewController animated:animated];
    
}

-(void)back{
    
    [self popViewControllerAnimated:YES];
}

@end
