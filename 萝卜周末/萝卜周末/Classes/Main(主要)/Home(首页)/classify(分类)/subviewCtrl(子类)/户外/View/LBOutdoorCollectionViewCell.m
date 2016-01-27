//
//  LBOutdoorCollectionViewCell.m
//  萝卜周末
//
//  Created by Apple－13 on 16/1/22.
//  Copyright (c) 2016年 com.mall. All rights reserved.
//

#import "LBOutdoorCollectionViewCell.h"

@implementation LBOutdoorCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        [self addSubview:self.imgView];
        
        self.label = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.imgView.frame) - 20, self.frame.size.width, 20)];
        self.label.backgroundColor = [UIColor clearColor];
        self.label.textAlignment = NSTextAlignmentLeft;
        self.label.textColor = [UIColor whiteColor];
        [self addSubview:self.label];
    }
    return self;
}

@end
