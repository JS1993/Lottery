//
//  LuckyView.m
//  网易彩票
//
//  Created by  江苏 on 16/4/27.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "LuckyView.h"

@implementation LuckyView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    UIImage* image=[UIImage imageNamed:@"luck_entry_background"];
    
    [image drawInRect:rect];
}


@end
