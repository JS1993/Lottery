//
//  JSSettingItem.m
//  网易彩票
//
//  Created by  江苏 on 16/5/3.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "JSSettingItem.h"

@implementation JSSettingItem

+(instancetype)settingItemWithImage:(UIImage*)image andTitle:(NSString*)title{
    
    JSSettingItem* item=[[JSSettingItem alloc]init];
    
    item.image=image;
    
    item.title=title;
    
    return item;
}

@end
