//
//  LBIconView.m
//  萝卜周末
//
//  Created by Apple－13 on 16/1/19.
//  Copyright (c) 2016年 com.mall. All rights reserved.
//

#import "LBIconView.h"
#import "UIImageView+LBCreateCircleImgView.h"

/** 昵称字体 */
#define NameFont        [UIFont systemFontOfSize:20]

/** 个性签名字体 */
#define IntroduceFont   [UIFont systemFontOfSize:10]
@interface LBIconView()

/** 上半部分视图 */
@property (nonatomic, strong) UIView *iconView;
/** 头像视图 */
@property (nonatomic, strong) UIImageView *iconImgView;
/** 姓名 */
@property (nonatomic, strong) UILabel *nameLbl;
/** 个性签名 */
@property (nonatomic, strong) UILabel *introuduceLbl;

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation LBIconView

#pragma mark ----- 懒加载
-(UIView *)iconView
{
    if (!_iconView) {
        _iconView = [[UIView alloc] init];
    }
    return _iconView;
}
-(UIImageView *)iconImgView
{
    if (!_iconImgView) {
        _iconImgView = [[UIImageView alloc] init];
    }
    return _iconImgView;
}
-(UILabel *)nameLbl
{
    if (!_nameLbl) {
        _nameLbl = [[UILabel alloc] init];
        _nameLbl.font = NameFont;
        _introuduceLbl.textAlignment = NSTextAlignmentCenter;
        _nameLbl.textColor = [UIColor whiteColor];
    }
    return _nameLbl;
}
-(UILabel *)introuduceLbl
{
    if (!_introuduceLbl) {
        _introuduceLbl = [[UILabel alloc] init];
        _introuduceLbl.font = IntroduceFont;
        _introuduceLbl.textAlignment = NSTextAlignmentCenter;
        _introuduceLbl.textColor = [UIColor whiteColor];
    }
    return _introuduceLbl;
}

#pragma mark ----- 初始化
//设置头像以及说明文字
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
//        self.backgroundColor = [UIColor orangeColor];
        //设置头像
        [self setupIcon];
        //设置说明文字
        [self setupOntroduceText];
    }
    return self;
}
//设置头像
- (void)setupIcon{
    [self addSubview:self.iconView];
    [self.iconView addSubview:self.iconImgView];

}
//设置说明文字
- (void)setupOntroduceText{
    [self.iconView addSubview:self.nameLbl];
    [self.iconView addSubview:self.introuduceLbl];
}



-(void)layoutSubviews
{
    [super layoutSubviews];
    
/** 设置头像的位置大小 */
    _iconImgView.backgroundColor = [UIColor whiteColor];
    CGFloat imgViewWH = self.width * (18/(18+46.0));
    
    _iconImgView.width = imgViewWH;
    _iconImgView.height = imgViewWH;
    
    _iconImgView.centerX = self.centerX;
    _iconImgView.y = 20;
    
    
    /** 添加圆形头像 */
    [UIImageView createCircleImgView:_iconImgView imageName:@"23233.jpg" boardWidth:2.5];
    
    
/** 设置昵称的位置大小 */
    _nameLbl.text = @"Leslie Ritter";
    

    CGSize nameSize = [_nameLbl.text sizeWithFont:NameFont];
    CGFloat nameW = nameSize.width;
    CGFloat nameH = 20;
    CGFloat nameX = (self.width - nameW)/2;
    CGFloat nameY = CGRectGetMaxY(_iconImgView.frame) + 10;
    _nameLbl.frame = CGRectMake(nameX, nameY, nameW, nameH);
    
    
    
/** 设置签名的位置大小 */
    _introuduceLbl.text = @"I will do my best";

    CGSize introduceSize = [_introuduceLbl.text sizeWithFont:NameFont];
    CGFloat introduceW = introduceSize.width;
    CGFloat introduceH = 10;
    CGFloat introduceX = (self.width - introduceW)/2;
    CGFloat introduceY = CGRectGetMaxY(_nameLbl.frame) + 10;
    _introuduceLbl.frame = CGRectMake(introduceX, introduceY, introduceW, introduceH);
}

/** 添加圆形头像 */


@end
