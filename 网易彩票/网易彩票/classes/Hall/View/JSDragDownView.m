//
//  JSDragDownView.m
//  网易彩票
//
//  Created by  江苏 on 16/4/27.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "JSDragDownView.h"

@interface JSDragDownView()

@property(nonatomic,strong)NSMutableArray* btns;

@end

@implementation JSDragDownView

-(NSMutableArray *)btns{
    if (_btns==nil) {
        _btns=[NSMutableArray array];
    }
    return _btns;
}

+(instancetype)showInView:(UIView*)showView{
   
    JSDragDownView* dragView=[[JSDragDownView alloc]initWithFrame:CGRectMake(0, 0, ScreenW, ScreenW/3*2)];
    
    [dragView setUpChildViews];
    
    [dragView setUpDevideView];
    
    //创建黑色背景，防止露出白色背景
    UIView* blackView=[[UIView alloc]initWithFrame:dragView.frame];
    
    blackView.backgroundColor=[UIColor blackColor];

    [showView addSubview:blackView];
    
    dragView.transform=CGAffineTransformMakeTranslation(0, -dragView.bounds.size.height);
    
    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.3 initialSpringVelocity:0.2 options:UIViewAnimationOptionCurveLinear animations:^{

        dragView.transform=CGAffineTransformIdentity;
        
    } completion:^(BOOL finished) {
        
        [blackView removeFromSuperview];
        
    }];
    
    return dragView;
}

-(void)hide:(JSDragDownView*)dragView{
    
    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:0 options:UIViewAnimationOptionCurveLinear animations:^{
        
        dragView.transform=CGAffineTransformMakeTranslation(0, -ScreenW/3*2);
        
    } completion:^(BOOL finished) {
        
        [dragView removeFromSuperview];
        
        
    }];
}

-(void)setUpDevideView{
    
    UIView* horView=[[UIView alloc]initWithFrame:CGRectMake(0, self.bounds.size.height/2, self.bounds.size.width, 1)];
    horView.backgroundColor=[UIColor whiteColor];
    [self addSubview:horView];
    
    UIView* verView1=[[UIView alloc]initWithFrame:CGRectMake( ScreenW/3,0, 1, self.bounds.size.height)];
    verView1.backgroundColor=[UIColor whiteColor];
    [self addSubview:verView1];
    
     UIView* verView2=[[UIView alloc]initWithFrame:CGRectMake( ScreenW/3*2,0, 1, self.bounds.size.height)];
    verView2.backgroundColor=[UIColor whiteColor];
    [self addSubview:verView2];
    
    
}

-(void)setUpChildViews{
    for (int i=0;i<6;i++) {
        
        UIButton* btn=[UIButton buttonWithType:UIButtonTypeCustom];
        
        [btn setImage:[UIImage imageNamed:@"FBMM_Barbutton"] forState:UIControlStateNormal];
        
        [btn setBackgroundColor:[UIColor blackColor]];
        
        [self.btns addObject:btn];
        
        [self addSubview:btn];
    }
    
    
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    NSInteger cols=3;
    CGFloat btnWH=ScreenW/cols;
    
    for (int i=0;i<self.btns.count;i++) {
        
        CGFloat x=i%cols*btnWH;
        CGFloat y=i/cols*btnWH;
        UIButton* btn=self.btns[i];
        
        btn.frame=CGRectMake(x, y, btnWH, btnWH);
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
