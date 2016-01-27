//
//  LBSetupTableViewCell.h
//  萝卜周末
//
//  Created by Apple－13 on 16/1/19.
//  Copyright (c) 2016年 com.mall. All rights reserved.
//

#import <UIKit/UIKit.h>

/** 设置右边视图的显示模式 */
typedef enum {
    LBSetupTableViewCellAccessoryNone,
    LBSetupTableViewCellAccessoryArrow,
    LBSetupTableViewCellAccessoryPicker
}LBSetupTableViewCellAccessoryType;


@interface LBSetupTableViewCell : UITableViewCell

/** 图片视图 */
@property (nonatomic, strong) UIImageView *imgView;
/** 标题 */
@property (nonatomic, strong) UILabel *textlbl;
/** 标题说明 */
@property (nonatomic, strong) UILabel *detaillbl;
/** 右视图 */
@property (nonatomic, strong) UIView *lineView;

/** 是否画圆形头像 */
@property (nonatomic, assign, getter=isCircleImgView) BOOL circleImgView;

/** 头像是否有边框 */
@property (nonatomic, assign, getter=isCircleHaveBoard) BOOL circleHaveBoard;

/** 头像边框颜色 */
@property (nonatomic, strong) UIColor *circleBoardColor;
/** 头像边框宽度 */
@property (nonatomic, assign) CGFloat circleBoardWidth;

@property (nonatomic, assign) LBSetupTableViewCellAccessoryType accesstype;


+(instancetype)dequenCellWithTableView:(UITableView *)tableView;

@end
