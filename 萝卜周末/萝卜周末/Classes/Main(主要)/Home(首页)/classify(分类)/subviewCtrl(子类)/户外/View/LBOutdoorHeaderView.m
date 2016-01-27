//
//  LBOutdoorHeaderView.m
//  萝卜周末
//
//  Created by Apple－13 on 16/1/22.
//  Copyright (c) 2016年 com.mall. All rights reserved.
//

#import "LBOutdoorHeaderView.h"


@implementation LBOutdoorHeaderView

-(UIImageView *)imageView
{
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
    }
    return _imageView;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self.contentView addSubview:self.imageView];
    }
    return self;
}

-(void)layoutSubviews{

    
    [super layoutSubviews];
    _imageView.width = LBScreenWidth;
    _imageView.height = LBScreenWidth * 0.6;
    _imageView.x = 0;
    _imageView.y = 0;
    _imageView.backgroundColor = [UIColor grayColor];
}

@end
