//
//  LBStatuseFrame.h
//  萝卜周末
//
//  Created by Apple_16 on 16/1/20.
//  Copyright (c) 2016年 com.mall. All rights reserved.
//
#define nameLabelFont [UIFont systemFontOfSize:13]      // 昵称标签的字体大小
#define createatLabelFont [UIFont systemFontOfSize:12]  // 创建时间标签的字体大小
#define contentLabelFont [UIFont systemFontOfSize:13]    // 正文标签的字体大小
#define verticalMargin 5           // 竖直方向上的间距 -- 行间距
#define picturesMargin 5           // 图片集中图片间的间距
#define horizontalMargin 10        // 水平方向上的间距 -- 列间距
#import <Foundation/Foundation.h>
@class LBStatuse;
@interface LBStatuseFrame : NSObject
/**萝卜约动态的数据模型 */
@property (nonatomic,strong)LBStatuse *statuse;
/** 父视图frame -- original */
@property (nonatomic, assign) CGRect originalViewFrame;
/** 头像图片框frame -- icon */
@property (nonatomic, assign) CGRect iconImageViewFrame;
/** 昵称标签frame -- name */
@property (nonatomic, assign) CGRect nameLabelFrame;
/** 微博发布时间标签frame -- time */
@property (nonatomic, assign) CGRect timeLabelFrame;
/** 标题标签frame -- title */
@property (nonatomic, assign) CGRect titleLabelFrame;
/** 正文标签frame -- content */
@property (nonatomic, assign) CGRect contentLabelFrame;
/** 发布的图片的集合 pictures */
@property (nonatomic, assign) CGRect pictureListViewFrame;

/** 每个单元格的综合高度 */
@property (nonatomic, assign) CGFloat cellHeight;
@end
