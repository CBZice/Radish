//
//  LBShoppingToRightCell.h
//  萝卜周末
//
//  Created by Apple_16 on 16/1/22.
//  Copyright (c) 2016年 com.mall. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LBShoppingToRightCell : UITableViewCell
/**  购物优惠信息详情 UILabel*/
@property (nonatomic,strong)UILabel *detailsLabel;
/**  顶部的线 UIView*/
@property (nonatomic,strong)UIView *topLine;
/**  中间的圆圈 UIView*/
@property (nonatomic,strong)UIView *circleView;
/**  中间的线 UIView*/
@property (nonatomic,strong)UIView *middleLine;
/**  底部的线 UIView*/
@property (nonatomic,strong)UIView *buttomLine;
/**  商品的图片 UIImageView*/
@property (nonatomic,strong)UIImageView *pictureImageView;
/**  距离的uimageView UIImageView*/
@property (nonatomic,strong)UIImageView *addressImageView;
/**  距离的label label*/
@property (nonatomic,strong)UILabel *addressLabel;
/**  商品专区的label label*/
@property (nonatomic,strong)UILabel *goodsNameLabel;
/**  是否显示顶部的线 BOOL*/
@property (nonatomic,assign,getter=isShowTopLine)BOOL showTopLine;
+(instancetype)cellWithTableView:(UITableView *)tableView;
@end
