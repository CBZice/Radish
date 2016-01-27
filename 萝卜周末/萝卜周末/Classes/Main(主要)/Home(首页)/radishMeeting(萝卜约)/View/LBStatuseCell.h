//
//  LBStatuseCell.h
//  萝卜周末
//
//  Created by Apple_16 on 16/1/20.
//  Copyright (c) 2016年 com.mall. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LBStatuseFrame;
@interface LBStatuseCell : UITableViewCell
@property (nonatomic, strong) LBStatuseFrame *statuseFrame;

// 获取单元格 -- 需要传入可重用时的tableview
+ (instancetype)statuseCellWithTableView:(UITableView *)tabelView;
@end
