//
//  JSActivityView.h
//  网易彩票
//
//  Created by  江苏 on 16/4/27.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JSActivityView;

@protocol JSActivityViewDelegate <NSObject>
@optional

-(void)activityViewDidClickedHiddenButton:(JSActivityView*)activityView;

@end

@interface JSActivityView : UIView

@property(nonatomic,weak)id<JSActivityViewDelegate> delegate;


+(instancetype)show;

-(void)hide;

+(instancetype)activityView;

@end
