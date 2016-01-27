//
//  LBPictureImageView.m
//  萝卜周末
//
//  Created by Apple_16 on 16/1/20.
//  Copyright (c) 2016年 com.mall. All rights reserved.
//

#import "LBPictureImageView.h"
#import "LBPicture.h"
@interface LBPictureImageView ()

@property (nonatomic, weak) UIImageView *imageView;

@end
@implementation LBPictureImageView
- (UIImageView *)imageView
{
    if (!_imageView) {
        // 创建一个小的图片框来显示图片右下角的gif标志图片
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"timeline_image_gif"]];
        [self addSubview:imageView];
        self.imageView = imageView;
    }
    return _imageView;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        // 设置图片的显示模式
        self.contentMode = UIViewContentModeScaleAspectFill; // 填充到全部显示到图片框中，最后居中显示
        self.clipsToBounds = YES; // 让多出图片框的图片都被裁减掉
        
        
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 设置gif图片框的frame
    self.imageView.x = self.width - self.imageView.width;
    self.imageView.y = self.height - self.imageView.height;
}

// 重写模型数组的set方法
- (void)setPicture:(LBPicture *)picture
{
    _picture = picture;
    
    if (picture.original_picName || picture.original_picAddress) {
        [self setImage:[UIImage imageNamed:picture.original_picName]];
    }else{
        [self setImage:[UIImage imageNamed:@"timeline_image_placeholder"]];
    }
    
    // 截取图片地址
    NSString *path = picture.thumbnail_pic;
    if ([path.lowercaseString hasSuffix:@"gif"]) {
        self.imageView.hidden = NO;
    }else {
        self.imageView.hidden = YES;
    }
    
    // 可以简洁的替换为
    //    self.imageView.hidden = ![picture.thumbnail_pic.lowercaseString hasSuffix:@"gif"];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
