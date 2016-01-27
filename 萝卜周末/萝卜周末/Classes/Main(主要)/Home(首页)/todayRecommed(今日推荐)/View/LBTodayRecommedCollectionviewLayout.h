//
//  LBTodayRecommedCollectionviewLayout.h
//  萝卜周末
//
//  Created by Apple_16 on 16/1/21.
//  Copyright (c) 2016年 com.mall. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LBTodayRecommedCollectionviewLayout : UICollectionViewFlowLayout
//有多少个item
@property (nonatomic, assign) NSUInteger itemCount;
//自定义布局配置数组
@property (nonatomic, strong) NSMutableArray *attributeArray;
@end
