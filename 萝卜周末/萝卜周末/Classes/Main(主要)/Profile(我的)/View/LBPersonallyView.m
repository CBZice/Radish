//
//  LBPersonallyView.m
//  萝卜周末
//
//  Created by Apple－13 on 16/1/19.
//  Copyright (c) 2016年 com.mall. All rights reserved.
//

#import "LBPersonallyView.h"
#import "LBPersonalToolbar.h"

#import "LBIconView.h"

/** 工具栏高度 */
#define ToolBarHeight  60

@interface LBPersonallyView ()

@property (nonatomic, strong) LBIconView *iconView;
@property (nonatomic, strong) LBPersonalToolbar *toolBar;

@end

@implementation LBPersonallyView


-(LBIconView *)iconView
{
    if (!_iconView) {
        _iconView = [[LBIconView alloc] init];
    }
    return _iconView;
}
-(LBPersonalToolbar *)toolBar
{
    if (!_toolBar) {
        _toolBar = [[LBPersonalToolbar alloc] init];
    }
    return _toolBar;
}

/** 初始化模型 */
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.iconView];
        [self addSubview:self.toolBar];
    }
    return self;
}

/** 为头像和工具栏赋值 */
- (void)layoutSubviews
{
    [super layoutSubviews];
    _iconView.frame = CGRectMake(0, 0, self.width, self.height - ToolBarHeight);
    _toolBar.frame = CGRectMake(0, self.height - ToolBarHeight, LBScreenWidth, ToolBarHeight);
}

@end
