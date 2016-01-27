//
//  LBIconImageView.m
//  萝卜周末
//
//  Created by Apple_16 on 16/1/20.
//  Copyright (c) 2016年 com.mall. All rights reserved.
//

#import "LBIconImageView.h"
#import "LBUser.h"
#define cellForiconWH 40           // 单元格中的头像图片框的宽度和高度
@interface LBIconImageView ()
//头像的UIImageView
@property (nonatomic, weak) UIImageView *imageView;

@end
@implementation LBIconImageView
// 重写创建该图片框的init方法
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        // 头像图片框
        UIImageView *imageView = [[UIImageView alloc] init];
        [self addSubview:imageView];
        self.imageView = imageView;
        self.imageView.layer.cornerRadius = cellForiconWH / 2;
        self.imageView.layer.masksToBounds = YES;
        
    }
    
    return self;
}

- (void)layoutSubviews
{
    
    [super layoutSubviews];
    self.imageView.frame = self.bounds;
}

// 重写user属性的set方法
- (void)setUser:(LBUser *)user
{
    _user = user;
    
    // 根据传入的用户信息模型下载图片
    [self.imageView setImage:[UIImage imageNamed:user.iconName]];
    
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
