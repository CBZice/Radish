//
//  LBRadishCoopToolbarView.m
//  萝卜周末
//
//  Created by Apple－13 on 16/1/20.
//  Copyright (c) 2016年 com.mall. All rights reserved.
//

#import "LBRadishCoopToolbarView.h"

@interface LBRadishCoopToolbarView()

@property (nonatomic, strong) UIButton *selectedBtn;

@end

@implementation LBRadishCoopToolbarView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self addBtnWithName:@"圈内热帖" btnType:LBRadishCoopToolbarButtonTypeHotArti];
        [self addBtnWithName:@"圈子排行" btnType:LBRadishCoopToolbarButtonTypeItemChart];
        [self addBtnWithName:@"我的圈子" btnType:LBRadishCoopToolbarButtonTypeMineGroup];
    }
    return self;
}

/** 设置btn样式 */
- (void)addBtnWithName:(NSString *)name btnType:(LBRadishCoopToolbarButtonType)btnType
{
    UIButton *btn = [[UIButton alloc] init];
    NSString *str = [NSString stringWithFormat:@"%@",name];
    
    btn.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    [btn setTitle:str forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor orangeColor] forState:UIControlStateDisabled];
    
    
    btn.backgroundColor = [UIColor lightGrayColor];
    
    btn.tag = btnType;
    
    [self addSubview:btn];
}

- (void)btnClick:(UIButton *)btn
{
    btn.enabled = NO;
    _selectedBtn.enabled = YES;
    _selectedBtn = btn;
    LBRadishCoopToolbarButtonType type = (LBRadishCoopToolbarButtonType)btn.tag;
    if ([self.delegate respondsToSelector:@selector(changeTheCtrlWithBtnType:)]) {
        [self.delegate changeTheCtrlWithBtnType:type];
    }
}

/** 在layoutSubviews中设置大小 */
- (void)layoutSubviews
{
    [super layoutSubviews];
    NSInteger count = self.subviews.count;
    CGFloat width = LBScreenWidth / count;
    CGFloat height = self.height;
    for (int i = 0; i < count; i++) {
        UIButton *btn = self.subviews[i];
        btn.x = width * i;
        btn.width = width;
        btn.height = height;
    }
}

@end
