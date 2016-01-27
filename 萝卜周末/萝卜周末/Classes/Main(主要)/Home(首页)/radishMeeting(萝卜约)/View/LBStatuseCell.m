//
//  LBStatuseCell.m
//  萝卜周末
//
//  Created by Apple_16 on 16/1/20.
//  Copyright (c) 2016年 com.mall. All rights reserved.
//

#import "LBStatuseCell.h"
#import "LBStatuseFrame.h"               // 微博控件尺寸模型
#import "LBStatuse.h"                    // 微博信息模型
#import "LBUser.h"                       // 用户信息模型
#import "LBPictureListView.h"            // 发布的微博的图片 -- 图片框
#import "LBIconImageView.h"              // 头像图片框
@interface LBStatuseCell ()

/* ---------------------原创微博部分----------------------- */
/** 头像图片框 -- icon */
@property (nonatomic, weak) LBIconImageView *iconImageView;
/** 昵称标签 -- name */
@property (nonatomic, weak) UILabel *nameLabel;
/** 萝卜约动态信息发布时间标签 -- time */
@property (nonatomic, weak) UILabel *timeLabel;
/** 萝卜约动态信息标题标签 -- title */
@property (nonatomic, weak) UILabel *titleLabel;
/** 萝卜约动态信息正文标签 -- content */
@property (nonatomic, weak) UILabel *contentLabel;
/** 发布的图片的集合 pictures */
@property (nonatomic, weak) LBPictureListView  *pictureListView;
/** 父视图 -- original */
@property (nonatomic, weak) UIView *originalView;



@end
@implementation LBStatuseCell

// 获取单元格
+ (instancetype)statuseCellWithTableView:(UITableView *)tableView
{
    static NSString *reuseID = @"statuseCell";
    LBStatuseCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID];
    if (cell == nil) {
        cell = [[LBStatuseCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseID];
    }
    return cell;
}

// 重写init方法, 可以在该方法中自定义添加控件
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        // . 创建单元格中的子控件
        /** 原创父视图 -- original */
        UIView *originalView = [[UIView alloc] init];
        [self.contentView addSubview:originalView];
        self.originalView = originalView;
        
        /** 头像图片框 -- icon */
        LBIconImageView *iconImageView = [[LBIconImageView alloc] init];
        [originalView addSubview:iconImageView];
        
        self.iconImageView = iconImageView;
        
        /** 昵称标签 -- name */
        UILabel *nameLabel = [[UILabel alloc] init];
        nameLabel.font = nameLabelFont;
        [originalView addSubview:nameLabel];
        self.nameLabel = nameLabel;
        
        /** 萝卜约动态信息发布时间标签 -- time */
        UILabel *timeLabel = [[UILabel alloc] init];
        timeLabel.textColor = [UIColor orangeColor];
        timeLabel.font = createatLabelFont;
        [originalView addSubview:timeLabel];
        self.timeLabel = timeLabel;
        
        /** 萝卜约动态信息标题标签 -- title */
        UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel.font=createatLabelFont;
        [originalView addSubview:titleLabel];
        self.titleLabel = titleLabel;
        
        /** 正文标签 -- content */
        UILabel *contentLabel = [[UILabel alloc] init];
        contentLabel.numberOfLines = 0;
        contentLabel.font = contentLabelFont;
        [originalView addSubview:contentLabel];
        self.contentLabel = contentLabel;
        
        /** 发布的图片的集合 pictures */
        LBPictureListView *pictureListView = [[LBPictureListView alloc] init];
        [originalView addSubview:pictureListView];
        self.pictureListView = pictureListView;
    }
    
    // 返回单元格
    return self;
}



// 微博frame模型的set方法
- (void)setStatuseFrame:(LBStatuseFrame *)statuseFrame
{
    
    // 先保存传入的frame模型
    _statuseFrame = statuseFrame;
    LBStatuse *statuse = self.statuseFrame.statuse;
    LBUser *user = statuse.user;
    
    // 下面对frame模型进行一些操作
    
    /** 头像图片框 -- icon */
    self.iconImageView.frame = statuseFrame.iconImageViewFrame;
    self.iconImageView.user = statuse.user;
    
    
    /** 昵称标签 -- name */
    self.nameLabel.frame = statuseFrame.nameLabelFrame;
    self.nameLabel.text = user.userName;
    
    
    
    
    /** 发布时间标签frame -- time */
    CGSize timeSize = [NSString getSizeWithText:statuse.created_at textFont:createatLabelFont lineWidth:MAXFLOAT];
    CGFloat timeX = CGRectGetMaxX(self.iconImageView.frame) + horizontalMargin;
    CGFloat timeY = CGRectGetMaxY(self.nameLabel.frame) + verticalMargin;
    CGFloat timeW = timeSize.width;
    CGFloat timeH = timeSize.height;
    self.timeLabel.frame = CGRectMake(timeX, timeY, timeW, timeH);
    self.timeLabel.text = statuse.created_at;
    
    /** 标题标签frame -- title */
    CGSize titleSize = [NSString getSizeWithText:statuse.title textFont:createatLabelFont lineWidth:MAXFLOAT];
    CGFloat titleX = CGRectGetMaxX(self.timeLabel.frame) + horizontalMargin;
    CGFloat titleY = timeY;
    CGFloat titleW = titleSize.width;
    CGFloat stitleH = titleSize.height;
    self.titleLabel.frame = CGRectMake(titleX, titleY, titleW, stitleH);
    self.titleLabel.text = statuse.title;
    
    
    /** 正文标签 -- content */
    self.contentLabel.frame = statuseFrame.contentLabelFrame;
    self.contentLabel.text = statuse.text;
    
    /** 发布的图片的集合 pictures */
    self.pictureListView.frame = statuseFrame.pictureListViewFrame;
    self.pictureListView.pictures = statuse.pic_urls;
    
    
    /** 原创父视图 -- original */
    self.originalView.frame = statuseFrame.originalViewFrame;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
