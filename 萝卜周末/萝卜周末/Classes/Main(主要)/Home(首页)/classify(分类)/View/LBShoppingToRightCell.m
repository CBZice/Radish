//
//  LBShoppingToRightCell.m
//  萝卜周末
//
//  Created by Apple_16 on 16/1/22.
//  Copyright (c) 2016年 com.mall. All rights reserved.
//

#import "LBShoppingToRightCell.h"

@implementation LBShoppingToRightCell
//-(id)initWithFrame:(CGRect)frame{
//    if (self=[super initWithFrame:frame]) {
//        //添加顶部的线
//        UIView *topLine=[[UIView alloc]initWithFrame:CGRectMake((self.width-2)/2, 0, 2, (self.height-15)/2)];
//        topLine.backgroundColor=[UIColor greenColor];
//        [self addSubview:topLine];
//        self.topLine=topLine;
//        //加中间的圆圈
//        UIView *circleView=[[UIView alloc]initWithFrame:CGRectMake((self.width-10)/2, CGRectGetMaxY(topLine.frame)+2.5, 10, 10)];
//        circleView.backgroundColor=[UIColor greenColor];
//        circleView.layer.masksToBounds=YES;
//        circleView.layer.cornerRadius=5;
//        [self addSubview:circleView];
//        self.circleView=circleView;
//        //添加底部的线
//        UIView *bottomLine=[[UIView alloc]initWithFrame:CGRectMake((self.width-2)/2, CGRectGetMaxY(circleView.frame)+2.5, 2, (self.height-15)/2)];
//        bottomLine.backgroundColor=[UIColor greenColor];
//        [self addSubview:bottomLine];
//        self.buttomLine=bottomLine;
//        //添加左边的文字
//        UILabel *detailsLabel=[[UILabel alloc]initWithFrame:CGRectMake(10, 10, (self.width-5-20), (self.height-20))];
//        detailsLabel.numberOfLines=0;
//        detailsLabel.font=[UIFont systemFontOfSize:17];
//        detailsLabel.textAlignment=NSTextAlignmentLeft;
//        detailsLabel.textColor=[UIColor blackColor];
//        [self addSubview:detailsLabel];
//        self.detailsLabel=detailsLabel;
//        //图片的宽度和高度和中间线的宽度
//        CGFloat imageViewW=self.height*4/5;
//        CGFloat imageViewH=self.height*4/5;
//        CGFloat middleLineW=(LBScreenWidth-(CGRectGetMaxX(circleView.frame)+2.5)-imageViewW)/2;
//        CGFloat imageViewX=CGRectGetMaxX(circleView.frame)+2.5+middleLineW;
//        CGFloat imageViewY=self.height/5/2;
//        //添加图片的视图
//        UIImageView *pictureImageView=[[UIImageView alloc]initWithFrame:CGRectMake(imageViewX,imageViewY ,imageViewW ,imageViewH )];
//        pictureImageView.layer.masksToBounds=YES;
//        pictureImageView.layer.cornerRadius=imageViewW/2;
//        pictureImageView.backgroundColor=[UIColor blackColor];
//        [self addSubview:pictureImageView];
//        self.pictureImageView=pictureImageView;
//        //添加中间的线
//        UIView *middleLine=[[UIView alloc]initWithFrame:CGRectMake((CGRectGetMaxX(circleView.frame)+2.5), (self.height-2)/2, middleLineW, 2)];
//        [self addSubview:middleLine];
//        self.middleLine=middleLine;
//        //添加addressImageView
//        UIImageView *addressImageView=[[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(bottomLine.frame)+10,CGRectGetMaxY(pictureImageView.frame) , 20, imageViewY)];
//        [self addSubview:addressImageView];
//        addressImageView.backgroundColor=[UIColor greenColor];
//        self.addressImageView=addressImageView;
//        
//        //添加地址的uilaebl
//        UILabel *addressLabel=[[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(addressImageView.frame)+5, CGRectGetMaxY(pictureImageView.frame), 50, imageViewY)];
//        addressLabel.font=[UIFont systemFontOfSize:14];
//        addressLabel.textColor=[UIColor blackColor];
//        self.addressLabel=addressLabel;
//        [self addSubview:addressLabel];
//        //添加专区的UILabel
//        UILabel *goodsNameLabel=[[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(addressLabel.frame)+5, CGRectGetMaxY(pictureImageView.frame), 150, imageViewY)];
//        goodsNameLabel.font=[UIFont systemFontOfSize:17];
//        goodsNameLabel.textColor=[UIColor blackColor];
//        self.goodsNameLabel=goodsNameLabel;
//        [self addSubview:goodsNameLabel];
//        
//        self.topLine.hidden=self.isShowTopLine;
//    
//
//    }
//    return self;
//}
// 获取单元格
+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *cellIDRight = @"cellRight";
    LBShoppingToRightCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIDRight];
    if (cell == nil) {
        cell = [[LBShoppingToRightCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIDRight];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
    }
    return cell;
}

