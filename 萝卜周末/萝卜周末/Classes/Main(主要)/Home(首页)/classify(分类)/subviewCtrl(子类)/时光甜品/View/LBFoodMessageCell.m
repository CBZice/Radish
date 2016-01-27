//
//  LBFoodMessageCell.m
//  萝卜周末
//
//  Created by Apple－13 on 16/1/22.
//  Copyright (c) 2016年 com.mall. All rights reserved.
//

#import "LBFoodMessageCell.h"

#define FoodNameFont            [UIFont systemFontOfSize:14]
#define NowPriceFont            [UIFont systemFontOfSize:14]
#define AgoPriceFont            [UIFont systemFontOfSize:12]
#define PreferentialMessagefont [UIFont systemFontOfSize:13]

#define Spacing                 10;

@interface LBFoodMessageCell()

/** 食物图片 */
@property (nonatomic, strong) UIImageView *foodImgView;
/** 食物名称 */
@property (nonatomic, strong) UILabel *foodNamelbl;
/** 商店优惠 */
@property (nonatomic, strong) UILabel *shopPreferential;

/** 商品价格 */
@property (nonatomic, strong) UILabel *foodPrice;

@end

@implementation LBFoodMessageCell

#pragma mark ---- 懒加载
-(UIImageView *)foodImgView
{
    if (!_foodImgView) {
        _foodImgView = [[UIImageView alloc] init];
        _foodImgView.backgroundColor = [UIColor grayColor];
    }
    return _foodImgView;
}
-(UILabel *)foodNamelbl
{
    if (!_foodNamelbl) {
        _foodNamelbl = [[UILabel alloc] init];
        _foodNamelbl.font = FoodNameFont;
        _foodNamelbl.textColor = [UIColor blackColor];
        _foodNamelbl.textAlignment = NSTextAlignmentLeft;
    }
    return _foodNamelbl;
}
-(UILabel *)shopPreferential
{
    if (!_shopPreferential) {
        _shopPreferential = [[UILabel alloc] init];
        _shopPreferential.font = PreferentialMessagefont;
        _shopPreferential.textColor = [UIColor blackColor];
        _shopPreferential.textAlignment = NSTextAlignmentLeft;
    }
    return _shopPreferential;
}
-(UILabel *)foodPrice
{
    if (!_foodPrice) {
        _foodPrice = [[UILabel alloc] init];
        _foodPrice.font = FoodNameFont;
        _foodPrice.textColor = [UIColor blackColor];
        _foodPrice.textAlignment = NSTextAlignmentLeft;
    }
    return _foodPrice;
}

/*****************    华丽的分割线    *********************/

/** 定义类方法，进行懒加载 */
+(instancetype)dequenCellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"foodMessageCell";
    LBFoodMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[LBFoodMessageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

/** 调用系统的方法，加载视图 */
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addSubview:self.foodImgView];
        [self addSubview:self.foodNamelbl];
        [self addSubview:self.shopPreferential];
        [self addSubview:self.foodPrice];
    }
    return self;
}

/** 设置控件尺寸 */
-(void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat height = self.height;
/** 设置图片的位置 */
    _foodImgView.height = height - 2 * Spacing;
    _foodImgView.width = height / 0.8;
    _foodImgView.x = Spacing;
    _foodImgView.y = Spacing;
    _foodImgView.layer.cornerRadius = 5.0;
    _foodImgView.layer.masksToBounds = YES;
    
/** 设置食物名称的位置 */
    _foodNamelbl.x = CGRectGetMaxX(_foodImgView.frame) + Spacing;
    _foodNamelbl.y = Spacing;
    _foodNamelbl.width = LBScreenWidth - _foodNamelbl.x;
    _foodNamelbl.text = @"宫保鸡丁";
    _foodNamelbl.height = 15;
    
/** 设置优惠信息的位置 */
    _shopPreferential.x = _foodNamelbl.x;
    _shopPreferential.y = CGRectGetMaxY(_foodNamelbl.frame) + 5;
    _shopPreferential.width = LBScreenWidth - _foodNamelbl.x;
    _shopPreferential.text = @"呵呵嗒";
    _shopPreferential.height = 15;
    
/** 设置价格位置 */
    _foodPrice.x = _shopPreferential.x;
    _foodPrice.y = CGRectGetMaxY(_shopPreferential.frame) + 5;
    _foodPrice.width = LBScreenWidth - _shopPreferential.x;
    
    NSString *str = @"💰14";
    /** 拼凑字符串 */
    NSMutableAttributedString *attributedItemStr = [[NSMutableAttributedString alloc] initWithString:str attributes:@{NSFontAttributeName : NowPriceFont,NSForegroundColorAttributeName : [UIColor orangeColor]}];
    
    NSMutableAttributedString *attributedDetailStr = [[NSMutableAttributedString alloc] initWithString:@" 💰18" attributes:@{NSFontAttributeName : AgoPriceFont}];
    [attributedItemStr appendAttributedString:attributedDetailStr];
   
    _foodPrice.attributedText = attributedItemStr;
    
    _foodPrice.height = 20;
    
    LBLog(@"%@", NSStringFromCGRect(_foodPrice.frame));
}


@end
