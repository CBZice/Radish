//
//  LBClassifyCollectionViewCell.m
//  萝卜周末
//
//  Created by Apple_16 on 16/1/21.
//  Copyright (c) 2016年 com.mall. All rights reserved.
//

#import "LBClassifyCollectionViewCell.h"
@interface LBClassifyCollectionViewCell ()
@property (nonatomic,strong)UIImageView *myBackImageView;
@end
@implementation LBClassifyCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
//        self.backgroundColor=[UIColor grayColor];
        UIImageView *backImageView=[[UIImageView alloc]initWithFrame:self.bounds];
        backImageView.backgroundColor=[UIColor orangeColor];
        backImageView.userInteractionEnabled=YES;
        self.myBackImageView=backImageView;
        [self addSubview:backImageView];
        
        //蒙版的视图
        UIView *masking=[[UIView alloc]initWithFrame:self.bounds];
        masking.backgroundColor=[UIColor blackColor];
        masking.alpha=0.7;
        [backImageView addSubview:masking];
        
        //添加按钮的
        UIButton *classTypeButton=[[UIButton alloc]initWithFrame:CGRectMake((self.width-60)/2, 40, 60, 60)];
        [masking addSubview:classTypeButton];
        self.classTypeButton=classTypeButton;
        [classTypeButton addTarget:self action:@selector(typeButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        //添加类别的名称
        UILabel *classTypeLabel=[[UILabel alloc]initWithFrame:CGRectMake((self.width-60)/2, CGRectGetMaxY(classTypeButton.frame)+10, 60, 40)];
        classTypeLabel.textColor=[UIColor whiteColor];
        classTypeLabel.font=[UIFont boldSystemFontOfSize:20];
        classTypeLabel.textAlignment=NSTextAlignmentCenter;
        [masking addSubview:classTypeLabel];
        self.classTypeNameLabel=classTypeLabel;
        
    }
    return self;
}
-(void)setBackImageView:(NSString *)backImageView{
    _backImageView=backImageView;
    UIImage *iamge=[UIImage imageNamed: self.backImageView];
    iamge=[iamge imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.myBackImageView.image=iamge;
}
//按钮的点击事件
-(void)typeButtonClicked:(UIButton *)sender{
    LBLog(@"点击了点赞事件");
    if ([self.delegate respondsToSelector:@selector(classifyCollectionViewCellDidClickedClassTypeButton: withTag:)]) {
        [self.delegate classifyCollectionViewCellDidClickedClassTypeButton:self withTag:sender.tag];
    }
}

@end
