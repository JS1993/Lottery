//
//  JSActivityView.m
//  网易彩票
//
//  Created by  江苏 on 16/4/27.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "JSActivityView.h"

@implementation JSActivityView



+(instancetype)show{
   
    JSActivityView* activityView=[JSActivityView activityView];
    
    activityView.center=KeyWindow.center;
    
    [KeyWindow addSubview:activityView];
    
    return activityView;
    
}


-(void)hide{
    
    for (UIView* view in KeyWindow.subviews) {
        
        if ([view isKindOfClass:self.class]) {
            
            [UIView animateWithDuration:0.5 animations:^{
                
                view.transform=CGAffineTransformTranslate(view.transform, -self.center.x+44, -self.center.y+44);
                
                view.transform=CGAffineTransformScale(view.transform, 0.01, 0.01);
                
                
            } completion:^(BOOL finished) {
                
                [view removeFromSuperview];
                
            }];
        }
    }
    
}

- (IBAction)clickedHiddenButton:(UIButton *)sender{
    
    if ([self.delegate respondsToSelector:@selector(activityViewDidClickedHiddenButton:)]) {
        [self.delegate activityViewDidClickedHiddenButton:self];
    }
    
}

+(instancetype)activityView{
    
    return [[NSBundle mainBundle] loadNibNamed:@"JSActivityView" owner:nil options:nil][0];
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
