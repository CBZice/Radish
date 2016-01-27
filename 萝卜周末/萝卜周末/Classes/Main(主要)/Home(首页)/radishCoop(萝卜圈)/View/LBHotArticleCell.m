//
//  LBItemChartCell.m
//  萝卜周末
//
//  Created by Apple－13 on 16/1/20.
//  Copyright (c) 2016年 com.mall. All rights reserved.
//

#import "LBHotArticleCell.h"
#import "UIImageView+LBCreateCircleImgView.h"

#define ItemNameFont        [UIFont systemFontOfSize:18]
#define DetailtextFont      [UIFont systemFontOfSize:15]
#define UserNameFont      [UIFont systemFontOfSize:12]
#define TimeFont            [UIFont systemFontOfSize:12]

#define LeftViewWidth       LBScreenWidth * 0.2

@interface LBHotArticleCell()


/** 用于展示用户的一些信息 */
@property (nonatomic, strong) UIView *leftView;
/** 用于展示图片等信息 */
@property (nonatomic, strong) UIImageView *mainImgView;
/** 设置组名与简介 */
@property (nonatomic, strong) UILabel *itemNameLabel;
/** 设置user昵称 */
@property (nonatomic, strong) UILabel *nameLabel;
/** 设置头像 */
@property (nonatomic, strong) UIImageView *iconView;
/** 设置发表的图片 */
@property (nonatomic, strong) UIImageView *pictureView;

/** 显示发布的时间 */
@property (nonatomic, strong) UILabel *timeLabel;


/** 设置垂直的线 */
@property (nonatomic, strong) UIImageView *ballImgView;
@property (nonatomic, strong) UIView *uplineView;
@property (nonatomic, strong) UIView *downlineView;

@end

@implementation LBHotArticleCell

#pragma mark ---- 懒加载
-(UIImageView *)mainImgView
{
    if (!_mainImgView) {
        _mainImgView = [[UIImageView alloc] init];
    }
    return _mainImgView;
}
-(UILabel *)itemNameLabel
{
    if (!_itemNameLabel) {
        _itemNameLabel = [[UILabel alloc] init];
    }
    return _itemNameLabel;
}
-(UILabel *)nameLabel
{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.textAlignment = NSTextAlignmentCenter;
        _nameLabel.font = UserNameFont;
        _nameLabel.numberOfLines = 0;
    }
    return _nameLabel;
}
-(UIImageView *)pictureView
{
    if (!_pictureView) {
        _pictureView = [[UIImageView alloc] init];
    }
    return _pictureView;
}
-(UILabel *)timeLabel
{
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.font = TimeFont;
        _timeLabel.textAlignment = NSTextAlignmentRight;
    }
    return _timeLabel;
}

-(UIView *)leftView
{
    if (!_leftView) {
        _leftView = [[UIView alloc] init];
    }
    return _leftView;
}


-(UIImageView *)iconView
{
    if (!_iconView) {
        _iconView = [[UIImageView alloc] init];
    }
    return _iconView;
}

-(UIImageView *)ballImgView
{
    if (!_ballImgView) {
        _ballImgView = [[UIImageView alloc] init];
        _ballImgView.image = [UIImage imageNamed:@"xiaoqiu"];
    }
    return _ballImgView;
}
-(UIView *)uplineView
{
    if (!_uplineView) {
        _uplineView = [[UIView alloc] init];
        _uplineView.backgroundColor = GrayLineColor;
        _uplineView.width = 1.5;
    }
    return _uplineView;
}
-(UIView *)downlineView
{
    if (!_downlineView) {
        _downlineView = [[UIView alloc] init];
        _downlineView.backgroundColor = GrayLineColor;
        _downlineView.width = 1.5;
    }
    return _downlineView;
}


