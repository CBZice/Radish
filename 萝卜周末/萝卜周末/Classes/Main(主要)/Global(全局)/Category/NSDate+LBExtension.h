//
//  NSDate+LBExtension.h
//  萝卜周末
//
//  Created by Apple_16 on 16/1/20.
//  Copyright (c) 2016年 com.mall. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (LBExtension)
// 判断该时间是否是今年
- (BOOL)isThisYear;

// 判断该时间是否是昨天
- (BOOL)isYesterday;

// 判断该时间是否是今天
- (BOOL)isToday;

// 判断该时间是否是一小时之内
- (BOOL)isOneHour;

// 判断该时间是否在一分钟之内
- (BOOL)isOneMinute;
/**
 *根据当前的nsdate返回当前date的月份和天数的字符串
 */
-(NSString *)getCurrentMonthDayTime;
/**
 *根据当前的nsdate返回当前date的日、小时、分钟的字符串
 */
-(NSString *)getCurrentMonthDayHourMinuteTime;
/**
 *根据当前的nsdate返回当前date的年、月、日字符串
 */
-(NSString *)getCurrentYearMonthDayTime;
/**
 *根据当前的nsdate返回当前date的年、月的字符串
 */
-(NSString *)getCurrentYearMonthTime;
/**
 *根据当前的nsdate返回当前date的年份的字符串
 */
-(NSString *)getCurrentYearTime;
/**
 *根据当前的nsdate返回当前date的月份的字符串
 */
-(NSString *)getCurrentMonthTime;
@end
