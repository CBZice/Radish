//
//  LBStatuseFrame.m
//  萝卜周末
//
//  Created by Apple_16 on 16/1/20.
//  Copyright (c) 2016年 com.mall. All rights reserved.
//

#import "LBStatuseFrame.h"
#import "LBStatuse.h"
#import "LBUser.h"
#define cellTopMargin 10           // 单元格中内容的上边距
#define cellLeftMargin 10          // 单元格中内容的左边距
#define cellBottomMargin 10        // 单元格中内容的下边距
#define cellForiconWH 40           // 单元格中的头像图片框的宽度和高度
#define marginIconToName 10        // 头像与昵称的间距
@implementation LBStatuseFrame
// 微博数据模型
- (void)setStatuse:(LBStatuse *)statuse
{
    _statuse = statuse; // 先保存一下数据模型
    LBUser *user = statuse.user;
    
    // 根据传入的数据模型给对应的空间设置frame
    /** 头像图片框frame -- icon */
    CGFloat iconX = cellLeftMargin;
    CGFloat iconY = cellTopMargin;
    CGFloat iconW = cellForiconWH;
    CGFloat iconH = cellForiconWH;
    self.iconImageViewFrame = CGRectMake(iconX, iconY, iconW, iconH);
    
    /** 昵称标签frame -- name */
    CGSize nameSize = [NSString getSizeWithText:user.userName textFont:[UIFont systemFontOfSize:14] lineWidth:LBScreenWidth - cellLeftMargin *2];
    CGFloat nameX = CGRectGetMaxX(self.iconImageViewFrame) + horizontalMargin;
    CGFloat nameY = cellTopMargin;
    CGFloat nameW = nameSize.width;
    CGFloat nameH = nameSize.height;
    self.nameLabelFrame = CGRectMake(nameX, nameY, nameW, nameH);
    
    /** 微博发布时间标签frame -- time */
    CGSize timeSize = [NSString getSizeWithText:statuse.created_at textFont:createatLabelFont lineWidth:MAXFLOAT];
    CGFloat timeX = CGRectGetMaxX(self.iconImageViewFrame) + horizontalMargin;
    CGFloat timeY = CGRectGetMaxY(self.nameLabelFrame) + verticalMargin;
    CGFloat timeW = timeSize.width;
    CGFloat timeH = timeSize.height;
    self.timeLabelFrame = CGRectMake(timeX, timeY, timeW, timeH);
    
    /** 标题标签frame -- title */
    CGSize titleSize = [NSString getSizeWithText:statuse.title textFont:contentLabelFont lineWidth:LBScreenWidth - cellLeftMargin * 2];
    CGFloat titleX = horizontalMargin;
    CGFloat titleY = MAX(CGRectGetMaxY(self.iconImageViewFrame), CGRectGetMaxY(self.timeLabelFrame)) + verticalMargin;
    CGFloat titleW = titleSize.width;
    CGFloat titleH = titleSize.height;
    self.titleLabelFrame = CGRectMake(titleX, titleY, titleW, titleH);
    /** 正文标签frame -- content */
    CGSize contentSize = [NSString getSizeWithText:statuse.text textFont:contentLabelFont lineWidth:LBScreenWidth - cellLeftMargin * 2];
    CGFloat contentX = horizontalMargin;
    CGFloat contentY = MAX(CGRectGetMaxY(self.titleLabelFrame), CGRectGetMaxY(self.timeLabelFrame)) + verticalMargin;
    CGFloat contentW = contentSize.width;
    CGFloat contentH = contentSize.height;
    self.contentLabelFrame = CGRectMake(contentX, contentY, contentW, contentH);
    
    
//    /** 发布的图片的集合 pictures */
//    NSInteger pictureCount = statuse.pic_urls.count;
//    if (pictureCount) {
//        CGFloat pictureListX = cellLeftMargin;
//        CGFloat pictureListY = statuse.text ? CGRectGetMaxY(self.contentLabelFrame) + 10 : contentY;
//        CGSize pictureListSize = [PictureListView sizeWithCount:pictureCount leftMargin:cellLeftMargin];
//        self.pictureListViewFrame = CGRectMake(pictureListX, pictureListY, pictureListSize.width, pictureListSize.height);
//    }
    
    
    /** 原创父视图frame -- original */
    CGFloat originalH = 0;
    if (statuse.pic_urls.count) {
        originalH = CGRectGetMaxY(self.pictureListViewFrame);
    }else {
        if (statuse.text) {
            originalH = CGRectGetMaxY(self.contentLabelFrame);
        }else {
            originalH = contentY;
        }
    }
    self.originalViewFrame = CGRectMake(0, 0, LBScreenWidth, originalH);
    
    self.cellHeight = CGRectGetMaxY(self.originalViewFrame);
}
@end
