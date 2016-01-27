//
//  LBOutdoorPictureCell.h
//  萝卜周末
//
//  Created by Apple－13 on 16/1/22.
//  Copyright (c) 2016年 com.mall. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LBOutdootCollecionView;


@interface LBOutdoorPictureCell : UITableViewCell

@property (nonatomic, strong) LBOutdootCollecionView *outdoorCoolectiontView;
@property (nonatomic, strong) UILabel *textLbl;

+(instancetype)dequenCellWithTableView:(UITableView *)tableView;

@end
