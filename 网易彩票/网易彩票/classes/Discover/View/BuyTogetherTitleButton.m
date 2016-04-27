//
//  BuyTogetherTitleButton.m
//  网易彩票
//
//  Created by  江苏 on 16/4/27.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "BuyTogetherTitleButton.h"

@implementation BuyTogetherTitleButton

-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    if (self.imageView.frame.origin.x<self.titleLabel.frame.origin.x) {
        
        self.titleLabel.frame=CGRectMake(0, 0, self.titleLabel.bounds.size.width, self.titleLabel.bounds.size.height);
        
        self.imageView.frame=CGRectMake(CGRectGetMaxX(self.titleLabel.frame), 0, self.imageView.bounds.size.width, self.imageView.bounds.size.height);
    }
    
}

-(void)setImage:(UIImage *)image forState:(UIControlState)state{
    [super setImage:image forState:state];
    
    [self sizeToFit];
}

-(void)setTitle:(NSString *)title forState:(UIControlState)state{
    [super setTitle:title forState:state];
    
    [self sizeToFit];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
