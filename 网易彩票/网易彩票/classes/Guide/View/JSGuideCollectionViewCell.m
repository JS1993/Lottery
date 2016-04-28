//
//  JSGuideCollectionViewCell.m
//  网易彩票
//
//  Created by  江苏 on 16/4/28.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "JSGuideCollectionViewCell.h"
#import "JSTabBarController.h"

@interface JSGuideCollectionViewCell()

@property(nonatomic,strong)UIImageView* imageView;

@property(nonatomic,strong)UIButton* startButton;

@end

@implementation JSGuideCollectionViewCell

-(UIButton *)startButton{
    if (_startButton==nil) {
        _startButton=[UIButton buttonWithType:UIButtonTypeCustom];
        
        [_startButton setBackgroundImage:[UIImage imageNamed:@"guideStart"] forState:UIControlStateNormal];
        
        [_startButton sizeToFit];
        
        _startButton.center=CGPointMake(self.bounds.size.width*0.5, ScreenH*0.9);
        
        [_startButton addTarget:self action:@selector(start) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:_startButton];
    }
    return _startButton;
}


-(UIImageView *)imageView{
    if (_imageView==nil) {
        
        _imageView=[[UIImageView alloc]initWithFrame:KeyWindow.bounds];
        
        [self.contentView addSubview:_imageView];
    }
    return _imageView;
}

-(void)setImage:(UIImage *)image{
    
    _image=image;
    
    self.imageView.image=image;
}

-(void)setUpPage:(NSInteger)item withAllPages:(NSInteger)allPages{
    if (item==allPages-1) {
        self.startButton.hidden=NO;
    }else{
        self.startButton.hidden=YES;
    }
}

-(void)start{
    
    JSTabBarController* tab=[[JSTabBarController alloc]init];
    
    KeyWindow.rootViewController=tab;
    
    CATransition* anim=[CATransition animation];
    
    anim.type=@"rippleffect";
    
    anim.duration=0.5;
    
    [KeyWindow.layer addAnimation:anim forKey:nil];
}
@end
