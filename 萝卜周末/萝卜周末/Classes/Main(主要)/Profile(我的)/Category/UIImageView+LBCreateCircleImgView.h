//
//  UIImageView+LBCreateCircleImgView.h
//  萝卜周末
//
//  Created by Apple－13 on 16/1/20.
//  Copyright (c) 2016年 com.mall. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (LBCreateCircleImgView)
+ (void)createCircleImgView:(UIImageView *)imgView imageName:(NSString *)imgName boardWidth:(CGFloat)boardWidth;

+ (instancetype)createCircleImgViewWithimageName:(NSString *)imgName boardWidth:(CGFloat)boardWidth circleRadius:(float)radios boardColor:(UIColor *)color;

@end
