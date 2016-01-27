//
//  LBTodayRecommedCollectionviewLayout.m
//  萝卜周末
//
//  Created by Apple_16 on 16/1/21.
//  Copyright (c) 2016年 com.mall. All rights reserved.
//

#import "LBTodayRecommedCollectionviewLayout.h"

@implementation LBTodayRecommedCollectionviewLayout
- (void)prepareLayout
{
    [super prepareLayout];
    
    // 初始化属性数组
    self.attributeArray = [NSMutableArray array];
    
    // 设置每个item的宽度
    CGFloat width = LBScreenWidth-60;
    // 设置高度
    CGFloat heigth = LBScreenHeight*3/5;
    // 遍历传入的item个数
    for (NSUInteger i = 0; i < self.itemCount; i++) {
        // 设置每一个item的位置等相关属性
        NSIndexPath *index = [NSIndexPath indexPathForItem:i inSection:0];
        
        // 创建一个布局属性类, 通过indexPath来创建
        UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:index];
        
        
        
        // 设置item的位置
        
            attributes.frame = CGRectMake(i * (width+30)+30*(i+1), 0, width, heigth);
        
        
        [self.attributeArray addObject:attributes];
    }
    
    // 设置itemSize来确保滑动的范围的正确
    self.itemSize = CGSizeMake(LBScreenWidth, heigth);
    //self.minimumInteritemSpacing = 100; // 列间距
    self.minimumLineSpacing = 0;  // collectionView的行间距有一个默认值 大概为9到10之间
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    return self.attributeArray;
}
@end
