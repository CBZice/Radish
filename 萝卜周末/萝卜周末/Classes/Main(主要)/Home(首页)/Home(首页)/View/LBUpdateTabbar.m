//
//  LBUpdateTabbar.m
//  萝卜周末
//
//  Created by Apple_16 on 16/1/18.
//  Copyright (c) 2016年 com.mall. All rights reserved.
//

#import "LBUpdateTabbar.h"
@interface LBUpdateTabbar()

@property (nonatomic, strong) UIButton *button;

@end
@implementation LBUpdateTabbar

#pragma mark -- 添加按钮的方法一
// 方法一
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
        //  创建一个按钮
        UIButton *button = [[UIButton alloc] init];
        UIImage *image=[UIImage imageNamed:@"jia"];
        image=[image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        //  设置按钮的image图片
        [button setImage:image forState:UIControlStateNormal];
        [button addTarget:self action:@selector(addButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        self.button = button;
//        [self addSubview:self.button];
    }
    return self;
}
// 按钮点击事件
- (void)addButtonClick:(UIButton *)button
{
    if ([self.subdelegate respondsToSelector:@selector(updateTabbarDidClick:)]) {
        [self.subdelegate updateTabbarDidClick:self];
    }
}
#warning 这里可能出现BUG
// 重写系统的方法 -- 此方法是布局子控件的时候调用
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    
    // 2. 设置一个索引来表示每一个控件
    NSInteger index = 0;
    
    // 3. 计算出每个控件的平均宽度
    CGFloat width = self.width/5;
    
    // 4. 遍历子控件数组
    for (UIView *view in self.subviews) {

        // 1. 判断子控件是否是系统私有类UITabBarButton
        Class class = NSClassFromString(@"UITabBarButton");
        // 判断是否是该类
        if ([view isKindOfClass:class]) {
            // 设置该控件的x坐标
            view.x = index * width;
            // 设置该控件的宽度
            view.width = width;
            
            index++;
            if (index == 2) {
                index++;
                
            }
        }
        
    }
    self.button.frame = CGRectMake(width*2, -8, width, self.size.height+8);
    [self addSubview:self.button];
}
@end
