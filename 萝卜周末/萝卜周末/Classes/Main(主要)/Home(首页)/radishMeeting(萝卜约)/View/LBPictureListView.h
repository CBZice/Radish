//
//  LBPictureListView.h
//  萝卜周末
//
//  Created by Apple_16 on 16/1/20.
//  Copyright (c) 2016年 com.mall. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LBPictureListView : UIView
// 创建一个数组来接收传入的图片对象数组
@property (nonatomic, strong) NSArray *pictures;

// 根据传入的图片的数量返回本视图的Size
+ (CGSize)sizeWithCount:(NSInteger)count leftMargin:(CGFloat)leftMargin;
@end
