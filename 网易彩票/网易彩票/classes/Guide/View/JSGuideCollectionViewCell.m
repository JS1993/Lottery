//
//  JSGuideCollectionViewCell.m
//  网易彩票
//
//  Created by  江苏 on 16/4/28.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "JSGuideCollectionViewCell.h"

@interface JSGuideCollectionViewCell()

@property(nonatomic,strong)UIImageView* imageView;

@end

@implementation JSGuideCollectionViewCell


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

@end
