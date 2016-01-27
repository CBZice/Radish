//
//  LBPictureListView.m
//  萝卜周末
//
//  Created by Apple_16 on 16/1/20.
//  Copyright (c) 2016年 com.mall. All rights reserved.
//

#import "LBPictureListView.h"
#import "LBPictureImageView.h"
#import "LBPicture.h"
#define maxColumn(count) ((count==4)?2:3) // 根据输入的值判断最大列数
#define pictureMargin 10  // 图片间的距离
#define pictureImageViewWH (LBScreenWidth - 2 * 10 - 2 * pictureMargin) / 3
@implementation LBPictureListView
- (instancetype)init
{
    if (self = [super init]) {
        self.backgroundColor = LBColor(201, 201, 201);
        
        
    }
    
    return self;
}

// 重写模型数组的set方法
- (void)setPictures:(NSArray *)pictures
{
    _pictures = pictures;
    
    // 查看父视图中的控件数量是否不小于传入的数组中个数
    while (self.subviews.count < pictures.count) {
        LBPictureImageView *imageView = [[LBPictureImageView alloc] init];
        
        [self addSubview:imageView];
    }
    
    // 当子控件的数量不小于数组个数的时候
    for (NSInteger i = 0; i < self.subviews.count; i++) {
        LBPictureImageView *imgV = self.subviews[i];
        imgV.backgroundColor = [UIColor redColor];
        if (i < pictures.count) {
            // 给每个图片框的属性赋值
            imgV.picture = self.pictures[i];
            // 让图片框显示出来
            imgV.hidden = NO;
        }else {
            // 让多余的图片框隐藏
            imgV.hidden = YES;
        }
    }
}

// 重写控件布局方法
- (void)layoutSubviews
{
    [super layoutSubviews];
    NSInteger count = self.pictures.count;
    NSInteger maxC = maxColumn(count);
    for (NSInteger i = 0; i < count; i++) {
        // 取出每一个图片框
        LBPictureImageView *imageView = self.subviews[i];
        
        CGFloat imageX = i % maxC * (pictureMargin + pictureImageViewWH);
        CGFloat imageY = i / maxC * (pictureImageViewWH + pictureMargin);
        imageView.frame = CGRectMake(imageX, imageY, pictureImageViewWH, pictureImageViewWH);
    }
}

// 根据传入的图片数量和与父控件左边的距离计算Size
+ (CGSize)sizeWithCount:(NSInteger)count leftMargin:(CGFloat)leftMargin
{
    // 得到最大的列数
    NSInteger maxCol = maxColumn(count);
    
    // 计算对应图片数量的父视图的宽度和高度
    NSInteger idxColumn = count > maxCol ? maxCol : count; // 列数索引
    CGFloat width = idxColumn * pictureImageViewWH + (idxColumn - 1) * pictureMargin;
    
    NSInteger idxRow = (count + maxCol - 1) / maxCol;
    CGFloat height = pictureImageViewWH * idxRow + pictureMargin * (idxRow - 1);
    
    
    return CGSizeMake(width, height);
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
