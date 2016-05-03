//
//  JSSettingTableViewCell.m
//  网易彩票
//
//  Created by  江苏 on 16/5/3.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "JSSettingTableViewCell.h"
#import "JSArrowSettingItem.h"
#import "JSSwitchSettingItem.h"

@interface JSSettingTableViewCell()

@property (nonatomic, strong) UIImageView *arrowView;

@property (nonatomic, strong) UISwitch *switchView;

@end

@implementation JSSettingTableViewCell

-(UIImageView *)arrowView{
    if (_arrowView==nil) {
        _arrowView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"arrow_right"]];
    }
    return _arrowView;
}

-(UISwitch *)switchView{
    if (_switchView==nil) {
        _switchView=[[UISwitch alloc]init];
    }
    return _switchView;
}

+(instancetype)cellWithTableView:(UITableView*)tableView andTableViewCellStyle:(UITableViewCellStyle)style{
    
    static NSString* indentifier=@"cell";
    
    JSSettingTableViewCell* cell=[tableView dequeueReusableCellWithIdentifier:indentifier];
    
    if (cell==nil) {
        cell=[[JSSettingTableViewCell alloc]initWithStyle:style reuseIdentifier:indentifier];
    }
    
    return cell;
}

-(void)setItem:(JSSettingItem *)item{
    
    _item=item;
    
    [self setUpData];
    
    [self setUpAccessoryView];
    
}

-(void)setUpData{
    self.imageView.image=_item.image;
    self.textLabel.text=_item.title;
    self.detailTextLabel.text=_item.subTitle;
}

-(void)setUpAccessoryView{
    
    if ([_item isKindOfClass:[JSSwitchSettingItem class]]) {
        
        self.accessoryView=self.switchView;
        
    }else if([_item isKindOfClass:[JSArrowSettingItem class]]){
        
        self.accessoryView=self.arrowView;
        
    }else{
        self.accessoryView=nil;
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
