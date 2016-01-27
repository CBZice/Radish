//
//  LBChoiceFoodCollectionViewCell.h
//  萝卜周末
//
//  Created by dp on 16/1/21.
//  Copyright (c) 2016年 com.mall. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LBChoiceFoodCollectionViewCell : UICollectionViewCell
/**   美食的图片*/
@property (nonatomic,strong) UIImageView *imageView;
/**   美食的工具视图 */
@property (nonatomic,strong) UIView *toolView;
/**  美食的名称*/
@property (nonatomic,strong) UILabel *foodNameLabel;
/**  收藏按钮*/
@property (nonatomic,strong) UIButton *collectionButton;
/**  关注按钮*/
@property (nonatomic,strong) UIButton *attentionButton;
@end
