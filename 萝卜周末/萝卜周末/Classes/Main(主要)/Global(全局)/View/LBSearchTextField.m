//
//  LBSearchTextField.m
//  萝卜周末
//
//  Created by Apple_16 on 16/1/19.
//  Copyright (c) 2016年 com.mall. All rights reserved.
//

#import "LBSearchTextField.h"
@interface LBSearchTextField ()

@end

@implementation LBSearchTextField
@synthesize  delegate;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.font = [UIFont systemFontOfSize:15];
        self.placeholder = @"请输入搜索条件";
        self.backgroundColor=[UIColor whiteColor];
        self.layer.masksToBounds=YES;
        self.layer.cornerRadius=10;
        
        // 通过init来创建初始化绝大部分控件，控件都是没有尺寸
        UIButton *searchIcon = [[UIButton alloc] init];
//        searchIcon.image = [UIImage imageNamed:@"tabbar_search_selected"];
        [searchIcon setImage:[UIImage imageNamed:@"tabbar_search_selected"] forState:UIControlStateNormal];
        searchIcon.width = 30;
        searchIcon.height = 30;
        searchIcon.contentMode = UIViewContentModeCenter;
        self.rightView = searchIcon;
        self.rightViewMode = UITextFieldViewModeAlways;
        [searchIcon addTarget:self action:@selector(searchBarAction) forControlEvents:UIControlEventTouchUpInside];
        
        //添加左边的视图
        UIView *leftView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 15, 1)];
        self.leftView=leftView;
        self.leftViewMode=UITextFieldViewModeAlways;
    }
    return self;
}

+(instancetype)SearchTextField{
    return [[self alloc] init];
}
#pragma mark-搜索按钮的点击事件
-(void)searchBarAction{
    if ([self.delegate respondsToSelector:@selector(SearchTextFieldSearchButtonClick:)]) {
        [self.delegate SearchTextFieldSearchButtonClick:self];
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
