//
//  JSLuckyViewController.m
//  网易彩票
//
//  Created by  江苏 on 16/4/27.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "JSLuckyViewController.h"

@interface JSLuckyViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *luckyLight;

@end

@implementation JSLuckyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage* image1=[UIImage imageNamed:@"lucky_entry_light0"];
    UIImage* image2=[UIImage imageNamed:@"lucky_entry_light1"];
    
    self.luckyLight.animationImages=@[image1,image2];
    
    self.luckyLight.animationDuration=1.0;
    
    [self.luckyLight startAnimating];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    
//}


@end
