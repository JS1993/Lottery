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
    
    UIImageView* guideLine=[[UIImageView alloc]initWithFrame:CGRectMake(-20, 0, guiLineImage.size.width, guiLineImage.size.height)];
    
    guideLine.image=guiLineImage;
    
    [self.collectionView addSubview:guideLine];

}

-(void)setUpImageView{
    
    
    
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
