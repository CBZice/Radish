
//
//  LBOutdoorCollectionViewController.m
//  萝卜周末
//
//  Created by Apple－13 on 16/1/25.
//  Copyright (c) 2016年 com.mall. All rights reserved.
//

#import "LBOutdoorCollectionViewController.h"
#import "LBOutdoorCollectionViewCell.h"

@interface LBOutdoorCollectionViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation LBOutdoorCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];UICollectionViewFlowLayout *collFlow = [[UICollectionViewFlowLayout alloc] init];
    
    /** 初始化CollectionView的属性 */
    //设置横展示
    collFlow.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    _collectionView = [[UICollectionView alloc] initWithFrame:[UIScreen mainScreen].bounds collectionViewLayout:collFlow];
    _collectionView.backgroundColor = [UIColor whiteColor];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.frame = CGRectMake(0, 0, LBScreenWidth, LBScreenHeight / 3);
    
    
    [_collectionView registerClass:[LBOutdoorCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    
    _collectionView.showsHorizontalScrollIndicator = NO;
    
    [self.view addSubview:_collectionView];
}

/** collecionView的组数 */
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
/** collecionView的行数 */
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 50;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LBOutdoorCollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    //自适应
    [cell sizeToFit];
    cell.imgView.image = [UIImage imageNamed:@"4.jpg"];
    cell.label.text = [NSString stringWithFormat:@"cell-%ld",(long)indexPath.row];
    
    NSLog(@"%ld", _collectionView.subviews.count);
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((self.view.frame.size.width - 20) / 2.5, (self.view.frame.size.height)-20);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 5, 5, 5);
}

/** 设置行间距 */
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 10;
}


@end
