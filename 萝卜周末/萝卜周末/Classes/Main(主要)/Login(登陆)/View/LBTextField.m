//
//  LBTextField.m
//  萝卜周末
//
//  Created by dp on 16/1/18.
//  Copyright (c) 2016年 com.mall. All rights reserved.
//

#import "LBTextField.h"

@implementation LBTextField
-(id)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        self.myPlaceholder=self.placeholder;
        self.textColor=[UIColor whiteColor];
        [self buildLeftImageView];
        self.backgroundColor=LBColor(139, 77, 52);
    }
    return self;
}
#pragma mark-初始化textfield的内容
-(void)buildLeftImageView{
    //添加一个UImageView
    UIView *leftView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.width/4, self.height)];
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(leftView.width/2, 0, leftView.width/2, leftView.height)];
    UIImage *image=[UIImage imageNamed:self.imageName];
    image=[image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    imageView.image=image;
    [leftView addSubview:imageView];
    self.leftView=leftView;
    self.leftViewMode=UITextFieldViewModeAlways;
    
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
