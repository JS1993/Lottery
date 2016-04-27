//
//  CoverView.m
//  网易彩票
//
//  Created by  江苏 on 16/4/27.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "CoverView.h"
#import "JSActivityView.h"

@interface CoverView() 

@end

@implementation CoverView


+(void)show{
    
    CoverView* coverView=[[CoverView alloc]initWithFrame:ScreenBounds];
    
    coverView.backgroundColor=[UIColor blackColor];
    
    coverView.alpha=0.6;
    
    [KeyWindow addSubview:coverView];
    
    [JSActivityView show];
}

+(void)hide{
    
    for (UIView* view in KeyWindow.subviews) {
        if ([view isKindOfClass:self]) {
            [UIView animateWithDuration:1.0 animations:^{
                view.alpha=0.0;
            } completion:^(BOOL finished) {
                [view removeFromSuperview];
            }];
        }
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
