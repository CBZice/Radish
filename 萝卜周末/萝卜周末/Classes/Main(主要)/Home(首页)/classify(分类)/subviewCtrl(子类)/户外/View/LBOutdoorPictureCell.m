//
//  LBOutdoorPictureCell.m
//  萝卜周末
//
//  Created by Apple－13 on 16/1/22.
//  Copyright (c) 2016年 com.mall. All rights reserved.
//

#import "LBOutdoorPictureCell.h"
#import "LBOutdoorCollectionViewController.h"

@interface LBOutdoorPictureCell()
@property (nonatomic, strong) UIButton *goodBtn;

@property (nonatomic, strong) LBOutdoorCollectionViewController *outdoorCellCtrl;

@end

@implementation LBOutdoorPictureCell

-(LBOutdoorCollectionViewController *)outdoorCellCtrl
{
    if (!_outdoorCellCtrl) {
        _outdoorCellCtrl = [[LBOutdoorCollectionViewController alloc] init];
    }
    return _outdoorCellCtrl;
}

-(UIButton *)goodBtn
{
    if (!_goodBtn) {
        _goodBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        _goodBtn.layer.borderWidth = 1;
        _goodBtn.layer.borderColor = LBColor(143, 143, 143).CGColor;
        [_goodBtn setTitle:@"精选" forState:UIControlStateNormal];
        [_goodBtn setTitleColor:LBColor(110, 110, 110) forState:UIControlStateNormal];
        _goodBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        [_goodBtn.titleLabel sizeToFit];
        _goodBtn.width = _goodBtn.titleLabel.size.width + 3;
        _goodBtn.height = _goodBtn.titleLabel.size.height + 3;
        _goodBtn.enabled = NO;
    }
    return _goodBtn;
}

-(UILabel *)textLbl
{
    if (!_textLbl) {
        _textLbl = [[UILabel alloc] init];
        _textLbl.font = [UIFont systemFontOfSize:15];
        _textLbl.textAlignment = NSTextAlignmentLeft;
        _textLbl.layoutMargins = UIEdgeInsetsMake(0, 10, 0, 0);
    }
    return _textLbl;
}


+(instancetype)dequenCellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"cell";
    LBOutdoorPictureCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[LBOutdoorPictureCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

/** 调用系统的方法，加载视图 */
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addSubview:self.textLbl];
        
        
        [self addSubview:self.outdoorCellCtrl.view];
        [self addSubview:self.goodBtn];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];

/** 精选的frame */
    _goodBtn.x = 10;
    _goodBtn.centerY = 20;
    
/** 设置文字的frame */
    _textLbl.width = LBScreenWidth;
    _textLbl.height = 40;
    _textLbl.centerY = 20;
    _textLbl.text = @"走出家门，沐浴阳光。";
    _textLbl.x = 40;
    
/** 设置图片播放器的frame */
    _outdoorCellCtrl.view.width = LBScreenWidth;
    _outdoorCellCtrl.view.height = LBScreenHeight / 3;
    _outdoorCellCtrl.view.x = 0;
    _outdoorCellCtrl.view.y = 40;
}

@end
