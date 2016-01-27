//
//  LBMaskingView.m
//  萝卜周末
//
//  Created by Apple_16 on 16/1/20.
//  Copyright (c) 2016年 com.mall. All rights reserved.
//

#import "LBMaskingView.h"

@implementation LBMaskingView
// 添加蒙板
+ (instancetype)addCoverWithColor:(UIColor *)color showView:(UIView *)setview backImg:(NSString *)backimg fromAction:(UIView *)action
{
    // 7. 得到传入控件的frame
    CGRect frame = setview.frame;
    
    //    // 重新设置传入控件的坐标系
    //    CGRect frame = [action convertRect:action.frame toView:nil];
    //    setview.frame = [setview convertRect:setview.frame toView:nil];
    
    
    // 1. 创建一个view -- 用来当做蒙板
    LBMaskingView *view = [[LBMaskingView alloc] init];
    
    // 2. 创建一个图片框 -- 用来存放背景图
    UIImageView *imageView = [[UIImageView alloc] init];
    
    // 3. 得到图片
    UIImage *image = [UIImage imageNamed:backimg];
    
    // 4. 让图片可以拉伸
    image = [image stretchableImageWithLeftCapWidth:0 topCapHeight:image.size.height * 0.5];
    
    // 把图片添加到图片框上
    imageView.image = image;
    
    // 6. 让图片框可以和用户交互
    imageView.userInteractionEnabled = YES;
    
    
    
    if (frame.size.width > image.size.width - 2 * 10) {
        frame.size.width = image.size.width - 2 * 10;
    }
    setview.x = 10;
    setview.y = 15;
    setview.width = frame.size.width;
    setview.height = frame.size.height;
    [imageView addSubview:setview];
    
    CGFloat X = action.frame.size.width/2 + action.frame.origin.x - setview.width/2 - 10;
    CGFloat Y = CGRectGetMaxY(action.frame) + 15;
    CGFloat WIDTH = setview.width + 20;
    CGFloat HEIGHT = setview.height + 25;
    
    // 判断是否达到边缘
    if (X < 10) {
        X = 10;
    }else if (X + WIDTH > LBScreenWidth) {
        X = LBScreenWidth - WIDTH - 10;
    }
    
    imageView.frame = CGRectMake(X, Y, WIDTH, HEIGHT);
    
    // 9. 把图片框添加到蒙板上
    [view addSubview:imageView];
    
    // 4. 设置蒙板的背景色
    view.backgroundColor = color;
    
    // 6. 返回这个view
    return view;
}

// 显示蒙板
- (void)show
{
    if ([self.delegate respondsToSelector:@selector(createMaskingView:)]) {
        [self.delegate createMaskingView:self];
    }
    // 2. 得到窗口
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    
    // 3. 设置view的frame值
    self.frame = window.bounds;
    
    // 5. 把view添加到window上盖住整个屏幕
    [window addSubview:self];
}

// 取消蒙板
- (void)dismiss
{
    if ([self.delegate respondsToSelector:@selector(createMaskingView:)]) {
        [self.delegate createMaskingView:self];
    }
    [self removeFromSuperview];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    
    [self dismiss];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
