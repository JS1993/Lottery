//
//  JSHtmlJasonParser.m
//  网易彩票
//
//  Created by  江苏 on 16/5/3.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "JSHtmlJsonParser.h"
#import "JSHtmlModel.h"
@implementation JSHtmlJsonParser

+(NSArray*)htmlParser{
    NSString* path=[[NSBundle mainBundle]pathForResource:@"help" ofType:@"json"];
    
    NSData* data=[NSData dataWithContentsOfFile:path];
    
    NSArray* arr=[NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    
    NSMutableArray* htmls=[NSMutableArray array];
    
    for (NSDictionary* dict in arr) {
        JSHtmlModel* html=[[JSHtmlModel alloc]init];
        
        html.title=dict[@"title"];
        html.html=dict[@"html"];
        html.ID=dict[@"id"];
        
        [htmls addObject:html];
    }
    
    return htmls;
}

@end
