//
//  GuideTools.m
//  网易彩票
//
//  Created by  江苏 on 16/4/28.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "GuideTools.h"

@implementation GuideTools

+(UIViewController*)chooseRootViewController{
    
    NSUserDefaults* ud=[NSUserDefaults standardUserDefaults];
    
    int runTimes=(int)[ud integerForKey:@"runTimes"];
    
    [ud setInteger:++runTimes forKey:@"runTimes"];
    [ud synchronize];
    
    if (runTimes==1) {
        
        JSGuideViewController* guide=[[JSGuideViewController alloc]init];
        
        return guide;
    }else{
        JSTabBarController* tab=[[JSTabBarController alloc]init];
        
        return tab;
    }
}

@end
