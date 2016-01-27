//
//  LBItemChartCell.h
//  萝卜周末
//
//  Created by Apple－13 on 16/1/20.
//  Copyright (c) 2016年 com.mall. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LBHotArticleCell : UITableViewCell

+(instancetype)dequenCellWithTableView:(UITableView *)tableView;

/** 是否显示向上的线 */
@property (nonatomic, assign) BOOL showUplineHidden;

@end
