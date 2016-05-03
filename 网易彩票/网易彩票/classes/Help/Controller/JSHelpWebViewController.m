//
//  JSHelpWebViewController.m
//  网易彩票
//
//  Created by  江苏 on 16/5/3.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "JSHelpWebViewController.h"

@interface JSHelpWebViewController ()<UIWebViewDelegate>

@end

@implementation JSHelpWebViewController

-(void)loadView{
    
    self.view=[[UIWebView alloc]initWithFrame:ScreenBounds];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor whiteColor];
    
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStyleBordered target:self action:@selector(back)];
    
    UIWebView* webView=(UIWebView*)self.view;
    
    NSURL* url=[[NSBundle mainBundle] URLForResource:_model.html withExtension:nil];
    
    NSURLRequest* request=[NSURLRequest requestWithURL:url];
    
    [webView loadRequest:request];
    
    webView.delegate=self;
    
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
   
   //让网页停留在需要的位置
    NSString *javaStr = [NSString stringWithFormat:@"window.location.href = '#%@';",_model.ID];
    
    [webView stringByEvaluatingJavaScriptFromString:javaStr];
    
}

-(void)back{
    [self dismissViewControllerAnimated:YES completion:nil];
}



@end
