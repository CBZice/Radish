//
//  LBSetupTableViewCell.m
//  萝卜周末
//
//  Created by Apple－13 on 16/1/19.
//  Copyright (c) 2016年 com.mall. All rights reserved.
//

#import "LBSetupTableViewCell.h"

#define TextFont        [UIFont systemFontOfSize:18]
#define DetailtextFont   [UIFont systemFontOfSize:15]

@interface LBSetupTableViewCell()
@property (nonatomic, strong) UISwitch *switchView;
@property (nonatomic, strong) UIImageView *boardCircleView;


@end

@implementation LBSetupTableViewCell

#pragma mark -----  懒加载
-(UIImageView *)imgView
{
    if (!_imgView) {
        _imgView = [[UIImageView alloc] init];
//        _imgView=self.imgView;
    }
    return _imgView;
}

-(UILabel *)textlbl
{
    if (!_textlbl) {
        _textlbl = [[UILabel alloc] init];
        _textlbl.textColor = [UIColor darkGrayColor];
        _textlbl.font = TextFont;
    }
    return _textlbl;
}
-(UILabel *)detaillbl
{
    if (!_detaillbl) {
        _detaillbl = [[UILabel alloc] init];
        _detaillbl.textColor = [UIColor lightGrayColor];
        _detaillbl.font = DetailtextFont;
    }
    return _detaillbl;
}

-(UISwitch *)switchView
{
    if (!_switchView) {
        _switchView = [[UISwitch alloc] init];
        _switchView.tintColor = [UIColor greenColor];
        _switchView.on = NO;
        _switchView.hidden = YES;
    }
    return _switchView;
}

-(UIImageView *)boardCircleView
{
    if (!_boardCircleView) {
        _boardCircleView = [[UIImageView alloc] init];
    }
    return _boardCircleView;
}


+(instancetype)dequenCellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"cell";
    LBSetupTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[LBSetupTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

/** 调用系统的方法，加载视图 */
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self addSubview:self.boardCircleView];
        
        [self addSubview:self.imgView];
        [self addSubview:self.textlbl];
        
        [self addSubview:self.detaillbl];

        [self addSubview:self.switchView];
        
        [self addline];
    }
    return self;
}

- (void)addline{
    _lineView = [[UIView alloc] init];
    _lineView.backgroundColor = GrayLineColor;
    [self addSubview:_lineView];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    CGSize textSize = [_textlbl.text sizeWithFont:_textlbl.font];
    CGSize detailSize = [_detaillbl.text sizeWithFont:_detaillbl.font];
    
    CGFloat height = self.height;
    
    CGFloat textY = self.textlbl.y;
    CGFloat detailY = self.detaillbl.y;

    if (textY == 0) {
        textY = height * 0.15;
    }
    if (detailY == 0){
        detailY = height * 0.6;
    }
    
    LBLog(@"%ld", _imgView.subviews.count);
    
    
    /** 设置各个控件的尺寸 */
    if (_imgView.image) {
        _imgView.frame = CGRectMake(25, height * 0.15, height * 0.7, height * 0.7);
        _imgView.hidden = NO;
    }else{
        LBLog(@"%@", _imgView.subviews);
        if (_imgView.subviews.count) {
            _imgView.frame = CGRectMake(25, height * 0.15, height * 0.7, height * 0.7);
            _imgView.hidden = NO;
            UIView *view = [_imgView.subviews lastObject];
            view.x = view.y = (_imgView.height - view.height)/2.0;
        }else{
            _imgView.frame = CGRectMake(0, 0, 0, 0);
            _imgView.hidden = YES;
        }
    }
    if (_detaillbl.text.length == 0) {
        _textlbl.frame = CGRectMake(CGRectGetMaxX(_imgView.frame) + 13, 0, textSize.width, height);
        _detaillbl.hidden = YES;
    }else{
        _textlbl.frame = CGRectMake(CGRectGetMaxX(_imgView.frame) + 13, textY, textSize.width, textSize.height);
        
        _detaillbl.frame = CGRectMake(CGRectGetMaxX(_imgView.frame) + 13, detailY, detailSize.width, detailSize.height);
        _detaillbl.hidden = NO;
    }
    if (self.accesstype == LBSetupTableViewCellAccessoryArrow) {
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        _switchView.hidden = YES;
    }else if (self.accesstype == LBSetupTableViewCellAccessoryPicker){
        _switchView.hidden = NO;
        _switchView.frame = CGRectMake(LBScreenWidth - 25 - 50, (height - 33)/2.0, 50, 33);
    }else{
        self.accessoryType = UITableViewCellAccessoryNone;
        _switchView.hidden = YES;
    }
    _lineView.frame = CGRectMake(0, height - 1.2, LBScreenWidth, 1.2);
    
    if (_circleImgView) {
        _imgView.layer.cornerRadius = _imgView.width / 2.0;
        _imgView.layer.masksToBounds = YES;
    }
    if (_circleHaveBoard) {
        _boardCircleView.backgroundColor = _circleBoardColor;
        
        _boardCircleView.frame = CGRectMake(25 - _circleBoardWidth, height * 0.15 - _circleBoardWidth, 0, 0);
        _boardCircleView.height = _boardCircleView.width = _imgView.width + 2 * _circleBoardWidth;
        _boardCircleView.layer.cornerRadius = _boardCircleView.height / 2.0;
        _boardCircleView.layer.masksToBounds = YES;
    }
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
