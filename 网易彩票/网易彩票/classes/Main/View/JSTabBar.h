//
//  JSTabBar.h
//  网易彩票
//
//  Created by  江苏 on 16/4/26.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JSTabBar;
@protocol JSTabBarDelegate  <NSObject>

@optional

-(void)tabBar:(JSTabBar *)tabBar didClickButtonIndex:(NSInteger)index;

@end

@interface JSTabBar : UIView

@property(nonatomic,strong)NSArray* items;

@property(nonatomic,strong)id<JSTabBarDelegate> delegate;

@end
