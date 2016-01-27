//
//  NSMutableAttributedString+LBUnderlineString.m
//  萝卜周末
//
//  Created by Apple_16 on 16/1/19.
//  Copyright (c) 2016年 com.mall. All rights reserved.
//

#import "NSMutableAttributedString+LBUnderlineString.h"

@implementation NSMutableAttributedString (LBUnderlineString)
+(instancetype)getUnderlineStringWithNSString:(NSString *)str{
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:str];
    NSRange strRange = {0,[attributedString length]};
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:strRange];  //设置颜色
    
    [attributedString addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:strRange];
    return attributedString;
    
}
@end
