//
//  JSHelpWebViewController.m
//  网易彩票
//
//  Created by  江苏 on 16/5/3.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "JSHelpWebViewController.h"

@interface JSHelpWebViewController ()

@end

@implementation JSHelpWebViewController

-(void)loadView{
    
    self.view=[[UIWebView alloc]initWithFrame:ScreenBounds];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStyleBordered target:self action:@selector(back)];
    
}


-(void)back{
    [self dismissViewControllerAnimated:YES completion:nil];
}



@end
