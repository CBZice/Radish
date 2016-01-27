//
//  NSString+LBExtension.h
//  萝卜周末
//
//  Created by Apple_16 on 16/1/20.
//  Copyright (c) 2016年 com.mall. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (LBExtension)
+ (CGSize)getSizeWithText:(NSString *)text textFont:(UIFont *)font lineWidth:(CGFloat)lineWidth;
@end
