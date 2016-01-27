//
//  UIImageView+LBCreateCircleImgView.m
//  萝卜周末
//
//  Created by Apple－13 on 16/1/20.
//  Copyright (c) 2016年 com.mall. All rights reserved.
//

#import "UIImageView+LBCreateCircleImgView.h"

@implementation UIImageView (LBCreateCircleImgView)


/** 使用前,imgView的frame最好已经调整好大小，否则默认设为80 */
+ (void)createCircleImgView:(UIImageView *)imgView imageName:(NSString *)imgName boardWidth:(CGFloat)boardWidth
{
    if (imgView.height == 0) {
        imgView.height = imgView.width = 80;
    }
    UIImage *img = [UIImage imageNamed:imgName];
    
    UIImageView *imgView1 = [[UIImageView alloc] init];
    imgView1.width = imgView.width - boardWidth * 2;
    imgView1.height = imgView.height - boardWidth * 2;
    imgView1.layer.cornerRadius = imgView1.width / 2.0;
    imgView1.layer.masksToBounds = YES;
    imgView1.image = img;
    
    imgView.backgroundColor = [UIColor whiteColor];
    imgView1.layer.cornerRadius = imgView.width / 2.0;
    imgView1.layer.masksToBounds = YES;
    
    imgView.layer.cornerRadius = imgView.width / 2.0;
    imgView.layer.masksToBounds = YES;
    
    imgView1.x = boardWidth;
    imgView1.y = boardWidth;
    
    [imgView addSubview:imgView1];
}
+ (instancetype)createCircleImgViewWithimageName:(NSString *)imgName boardWidth:(CGFloat)boardWidth circleRadius:(float)radios boardColor:(UIColor *)color;
{
    UIImage *img = [UIImage imageNamed:imgName];
    
    UIImageView *imgView1 = [[UIImageView alloc] init];
    UIImageView *imgView = [[UIImageView alloc] init];
    
    imgView.width = imgView.height = radios * 2;
    imgView1.width = imgView1.height = imgView.width - boardWidth * 2;
    imgView1.image = img;
    imgView1.backgroundColor = [UIColor redColor];
    
    imgView1.layer.cornerRadius = imgView.width / 2.0;
    imgView1.layer.masksToBounds = YES;
    
    imgView.layer.cornerRadius = imgView.width / 2.0;
    imgView.layer.masksToBounds = YES;
    imgView.backgroundColor = [UIColor greenColor];
    
    if (color == nil) {
        color = [UIColor whiteColor];
    }
    imgView.backgroundColor = color;
    
    imgView1.x = boardWidth;
    imgView1.y = boardWidth;
    
    [imgView addSubview:imgView1];
    
    return imgView;
}

@end
