//
//  LBArrangeMeetingReusableView.m
//  萝卜周末
//
//  Created by Apple_16 on 16/1/22.
//  Copyright (c) 2016年 com.mall. All rights reserved.
//

#import "LBArrangeMeetingReusableView.h"

@implementation LBArrangeMeetingReusableView
-(id)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        //添加一个UILabel
        UILabel *typeNameLabel=[[UILabel alloc]initWithFrame:CGRectMake((self.width-300)/2, (self.height-40)/2, 300, 40)];
        typeNameLabel.textColor=[UIColor blackColor];
        typeNameLabel.textAlignment=NSTextAlignmentCenter;
        typeNameLabel.font=[UIFont boldSystemFontOfSize:18];
        [self addSubview:typeNameLabel];
        self.typeNameLabel=typeNameLabel;
        
    }
    return self;
}
@end
