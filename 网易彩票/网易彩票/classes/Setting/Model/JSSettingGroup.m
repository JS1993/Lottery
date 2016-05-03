//
//  JSSettingGroup.m
//  网易彩票
//
//  Created by  江苏 on 16/5/3.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "JSSettingGroup.h"

@implementation JSSettingGroup


+(instancetype)settingGroupWithItems:(NSArray*)items{
    
    JSSettingGroup* group=[[self alloc]init];
    
    group.items=items;
    
    return group;
}

@end
