//
//  JSTabBar.m
//  网易彩票
//
//  Created by  江苏 on 16/4/26.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "JSTabBar.h"
#import "JSTabBarButton.h"

@interface JSTabBar()

@property(nonatomic,strong)JSTabBarButton* selBtn;

@end

@implementation JSTabBar

-(void)setItems:(NSArray *)items{
    _items=items;
    
    //添加按钮
    for (UITabBarItem* item in _items) {
        JSTabBarButton* btn=[JSTabBarButton buttonWithType:UIButtonTypeCustom];
        
        [btn setImage:item.image forState:UIControlStateNormal];
        
        [btn setImage:item.selectedImage forState:UIControlStateSelected];
        
        btn.tag=self.subviews.count;
        
        [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchDown];
        
        [self addSubview:btn];
        
        //默认一进入点击第一个按钮
        if (self.subviews.count==1) {
            [self click:btn];
        }
    }
}

#pragma mark--按钮的点击事件
-(void)click:(JSTabBarButton* )btn{
    
    //一点击按钮就让上一个按钮的选择状态取消，然后让这一个按钮进入选择状态
    self.selBtn.selected=NO;
    
    btn.selected=YES;
    
    self.selBtn=btn;
    
    if ([self.delegate respondsToSelector:@selector(tabBar:didClickButtonIndex:)]) {
        [self.delegate  tabBar:self didClickButtonIndex:btn.tag];
    }
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    int count=(int)self.subviews.count;
    
    //按钮布局
    for (int i=0; i<count; i++) {
        
        JSTabBarButton* btn=self.subviews[i];
        
        btn.frame=CGRectMake(i*self.bounds.size.width/count,0, self.bounds.size.width/count, self.bounds.size.height);
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
