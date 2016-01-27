//
//  NSMutableAttributedString+LBUnderlineString.h
//  萝卜周末
//
//  Created by Apple_16 on 16/1/19.
//  Copyright (c) 2016年 com.mall. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableAttributedString (LBUnderlineString)
/**
 *  返回一个带下划线的字符串
 */
+(instancetype)getUnderlineStringWithNSString:(NSString *)str;
@end
