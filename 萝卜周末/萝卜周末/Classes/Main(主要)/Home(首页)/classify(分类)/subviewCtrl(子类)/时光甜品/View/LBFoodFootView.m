//
//  LBFoodFootView.m
//  时光甜品
//
//  Created by Apple－13 on 16/1/21.
//  Copyright (c) 2016年 Apple－13. All rights reserved.
//

#import "LBFoodFootView.h"
#import "StarView.h"

#define ShopNameFont            [UIFont systemFontOfSize:16]
#define FoodCostFont            [UIFont systemFontOfSize:14]
#define ShopAddressFont         [UIFont systemFontOfSize:14]
#define OtherMessagefont        [UIFont systemFontOfSize:13]
#define Spacing                 10



@interface LBFoodFootView()

/** 设置商店视图 */
@property (nonatomic, strong) UIView *foodShopView;
/** 设置商店食品滑动视图 */
@property (nonatomic, strong) UIScrollView *foodScrollView;
/** 设置商店名称Label */
@property (nonatomic, strong) UILabel *shopNamelbl;
/** 设置商店食品评价视图 */
@property (nonatomic, strong) StarView *starView;
/** 设置平均消费 */
@property (nonatomic, strong) UILabel *aveCostlbl;
/** 设置商店地址 */
@property (nonatomic, strong) UIButton *shopAddressBtn;
@property (nonatomic, strong) UILabel *shopAddresslbl;
/** 设置商店联系方式 */
@property (nonatomic, strong) UIButton *shopPhoneBtn;
/** 设置商店优惠活动 */
@property (nonatomic, strong) UILabel *moreMessagelbl;
/** 添加收藏 */
@property (nonatomic, strong) UIButton *collectBtn;

@end


@implementation LBFoodFootView

