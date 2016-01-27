//
//  LBMyFootprintCell.m
//  萝卜周末
//
//  Created by Apple_16 on 16/1/20.
//  Copyright (c) 2016年 com.mall. All rights reserved.
//

#import "LBMyFootprintCell.h"
#import "LBMyFootprint.h"
#import "LBMyFootprintFrame.h"
@interface LBMyFootprintCell ()
/** 线*/
@property (nonatomic, weak) UIView *lineView;
/** 头像图片框 -- icon */
@property (nonatomic, weak) UIImageView *iconImageView;
/** 昵称标签 -- name */
@property (nonatomic, weak) UILabel *nameLabel;
/** 发布时间标签 -- time */
@property (nonatomic, weak) UILabel *timeLabel;
/** 正文标签 -- content */
@property (nonatomic, weak) UILabel *contentLabel;
/** 发布的图片的集合 pictures */
@property (nonatomic, weak) UIImageView *pictureView;
/** 父视图 -- original */
@property (nonatomic, weak) UIView *originalView;
@end
@implementation LBMyFootprintCell
// 获取单元格
+ (instancetype)footprintCellWithTableView:(UITableView *)tabelView
{
    static NSString *reuseID = @"footprintCell";
    LBMyFootprintCell *cell = [tabelView dequeueReusableCellWithIdentifier:reuseID];
    if (cell == nil) {
        cell = [[LBMyFootprintCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseID];
    }
    return cell;
}

// 重写init方法, 可以在该方法中自定义添加控件
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        /** 原创父视图 -- original */
        UIView *originalView = [[UIView alloc] init];
        [self.contentView addSubview:originalView];
        self.originalView = originalView;
        
        /** 发布的图片的集合 pictures */
        UIImageView *pictureView = [[UIImageView alloc] init];
        [self.contentView addSubview:pictureView];
        self.pictureView = pictureView;
        /** 头像图片框 -- icon */
        UIImageView *iconImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:iconImageView];
        
        self.iconImageView = iconImageView;
        /** 线*/
        UIView *lineView=[[UIView alloc]init];
        [self.contentView addSubview:lineView];
        self.lineView=lineView;
        
        /** 昵称标签 -- name */
        UILabel *nameLabel = [[UILabel alloc] init];
        nameLabel.font = [UIFont boldSystemFontOfSize:15];
        nameLabel.textColor=LBColor(112, 194, 147);
        [originalView addSubview:nameLabel];
        self.nameLabel = nameLabel;
        
        
        /** 发布时间标签 -- time */
        UILabel *timeLabel = [[UILabel alloc] init];
        timeLabel.textColor = LBColor(112, 194, 147);
        timeLabel.font = [UIFont boldSystemFontOfSize:15];
        [self.contentView addSubview:timeLabel];
        self.timeLabel = timeLabel;
        
        /** 正文标签 -- content */
        UILabel *contentLabel = [[UILabel alloc] init];
        contentLabel.numberOfLines = 0;
        contentLabel.font = [UIFont boldSystemFontOfSize:15];
        contentLabel.textColor=[UIColor whiteColor];
        [originalView addSubview:contentLabel];
        self.contentLabel = contentLabel;
        
        
        
        
        
    }
    
    
    // 返回单元格
    return self;
}



// 微博frame模型的set方法
- (void)setFootprintFrame:(LBMyFootprintFrame *)footprintFrame
{
    
    // 先保存传入的微博frame模型
    _footprintFrame = footprintFrame;
    LBMyFootprint *footprint = self.footprintFrame.myFootprint;
    
    // 下面对微博frame模型进行一些操作
    
    /** 头像图片框 -- icon */
    self.iconImageView.frame = footprintFrame.iconImageViewFrame;
    self.iconImageView.layer.cornerRadius=self.iconImageView.width/2;
    self.iconImageView.layer.masksToBounds=YES;
    self.iconImageView.backgroundColor=[UIColor blackColor];
    
    /** 昵称标签 -- name */
    self.nameLabel.frame = footprintFrame.nameLabelFrame;
    self.nameLabel.text=footprint.userName;

    //** 线的frame */
    self.lineView.frame=footprintFrame.lineViewFrame;
    self.lineView.backgroundColor=[UIColor orangeColor];
    
    /** 发布时间标签frame -- time */
    self.timeLabel.frame =footprintFrame.timeLabelFrame;
    self.timeLabel.text = footprint.time;
    
    /** 正文标签 -- content */
    self.contentLabel.frame = footprintFrame.contentLabelFrame;
    self.contentLabel.text = footprint.conent;
    
    /** 发布的图片的集合 pictures */
    self.pictureView.frame = footprintFrame.pictureViewFrame;
    self.pictureView.image=[UIImage imageNamed:footprint.iconName];
    
    
    /** 原创父视图 -- original */
    self.originalView.frame = footprintFrame.originalViewFrame;
    self.originalView.backgroundColor=LBColor(244, 79, 28);
    
  
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
