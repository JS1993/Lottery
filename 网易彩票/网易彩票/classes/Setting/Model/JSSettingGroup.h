//
//  JSSettingGroup.h
//  网易彩票
//
//  Created by  江苏 on 16/5/3.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface JSSettingGroup : NSObject

@property(copy,nonatomic)NSString* headerTitle;

@property(copy,nonatomic)NSString* footerTitle;

@property(strong,nonatomic)NSArray* items;

+(instancetype)settingGroupWithItems:(NSArray*)items;

@end
