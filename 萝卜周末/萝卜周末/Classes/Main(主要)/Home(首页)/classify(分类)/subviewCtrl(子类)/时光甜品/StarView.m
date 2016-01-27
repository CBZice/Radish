//
//  StarView.m
//  Moive
//
//  Created by mac on 15/8/26.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "StarView.h"

@implementation StarView

-(instancetype)initWithFrame:(CGRect)frame
{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self _initStarView];
    }
    
    return self;
    
    
}


//设置在xib文件也可以调用
-(void)awakeFromNib
{
    
    [super awakeFromNib];
    
    [self _initStarView];
    
}



- (void)_initStarView
{
    //创建灰色的星
    _grayView = [[UIView alloc]initWithFrame:CGRectZero];
    
    _grayView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"gray"]];
    
    [self addSubview:_grayView];
    
    //创建黄色的星
    
    _yellowView = [[UIView alloc]initWithFrame:CGRectZero];
    
    _yellowView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"yellow"]];
        [self addSubview:_yellowView];
    
    //创建评分label
    
    _ratinglabel = [[UILabel alloc]initWithFrame:CGRectZero];
    
    _ratinglabel.textColor = [UIColor whiteColor];
    
    _ratinglabel.font = [UIFont systemFontOfSize:14];
    
        [self addSubview:_ratinglabel];
    

    
}





-(void)setScore:(float)score
{
    _score = score;
    
    [super setNeedsLayout];
}

-(void)layoutSubviews
{
    
    [super layoutSubviews];
    
    _grayView.frame = CGRectMake(0, 0, CGRectGetHeight(self.frame)*5,CGRectGetHeight(self.frame));
    _yellowView.frame = CGRectMake(0, 0, CGRectGetHeight(self.frame)*5,CGRectGetHeight(self.frame));
    
    _ratinglabel.frame = CGRectMake(CGRectGetHeight(self.frame)*5+2, CGRectGetMinY(_grayView.frame)+2, 130, 18);
    
    
    
    _ratinglabel.text = [NSString stringWithFormat:@"%.1f 分",_score];
    _ratinglabel.textColor = [UIColor orangeColor];
    
    _ratinglabel.centerY = _grayView.centerY;
    //变换
    UIImage *grayimg = [UIImage imageNamed:@"gray"];
    
    UIImage *yellowimg = [UIImage imageNamed:@"yellow"];
    
    CGFloat height = CGRectGetHeight(self.frame);
    
    _grayView.transform = CGAffineTransformMakeScale(height/ grayimg.size.width, height/grayimg.size.height);
    
    _yellowView.transform = CGAffineTransformMakeScale(height/ yellowimg.size.width, height/yellowimg.size.height);
    
   
    
    //给_yellowView.frame重新赋值
    CGFloat num = _score/10.0;
    
    _yellowView.frame = CGRectMake(0, 0, CGRectGetHeight(self.frame)*5*num,CGRectGetHeight(self.frame));
}














@end