#pragma mark ----  懒加载
-(UIView *)foodShopView
{
    if (!_foodShopView) {
        _foodShopView = [[UIView alloc] init];
    }
    return _foodShopView;
}
-(UIScrollView *)foodScrollView
{
    if (!_foodScrollView) {
        _foodScrollView = [[UIScrollView alloc] init];
    }
    return _foodScrollView;
}
-(UILabel *)shopNamelbl
{
    if (!_shopNamelbl) {
        _shopNamelbl = [[UILabel alloc] init];
        _shopNamelbl.font = ShopNameFont;
        _shopNamelbl.textAlignment = NSTextAlignmentLeft;
//        _shopNamelbl.backgroundColor = [UIColor orangeColor];
    }
    return _shopNamelbl;
}
-(UILabel *)aveCostlbl
{
    if (!_aveCostlbl) {
        _aveCostlbl = [[UILabel alloc] init];
        _aveCostlbl.font = FoodCostFont;
        _aveCostlbl.textAlignment = NSTextAlignmentLeft;
    }
    return _aveCostlbl;
}
-(UILabel *)moreMessagelbl
{
    if (!_moreMessagelbl) {
        _moreMessagelbl = [[UILabel alloc] init];
        _moreMessagelbl.textAlignment = NSTextAlignmentLeft;
        _moreMessagelbl.font = OtherMessagefont;
        _moreMessagelbl.numberOfLines = 0;
    }
    return _moreMessagelbl;
}
-(UILabel *)shopAddresslbl
{
    if (!_shopAddresslbl) {
        _shopAddresslbl = [[UILabel alloc] init];
        _shopAddresslbl.textAlignment = NSTextAlignmentLeft;
        _shopAddresslbl.font = ShopAddressFont;
    }
    return _shopAddresslbl;
}
-(StarView *)starView
{
    if (!_starView) {
        _starView = [[StarView alloc] init];
    }
    return _starView;
}
-(UIButton *)shopAddressBtn
{
    if (!_shopAddressBtn) {
        _shopAddressBtn = [[UIButton alloc] init];
    }return _shopAddressBtn;
}
-(UIButton *)shopPhoneBtn
{
    if (!_shopPhoneBtn) {
        _shopPhoneBtn = [[UIButton alloc] init];
    }
    return _shopPhoneBtn;
}
-(UIButton *)collectBtn
{
    if (!_collectBtn) {
        _collectBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [_collectBtn addTarget:self action:@selector(collectionBntClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _collectBtn;
}

- (void)collectionBntClick
{
    LBLog(@"collectionBntClick");
}

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.foodShopView];
        
        [_foodShopView addSubview:self.foodScrollView];
        [_foodShopView addSubview:self.shopNamelbl];
        [_foodShopView addSubview:self.starView];
        [_foodShopView addSubview:self.aveCostlbl];
        [_foodShopView addSubview:self.shopAddresslbl];
        [_foodShopView addSubview:self.shopAddressBtn];
        [_foodShopView addSubview:self.shopPhoneBtn];
        [_foodShopView addSubview:self.moreMessagelbl];
        [_foodShopView addSubview:self.collectBtn];
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
/** 设置商店食品滑动视图frame */
    _foodScrollView.width = LBScreenWidth;
    _foodScrollView.height = LBScreenWidth * 0.63;
    _foodScrollView.backgroundColor = [UIColor greenColor];
    
/** 设置商店名称Labelframe */
    _shopNamelbl.width = LBScreenWidth;
    _shopNamelbl.height = 30;
    _shopNamelbl.x = Spacing;
    _shopNamelbl.y = CGRectGetMaxY(_foodScrollView.frame) + Spacing;
    _shopNamelbl.text = @"呵呵";
    
/** 设置商店食品评价视图frame */
    _starView.width = 200;
    _starView.height = 20;
    _starView.x = _shopNamelbl.x;
    _starView.y = CGRectGetMaxY(_shopNamelbl.frame);
    _starView.score = Spacing;
    
/** 设置平均消费frame */
    _aveCostlbl.width = 150;
    _aveCostlbl.height = 20;
    _aveCostlbl.centerY = _starView.centerY;
    _aveCostlbl.x = 200;
    _aveCostlbl.text = @"消费";

/** 设置商店地址frame */
    _shopAddressBtn.x = Spacing;
    _shopAddressBtn.y = CGRectGetMaxY(_starView.frame);
    _shopAddressBtn.width = _shopAddressBtn.height = 20;
//    _shopAddressBtn.backgroundColor = [UIColor redColor];
    
    _shopAddresslbl.x = 30;
    _shopAddresslbl.centerY = _shopAddressBtn.centerY;
    _shopAddresslbl.height = 30;
    _shopAddresslbl.width = LBScreenWidth - 100;
    _shopAddresslbl.text = @"呵呵呵呵呵呵";

/** 设置商店联系方式frame */
    _shopPhoneBtn.x = LBScreenWidth - 60;
    _shopPhoneBtn.centerY = _shopAddressBtn.centerY;
    _shopPhoneBtn.height = 30;
    _shopPhoneBtn.width = 60;

/** 设置商店优惠活动frame */
    _moreMessagelbl.width = 200;
    _moreMessagelbl.height = 50;
    _moreMessagelbl.x = Spacing;
    _moreMessagelbl.y = CGRectGetMaxY(_shopPhoneBtn.frame);
    _moreMessagelbl.text = [NSString stringWithFormat:@"听说你很嚣张\n呵呵嗒"];

/** 添加收藏frame */
    _collectBtn.width = 90;
    _collectBtn.height = 30;
    _collectBtn.x = LBScreenWidth - 110;
    _collectBtn.y = _moreMessagelbl.y + 10;
    _collectBtn.layer.cornerRadius = 5.0;
    _collectBtn.layer.masksToBounds = YES;
    _collectBtn.backgroundColor = [UIColor orangeColor];
    [_collectBtn setTitle:@"收藏" forState:UIControlStateNormal];
    

/** 设置商店视图frame*/
    _foodShopView.width = LBScreenWidth;
    _foodShopView.height = CGRectGetMaxY(_shopPhoneBtn.frame) + 50;
    _foodShopView.backgroundColor = [UIColor whiteColor];
}




@end
