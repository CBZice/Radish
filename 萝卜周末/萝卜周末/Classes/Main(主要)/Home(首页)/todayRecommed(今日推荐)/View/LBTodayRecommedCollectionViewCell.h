//
//  LBTodayRecommedCollectionViewCell.h
//  萝卜周末
//
//  Created by dp on 16/1/20.
//  Copyright (c) 2016年 com.mall. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LBTodayRecommedCollectionViewCell;
@protocol LBTodayRecommedCollectionViewCellDelegate<NSObject>
@optional
-(void)todayRecommedCollectionViewCellThumbUpButtonDidClicked:(LBTodayRecommedCollectionViewCell *)cell;
-(void)todayRecommedCollectionViewCellDetailsButtonDidClicked:(LBTodayRecommedCollectionViewCell *)cell;
@end
@interface LBTodayRecommedCollectionViewCell : UICollectionViewCell
@property (nonatomic,strong) UIButton *thumbupButton;
@property (nonatomic,strong) UIButton *detailsButton;
@property (nonatomic,weak) id<LBTodayRecommedCollectionViewCellDelegate>delegate;
/**推荐商家的活动图片*/
@property (nonatomic,copy) NSString *backImageView;
/**推荐商家的活动标题*/
@property (nonatomic,strong) UILabel *titleLabel;
/**推荐商家的活动地址*/
@property (nonatomic,strong) UILabel *addressLabel;
/**推荐商家的活动日期*/
@property (nonatomic,strong) UILabel *dateLabel;
@end