+(instancetype)dequenCellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"cell";
    LBHotArticleCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[LBHotArticleCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
//        cell.backgroundColor = LBRandomColor;
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

/** 调用系统的方法，加载视图 */
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self addSubview:self.mainImgView];
        
        [_mainImgView addSubview:self.pictureView];
        
        [_mainImgView addSubview:self.itemNameLabel];
        
        [_mainImgView addSubview:self.timeLabel];
        
        [self addSubview:self.leftView];
        
        [_leftView addSubview:self.nameLabel];
        [_leftView addSubview:self.iconView];
        
        [self addSubview:self.ballImgView];
        
        [self addSubview:self.uplineView];
        
        [self addSubview:self.downlineView];
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    
    NSString *str = @"   [女生部落]";
/** 拼凑字符串 */
    NSMutableAttributedString *attributedItemStr = [[NSMutableAttributedString alloc] initWithString:str attributes:@{NSFontAttributeName : ItemNameFont}];
    
    NSMutableAttributedString *attributedDetailStr = [[NSMutableAttributedString alloc] initWithString:@"  就别重逢，美美哒" attributes:@{NSFontAttributeName : DetailtextFont}];
    [attributedItemStr appendAttributedString:attributedDetailStr];
    
    _itemNameLabel.attributedText = attributedItemStr;
    
/** 设置名称的frame */
    _itemNameLabel.y = 10;
    _itemNameLabel.width = LBScreenWidth * 0.8;
    _itemNameLabel.height = [str sizeWithFont:ItemNameFont].height;
    
/** 设置picture的frame */
    _pictureView.width = (LBScreenWidth * 0.8 - 20 * 2);
    _pictureView.height = _pictureView.width * 0.618;
    _pictureView.x = 20;
    _pictureView.y = CGRectGetMaxY(_itemNameLabel.frame) + 2;
    _pictureView.backgroundColor = [UIColor orangeColor];

    
/** 设置picture的frame */
    _timeLabel.width = _pictureView.width;
    _timeLabel.x = _pictureView.x;
    _timeLabel.y = CGRectGetMaxY(_pictureView.frame) + 2;
    _timeLabel.height = [str sizeWithFont:TimeFont].height;
    _timeLabel.text = @"12:09";
    
/** 设置mainView的frame */
    _mainImgView.x = LBScreenWidth * 0.2;
    _mainImgView.width = LBScreenWidth * 0.8;
    _mainImgView.height = CGRectGetMaxY(_timeLabel.frame) + 10;
    _mainImgView.y = 5;
    
    
/** 设置左视图的frame */
    _leftView.width = LeftViewWidth;
    _leftView.height = self.height;
    
    
/** 设置头像的frame */
    _iconView.width = _iconView.height = 54;
    _iconView.centerX = _leftView.width / 2.0;
    _iconView.layer.cornerRadius = _iconView.width / 2.0;
    _iconView.layer.masksToBounds = YES;
    
    _iconView.image = [UIImage imageNamed:@"23233.jpg"];
    _iconView.y = 5;
    
/** 设置userName的frame */
    _nameLabel.text = @"康侃爱美食呵呵呵";
    _nameLabel.width = _leftView.width;
    _nameLabel.height = 50;
    _nameLabel.y = CGRectGetMaxY(_iconView.frame);
    
    
/** 设置小球的位置 */                
    _ballImgView.width = _ballImgView.height = 10;
    _ballImgView.centerX = LeftViewWidth;
    LBLog(@"%f", _itemNameLabel.centerY);
    _ballImgView.centerY = _itemNameLabel.centerY + 5;
    
/** 设置线的位置 */
    _uplineView.x = _downlineView.x = LeftViewWidth;
    _uplineView.y = 0;
    LBLog(@"%f", _ballImgView.y);
    if (self.showUplineHidden) {
        _uplineView.height = 0;
    }else{
        _uplineView.height = _ballImgView.y;
    }
    
    
    _downlineView.y = CGRectGetMaxY(_ballImgView.frame);
    _downlineView.height = self.height - CGRectGetMaxY(_ballImgView.frame);
}
@end
