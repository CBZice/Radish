//
//  LBTodayRecommedCollectionViewCell.m
//  萝卜周末
//
//  Created by dp on 16/1/20.
//  Copyright (c) 2016年 com.mall. All rights reserved.
//

#import "LBTodayRecommedCollectionViewCell.h"

@implementation LBTodayRecommedCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor=[UIColor grayColor];
        UIImageView *backImageView=[[UIImageView alloc]initWithFrame:self.bounds];
        backImageView.backgroundColor=[UIColor orangeColor];
        UIImage *iamge=[UIImage imageNamed: self.backImageView];
        iamge=[iamge imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        backImageView.image=iamge;
        [self addSubview:backImageView];
        self.thumbupButton = [[UIButton alloc] initWithFrame:CGRectMake(self.width-10-100, 10, 100, 40)];
        [self.thumbupButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [self addSubview:self.thumbupButton];
        [self.thumbupButton setTitle:@"点赞" forState:UIControlStateNormal];
        [self.thumbupButton addTarget:self action:@selector(thumbupButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        //蒙版的视图
        UIView *masking=[[UIView alloc]initWithFrame:CGRectMake(0, self.height/4, self.width, self.height/2)];
        masking.backgroundColor=[UIColor blackColor];
        masking.alpha=0.7;
        [self addSubview:masking];
        
        //添加推荐的标题
        UILabel *titleLabel=[[UILabel alloc]initWithFrame:CGRectMake(20, 20, self.width-40, 40)];
        titleLabel.text=@"和味寿司大开业";
        titleLabel.textColor=[UIColor whiteColor];
        titleLabel.font=[UIFont boldSystemFontOfSize:18];
        self.titleLabel=titleLabel;
        [masking addSubview:titleLabel];
        
        //添加活动的地址
        UILabel *addressLabel=[[UILabel alloc]initWithFrame:CGRectMake(20, CGRectGetMaxY(titleLabel.frame)+20, self.width-40, 30)];
        addressLabel.text=@"远洋城底商37号";
        addressLabel.textColor=[UIColor whiteColor];
        self.addressLabel=addressLabel;
        [masking addSubview:addressLabel];
        
        //添加日期的
        UILabel *dateLabel=[[UILabel alloc]initWithFrame:CGRectMake(20,CGRectGetMaxY(addressLabel.frame)+5, self.width-40, 30)];
        dateLabel.text=@"2016年2月10日-15日";
        dateLabel.textColor=[UIColor whiteColor];
        self.addressLabel=dateLabel;
        [masking addSubview:dateLabel];
        
        //添加详情按钮
        UIButton *detailsButton=[[UIButton alloc]initWithFrame:CGRectMake(self.width-10-100, CGRectGetMaxY(dateLabel.frame), 100, 40)];
        [detailsButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [masking
         addSubview:detailsButton];
        [detailsButton setTitle:@"详情>>" forState:UIControlStateNormal];
        [detailsButton addTarget:self action:@selector(detailsButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        self.detailsButton=detailsButton;
        
    }
    return self;
}
//点赞按钮的点击事件
-(void)thumbupButtonClick:(UIButton *)sender{
    LBLog(@"点击了点赞事件");
    
}
//详情按钮的点击事件
-(void)detailsButtonClick:(UIButton *)sender{
    LBLog(@"点击了详情事件");
}
@end
