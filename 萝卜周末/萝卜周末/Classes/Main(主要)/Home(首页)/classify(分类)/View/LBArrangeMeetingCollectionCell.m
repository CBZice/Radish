//
//  LBArrangeMeetingCollectionCell.m
//  萝卜周末
//
//  Created by Apple_16 on 16/1/22.
//  Copyright (c) 2016年 com.mall. All rights reserved.
//

#import "LBArrangeMeetingCollectionCell.h"
@interface LBArrangeMeetingCollectionCell ()
@property (nonatomic,strong)UIImageView *imageView;
@end
@implementation LBArrangeMeetingCollectionCell
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
//        self.backgroundColor = [UIColor purpleColor];
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, self.width-10, self.height-10)];
//        imageView.backgroundColor=LBColor(232, 234, 235);
        imageView.userInteractionEnabled=YES;
        self.imageView=imageView;
        [self addSubview:imageView];
    }
    return self;
}
-(void)setImageName:(NSString *)imageName{
    _imageName=imageName;
    UIImage *image=[UIImage imageNamed:imageName];
    image=[image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.imageView.image=image;
}
@end
