//
//  JSHelpTableViewController.m
//  网易彩票
//
//  Created by  江苏 on 16/5/3.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "JSHelpTableViewController.h"
#import "JSHtmlJsonParser.h"
#import "JSHtmlModel.h"
#import "JSHelpWebViewController.h"
#import "JSNavigationController.h"

@interface JSHelpTableViewController ()

@property(nonatomic,strong)NSArray* htmls;

@end

@implementation JSHelpTableViewController

-(NSArray *)htmls{
    if (_htmls==nil) {
        _htmls=[JSHtmlJsonParser htmlParser];
    }
    return _htmls;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}


#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.htmls.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString* indentifier=@"cell";
    
    UITableViewCell* cell=[tableView dequeueReusableCellWithIdentifier:indentifier];
    
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:indentifier];
    }
    
    JSHtmlModel* model=self.htmls[indexPath.row];
    
    cell.textLabel.text=model.title;
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
   
    JSHtmlModel* model=self.htmls[indexPath.row];
    
    JSHelpWebViewController* webVC=[[JSHelpWebViewController alloc]init];
    
    webVC.model=model;
    
    webVC.title=model.title;
    
    JSNavigationController* nav=[[JSNavigationController alloc]initWithRootViewController:webVC];
    
    [self.navigationController presentViewController:nav animated:YES completion:nil];
    
}


@end
