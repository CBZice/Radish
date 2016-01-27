//
//  LBAfternoonTeaCollectionCell.h
//  萝卜周末
//
//  Created by Apple_16 on 16/1/22.
//  Copyright (c) 2016年 com.mall. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LBAfternoonTeaCollectionCell : UICollectionViewCell
/**   下午茶的商品图片   UIImageView*/
@property (nonatomic,strong) UIImageView *imageView;
/**   下午茶的商品商家的地址*/
@property (nonatomic,strong) UILabel *addressLabel;
/**   下午茶商品商家的优惠*/
@property (nonatomic,strong) UILabel *discountLabel;
@end