// 重写init方法, 可以在该方法中自定义添加控件
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //添加顶部的线
        self.height=200;
        UIView *topLine=[[UIView alloc]initWithFrame:CGRectMake((LBScreenWidth-2)/2, 0, 2, (self.height-15)/2)];
        topLine.backgroundColor=[UIColor greenColor];
        [self.contentView addSubview:topLine];
        self.topLine=topLine;
        //加中间的圆圈
        UIView *circleView=[[UIView alloc]initWithFrame:CGRectMake((LBScreenWidth-20)/2, CGRectGetMaxY(topLine.frame)+2.5, 20, 20)];
        circleView.backgroundColor=[UIColor greenColor];
        circleView.layer.masksToBounds=YES;
        circleView.layer.cornerRadius=10;
        [self.contentView addSubview:circleView];
        self.circleView=circleView;
        //添加底部的线
        UIView *bottomLine=[[UIView alloc]initWithFrame:CGRectMake((LBScreenWidth-2)/2, CGRectGetMaxY(circleView.frame)+2.5, 2, (self.height-15)/2)];
        bottomLine.backgroundColor=[UIColor greenColor];
        [self.contentView addSubview:bottomLine];
        self.buttomLine=bottomLine;
        //添加左边的文字
        UILabel *detailsLabel=[[UILabel alloc]initWithFrame:CGRectMake(10, 10, (LBScreenWidth-5-20)/2, (self.height-20))];
        detailsLabel.numberOfLines=0;
        detailsLabel.font=[UIFont systemFontOfSize:17];
        detailsLabel.textAlignment=NSTextAlignmentLeft;
        detailsLabel.textColor=[UIColor blackColor];
        [self.contentView addSubview:detailsLabel];
        self.detailsLabel=detailsLabel;
        //图片的宽度和高度和中间线的宽度
        CGFloat imageViewW=self.height*4/6;
        CGFloat imageViewH=self.height*4/6;
        CGFloat middleLineW=(LBScreenWidth-(CGRectGetMaxX(circleView.frame)+2.5)-imageViewW)/2;
        CGFloat imageViewX=CGRectGetMaxX(circleView.frame)+2.5+middleLineW;
        CGFloat imageViewY=self.height/6;
        //添加图片的视图
        UIImageView *pictureImageView=[[UIImageView alloc]initWithFrame:CGRectMake(imageViewX,imageViewY ,imageViewW ,imageViewH )];
        pictureImageView.layer.masksToBounds=YES;
        pictureImageView.layer.cornerRadius=imageViewW/2;
        pictureImageView.backgroundColor=[UIColor blackColor];
        [self.contentView addSubview:pictureImageView];
        self.pictureImageView=pictureImageView;
        //添加中间的线
        UIView *middleLine=[[UIView alloc]initWithFrame:CGRectMake((CGRectGetMaxX(circleView.frame)+2.5), (self.height-2)/2, middleLineW, 2)];
        middleLine.backgroundColor=[UIColor greenColor];
        [self.contentView addSubview:middleLine];
        self.middleLine=middleLine;
        //添加addressImageView
        UIImageView *addressImageView=[[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(bottomLine.frame)+10,CGRectGetMaxY(pictureImageView.frame) , 20, 20)];
        [self.contentView addSubview:addressImageView];
        addressImageView.backgroundColor=[UIColor greenColor];
        self.addressImageView=addressImageView;
        
        //添加地址的uilaebl
        UILabel *addressLabel=[[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(addressImageView.frame)+5, CGRectGetMaxY(pictureImageView.frame), 40, imageViewY)];
        addressLabel.font=[UIFont systemFontOfSize:10];
        addressLabel.textColor=[UIColor blackColor];
        self.addressLabel=addressLabel;
        [self.contentView addSubview:addressLabel];
        //添加专区的UILabel
        UILabel *goodsNameLabel=[[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(addressLabel.frame)+5, CGRectGetMaxY(pictureImageView.frame), 100, imageViewY)];
        goodsNameLabel.numberOfLines=0;
        goodsNameLabel.textAlignment=NSTextAlignmentLeft;
        goodsNameLabel.font=[UIFont systemFontOfSize:13];
        goodsNameLabel.textColor=[UIColor blackColor];
        self.goodsNameLabel=goodsNameLabel;
        [self.contentView addSubview:goodsNameLabel];
        
        self.topLine.hidden=self.isShowTopLine;
    }
    return self;
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
