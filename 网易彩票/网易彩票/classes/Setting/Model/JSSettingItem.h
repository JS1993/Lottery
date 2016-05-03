//
//  JSSettingItem.h
//  网易彩票
//
//  Created by  江苏 on 16/5/3.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface JSSettingItem : NSObject

@property(nonatomic,strong)UIImage* image;

@property(nonatomic,strong)NSString* title;

@property(copy,nonatomic)NSString* subTitle;

@property(strong,nonatomic) void(^itemOperation)();

+(instancetype)settingItemWithImage:(UIImage*)image andTitle:(NSString*)title;

@end
