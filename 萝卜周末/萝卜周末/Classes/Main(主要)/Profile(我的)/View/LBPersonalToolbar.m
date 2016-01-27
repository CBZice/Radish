//
//  LBPersonalToolbar.m
//  萝卜周末
//
//  Created by Apple－13 on 16/1/19.
//  Copyright (c) 2016年 com.mall. All rights reserved.
//

#import "LBPersonalToolbar.h"

@implementation LBPersonalToolbar

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self addBtnWithName:@"活动" CountName:@"1" btnType:ICEToolBarButtonTypeIntroduce];
        [self addBtnWithName:@"关注" CountName:@"268" btnType:ICEToolBarButtonTypeComment];
        [self addBtnWithName:@"粉丝"  CountName:@"679" btnType:ICEToolBarButtonTypeNone];
    }
    return self;
}

/** 设置btn样式 */
- (void)addBtnWithName:(NSString *)name CountName:(NSString *)count btnType:(ICEToolBarButtonType)btnType
{
    UIButton *btn = [[UIButton alloc] init];
    NSString *str = [NSString stringWithFormat:@"%@\n%@", count,name];
    
    btn.titleLabel.textAlignment = NSTextAlignmentCenter;
    btn.titleLabel.numberOfLines = 0;
    [btn setTitle:str forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    btn.tag = btnType;
    
    [self addSubview:btn];
}

- (void)btnClick:(UIButton *)btn
{
    NSLog(@"%ld",btn.tag);
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
