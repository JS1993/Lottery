//
//  JSArenaNavigationController.m
//  网易彩票
//
//  Created by  江苏 on 16/4/27.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "JSArenaNavigationController.h"

@interface JSArenaNavigationController ()

@end

@implementation JSArenaNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UINavigationBar* bar=[UINavigationBar appearanceWhenContainedIn:self.class, nil];
    
    UIImage* image=[UIImage imageNamed:@"NLArenaNavBar64"];
    
    image=[image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    [bar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
