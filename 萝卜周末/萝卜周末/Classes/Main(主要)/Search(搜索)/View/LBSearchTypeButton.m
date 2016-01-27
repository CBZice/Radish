//
//  LBSearchTypeButton.m
//  萝卜周末
//
//  Created by Apple_16 on 16/1/19.
//  Copyright (c) 2016年 com.mall. All rights reserved.
//

#import "LBSearchTypeButton.h"

@implementation LBSearchTypeButton
-(instancetype)searchTypeButtonWithNormalImage:(NSString *)normalImage SelectedImage:(NSString *)selectedImage title:(NSString *)titleName tap:(NSUInteger)tap{
    //添加一个按钮
    UIButton *imageButton=[[UIButton alloc]init];
    [imageButton setImage:[UIImage imageNamed:normalImage] forState:UIControlStateNormal];
    [imageButton setImage:[UIImage imageNamed:selectedImage] forState:UIControlStateSelected];
    [imageButton addTarget:self action:@selector(imageButtonClick:) forControlEvents:UIControlEventTouchUpInside];
//    imageButton.backgroundColor=[UIColor orangeColor];
    imageButton.x=0;
    imageButton.y=0;
    imageButton.width=self.width;
    imageButton.height=self.height*4/5;
    imageButton.tag=tap;
    imageButton.layer.masksToBounds=YES;
    if (imageButton.width>imageButton.height) {
        imageButton.layer.cornerRadius=imageButton.height/2;
    }else{
        imageButton.layer.cornerRadius=imageButton.width/2;
    }
    self.imageButton=imageButton;
    [self addSubview:imageButton];
    
    UILabel *titleLable=[[UILabel alloc]init];
    titleLable.text=titleName;
    titleLable.x=0;
    titleLable.y=self.height*4/5+10;
    titleLable.width=self.width;
    titleLable.height=self.height/5-10;
    titleLable.textAlignment=NSTextAlignmentCenter;
    [self addSubview:titleLable];
    self.titleLable=titleLable;
    return self;
}
-(void)imageButtonClick:(UIButton *)sender{
    if ([self.delegate respondsToSelector:@selector(SearchTypeButtonDidClick:button:)]) {
        [self.delegate SearchTypeButtonDidClick:self button:sender];
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
