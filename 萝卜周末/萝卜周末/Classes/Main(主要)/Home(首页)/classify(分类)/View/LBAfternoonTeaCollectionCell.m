//
//  LBAfternoonTeaCollectionCell.m
//  萝卜周末
//
//  Created by Apple_16 on 16/1/22.
//  Copyright (c) 2016年 com.mall. All rights reserved.
//

#import "LBAfternoonTeaCollectionCell.h"

@implementation LBAfternoonTeaCollectionCell
-(id)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        //添加背景图片
        UIImageView *imageView=[[UIImageView alloc]initWithFrame:self.bounds];
        imageView.backgroundColor=[UIColor grayColor];
        imageView.userInteractionEnabled=YES;
        [self addSubview:imageView];
        
        //添加toolView
        UIView *maskingView=[[UIView alloc]initWithFrame:CGRectMake(0, self.height-40, self.width, 40)];
        maskingView.backgroundColor=[UIColor blackColor];
        maskingView.alpha=0.5;
        [self addSubview:maskingView];
        
        //添加addressLabel
        UILabel *addressLabel=[[UILabel alloc]initWithFrame:CGRectMake(15, 0, maskingView.width, maskingView.height/2-2)];
        addressLabel.textColor=[UIColor whiteColor];
        addressLabel.font=[UIFont systemFontOfSize:12];
        self.addressLabel=addressLabel;
        [maskingView addSubview:addressLabel];
        //添加discountLabel
        UILabel *discountLabel=[[UILabel alloc]initWithFrame:CGRectMake(15, CGRectGetMaxY(addressLabel.frame)+4, maskingView.width, maskingView.height/2-2)];
        discountLabel.textColor=[UIColor whiteColor];
        discountLabel.font=[UIFont systemFontOfSize:12];
        self.discountLabel=discountLabel;
        [maskingView addSubview:discountLabel];
        
    }
    return self;
}
@end
