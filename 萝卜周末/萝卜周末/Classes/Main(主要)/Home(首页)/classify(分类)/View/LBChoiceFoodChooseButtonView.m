//
//  LBChoiceFoodChooseButtonView.m
//  萝卜周末
//
//  Created by Apple_16 on 16/1/21.
//  Copyright (c) 2016年 com.mall. All rights reserved.
//

#import "LBChoiceFoodChooseButtonView.h"
@interface LBChoiceFoodChooseButtonView ()
@property (nonatomic,strong)NSArray *listArray;

@end
@implementation LBChoiceFoodChooseButtonView
-(id)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    CGFloat buttonH=40;
    int tag=0;
    if (self) {
        for (int i=0; i<2; i++) {
            for(int j=0;j<3;j++){
                UIButton *button=[[UIButton alloc]initWithFrame:CGRectMake(j*LBScreenWidth/3, i*buttonH, LBScreenWidth/3, buttonH)];
                button.tag=tag;
                [button setTitle:[self.listArray objectAtIndex:tag] forState:UIControlStateNormal];
                [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                [self addSubview:button];
                button.layer.borderColor=[UIColor grayColor].CGColor;
                button.layer.borderWidth=1;
                [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
                tag++;
            }
            
        }
    }
    return self;
}
#pragma mark-懒加载
-(NSArray *)listArray{
    if (_listArray==nil) {
        _listArray=[NSArray arrayWithObjects:@"家常菜",@"快餐",@"料理",@"自助",@"火锅",@"下午茶", nil];
    }
    return _listArray;
}
-(void)buttonClicked:(UIButton *)sender{
    if ([self.delegate respondsToSelector:@selector(choiceFoodChooseButtonViewDidClickedButton:withButton:)]) {
        [self.delegate choiceFoodChooseButtonViewDidClickedButton:self withButton:sender];
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
