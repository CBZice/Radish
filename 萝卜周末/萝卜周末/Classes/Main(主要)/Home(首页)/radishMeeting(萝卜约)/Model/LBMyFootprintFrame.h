//
//  LBMyFootprintFrame.h
//  萝卜周末
//
//  Created by Apple_16 on 16/1/20.
//  Copyright (c) 2016年 com.mall. All rights reserved.
//

#import <Foundation/Foundation.h>
@class LBMyFootprint;
@interface LBMyFootprintFrame : NSObject
/**足迹数据模型 */
@property (nonatomic,strong)LBMyFootprint *myFootprint;
/** 线的frame*/
@property (nonatomic,assign)CGRect lineViewFrame;
/** 头像图片框frame -- icon */
@property (nonatomic, assign) CGRect iconImageViewFrame;
/** 昵称标签frame -- name */
@property (nonatomic, assign) CGRect nameLabelFrame;
/** 发布时间标签frame -- time */
@property (nonatomic, assign) CGRect timeLabelFrame;
/** 正文标签frame -- content */
@property (nonatomic, assign) CGRect contentLabelFrame;
/** 发布的图片 picture */
@property (nonatomic, assign) CGRect pictureViewFrame;
/** 文字、图片、昵称父视图frame -- original */
@property (nonatomic, assign) CGRect originalViewFrame;
/** 每个单元格的综合高度 */
@property (nonatomic, assign) CGFloat cellHeight;
@end
