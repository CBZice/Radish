//
//  LBMyFootprintFrame.m
//  萝卜周末
//
//  Created by Apple_16 on 16/1/20.
//  Copyright (c) 2016年 com.mall. All rights reserved.
//

#import "LBMyFootprintFrame.h"
#import "LBMyFootprint.h"
#define cellTopMargin 10           // 单元格中内容的上边距
#define cellLeftMargin 10          // 单元格中内容的左边距
#define cellBottomMargin 10        // 单元格中内容的下边距
#define cellForiconWH 40           // 单元格中的头像图片框的宽度和高度
#define marginIconToName 10        // 头像与昵称的间距
@implementation LBMyFootprintFrame
-(void)setMyFootprint:(LBMyFootprint *)myFootprint{
    //保存一下数据
    _myFootprint=myFootprint;
    //创建头像的frame
    CGFloat iconX=15;
    CGFloat iconY=cellTopMargin;
    CGFloat iconW=cellForiconWH;
    CGFloat iconH=cellForiconWH;
    self.iconImageViewFrame=CGRectMake(iconX, iconY, iconW, iconH);
    
    //创建一个横线
    CGFloat lineX=0;
    CGFloat lineY=iconH/2+cellTopMargin;
    CGFloat lineW=15;
    CGFloat lineH=1;
    self.lineViewFrame=CGRectMake(lineX, lineY, lineW, lineH);
    
    //时间标签
    CGFloat timeX=CGRectGetMaxX(self.iconImageViewFrame)+marginIconToName;
    CGFloat timeY=cellTopMargin+10;
    CGFloat timeH=10;
    CGFloat timeW=100;
    self.timeLabelFrame=CGRectMake(timeX, timeY, timeW, timeH);
    
    //父视图frame
    CGFloat originalX=10;
    CGFloat originalY=CGRectGetMaxY(self.lineViewFrame)+5;
    CGFloat originalW=200;
    CGFloat originalH=150;
    self.originalViewFrame=CGRectMake(originalX, originalY, originalW, originalH);
    
    //昵称的frame
    CGFloat userNameX=10;
    CGFloat userNameY=10;
    CGFloat userNameW=100;
    CGFloat userNameH=30;
    self.nameLabelFrame=CGRectMake(userNameX, userNameY, userNameW, userNameH);
    
    //内容的frame
    CGSize contentSize = [NSString getSizeWithText:myFootprint.conent textFont:[UIFont systemFontOfSize:15] lineWidth:200 - 10];
    CGFloat contentX = 10;
    CGFloat contentY =CGRectGetMaxY(self.nameLabelFrame)+10;
    CGFloat contentW = contentSize.width;
    CGFloat contentH = contentSize.height;
    self.contentLabelFrame = CGRectMake(contentX, contentY, contentW, contentH);
    
    //图片的frame
    self.pictureViewFrame=CGRectMake(originalX, originalY, originalW, originalH);
   
    self.cellHeight=CGRectGetMaxY(self.originalViewFrame)+10;
    
    
}
@end
