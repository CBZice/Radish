//
//  LBClassifyCollectionViewCell.h
//  萝卜周末
//
//  Created by Apple_16 on 16/1/21.
//  Copyright (c) 2016年 com.mall. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LBClassifyCollectionViewCell;
@protocol LBClassifyCollectionViewCellDelegate <NSObject>
@optional
-(void)classifyCollectionViewCellDidClickedClassTypeButton:(LBClassifyCollectionViewCell *)cell withTag:(NSUInteger)tag;
@end
@interface LBClassifyCollectionViewCell : UICollectionViewCell
/**分类的背景图片*/
@property (nonatomic,copy) NSString *backImageView;
/**分类的按钮*/
@property (nonatomic,strong) UIButton *classTypeButton;
/**分类的类别名*/
@property (nonatomic,strong) UILabel *classTypeNameLabel;
@property (nonatomic,weak) id<LBClassifyCollectionViewCellDelegate> delegate;
@end
