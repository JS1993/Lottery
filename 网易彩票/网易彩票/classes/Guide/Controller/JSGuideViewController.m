//
//  JSGuideViewController.m
//  网易彩票
//
//  Created by  江苏 on 16/4/28.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "JSGuideViewController.h"
#import "JSGuideCollectionViewCell.h"

@interface JSGuideViewController ()

@property(nonatomic,strong)UIImageView* guideImageView;

@property(nonatomic,strong)UIImageView* guideLargeTextImageView;

@property(nonatomic,strong)UIImageView* guideSmallTextImageView;

@property(nonatomic,assign)CGFloat lastOffset;

@end

@implementation JSGuideViewController


-(instancetype)init{
    
    UICollectionViewFlowLayout* layout=[[UICollectionViewFlowLayout alloc]init];
    
    layout.itemSize=[UIScreen mainScreen].bounds.size;
    
    layout.minimumLineSpacing=0;
    
    layout.minimumInteritemSpacing=0;
    
    layout.scrollDirection=UICollectionViewScrollDirectionHorizontal;
    
    return [super initWithCollectionViewLayout:layout];
}

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.collectionView.showsHorizontalScrollIndicator=NO;
    
    self.collectionView.pagingEnabled=YES;
    
    self.collectionView.bounces=NO;
    
    [self.collectionView registerClass:[JSGuideCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    UIImage* guiLineImage=[UIImage imageNamed:@"guideLine"];
    
    UIImageView* guideLine=[[UIImageView alloc]init];
    
    guideLine.frame=CGRectMake(guideLine.center.x-200, 0, guiLineImage.size.width, guiLineImage.size.height);
    
    guideLine.image=guiLineImage;
    
    [self.collectionView addSubview:guideLine];
    
    [self setUpImageView];

}

-(void)setUpImageView{
    
    self.guideImageView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"guide1"]];
    self.guideImageView.center=CGPointMake(self.view.center.x, self.guideImageView.center.y);
    [self.collectionView addSubview:_guideImageView];
    
    self.guideLargeTextImageView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"guideLargeText1"]];
    self.guideLargeTextImageView.center=CGPointMake(self.view.center.x, self.view.bounds.size.height*0.7);
    [self.collectionView addSubview:self.guideLargeTextImageView];
    
    self.guideSmallTextImageView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"guideSmallText1"]];
    self.guideSmallTextImageView.center=CGPointMake(self.view.center.x, self.view.bounds.size.height*0.8);
    [self.collectionView addSubview:self.guideSmallTextImageView];
    
}


-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    CGFloat currentOffset=scrollView.contentOffset.x;
    
    CGFloat delta=currentOffset-self.lastOffset;
    
    self.guideImageView.center=CGPointMake(self.guideImageView.center.x+2*delta, self.guideImageView.center.y);
    
    self.guideLargeTextImageView.center=CGPointMake(self.guideLargeTextImageView.center.x+2*delta, self.guideLargeTextImageView.center.y);
    
    self.guideSmallTextImageView.center=CGPointMake(self.guideSmallTextImageView.center.x+2*delta, self.guideSmallTextImageView.center.y);
    
    [UIView animateWithDuration:0.5 animations:^{
        self.guideImageView.center=CGPointMake(self.guideImageView.center.x-delta, self.guideImageView.center.y);
        
        self.guideLargeTextImageView.center=CGPointMake(self.guideLargeTextImageView.center.x-delta, self.guideLargeTextImageView.center.y);
        
        self.guideSmallTextImageView.center=CGPointMake(self.guideSmallTextImageView.center.x-delta, self.guideSmallTextImageView.center.y);
    }];
    
    int page=currentOffset/self.view.bounds.size.width+1;
    
    self.guideImageView.image=[UIImage imageNamed:[NSString stringWithFormat:@"guide%d",page]];
    
    self.guideLargeTextImageView.image=[UIImage imageNamed:[NSString stringWithFormat:@"guideLargeText%d",page]];
    
    self.guideSmallTextImageView.image=[UIImage imageNamed:[NSString stringWithFormat:@"guideSmallText%d",page]];
    
    self.lastOffset=currentOffset;
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
//#warning Incomplete implementation, return the number of sections
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of items
    return 4;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    JSGuideCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    UIImage* image=[UIImage imageNamed:[NSString stringWithFormat:@"guide%ldBackground568h",indexPath.item+1]];
    
    cell.image=image;
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
