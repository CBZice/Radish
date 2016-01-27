//
//  NSString+LBExtension.m
//  萝卜周末
//
//  Created by Apple_16 on 16/1/20.
//  Copyright (c) 2016年 com.mall. All rights reserved.
//

#import "NSString+LBExtension.h"

@implementation NSString (LBExtension)
+ (CGSize)getSizeWithText:(NSString *)text textFont:(UIFont *)font lineWidth:(CGFloat)lineWidth
{
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
    dictionary[NSFontAttributeName] = font;
    
    return [text boundingRectWithSize:CGSizeMake(lineWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dictionary context:nil].size;
}
@end
