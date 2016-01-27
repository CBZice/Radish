//
//  LBChoiceFoodCollectionViewCell.m
//  萝卜周末
//
//  Created by dp on 16/1/21.
//  Copyright (c) 2016年 com.mall. All rights reserved.
//

#import "LBChoiceFoodCollectionViewCell.h"

@implementation LBChoiceFoodCollectionViewCell
- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithFrame:self.contentView.bounds];
        _imageView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
        _imageView.userInteractionEnabled=YES;
    }
    return _imageView;
}
-(UIView *)toolView{
    if (_toolView==nil) {
        _toolView=[[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.imageView.frame)-25, self.width, 25)];
        _toolView.backgroundColor=[UIColor whiteColor];
        UILabel *foodNameLabel=[[UILabel alloc]initWithFrame:CGRectMake(5, (_toolView.height-20)/2, 40, 20)];
        foodNameLabel.font=[UIFont systemFontOfSize:10];
        [_toolView addSubview:foodNameLabel];
        self.foodNameLabel=foodNameLabel;
        //收藏按钮
        UIButton *collectionButton=[[UIButton alloc]initWithFrame:CGRectMake((self.width-70), (_toolView.height-20)/2, 30, 20)];
        [_toolView addSubview:collectionButton];
        self.collectionButton=collectionButton;
        [collectionButton setTitle:@"收藏" forState:UIControlStateNormal];
        [collectionButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        collectionButton.titleLabel.font=[UIFont systemFontOfSize:10];
        
        //关注按钮
        UIButton *attentionButton=[[UIButton alloc]initWithFrame:CGRectMake(self.width-35, (_toolView.height-20)/2, 30, 20)];
        [_toolView addSubview:attentionButton];
        self.attentionButton=attentionButton;
        [attentionButton setTitle:@"关注" forState:UIControlStateNormal];
        [attentionButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        attentionButton.titleLabel.font=[UIFont systemFontOfSize:10];
        
    }
    return _toolView;
}
- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self.contentView addSubview:self.imageView];
        [self.contentView addSubview:self.toolView];
    }
    return self;
}
@end
