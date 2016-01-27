//
//  NSDate+LBExtension.m
//  萝卜周末
//
//  Created by Apple_16 on 16/1/20.
//  Copyright (c) 2016年 com.mall. All rights reserved.
//

#import "NSDate+LBExtension.h"

@implementation NSDate (LBExtension)
// 是否是今年
- (BOOL)isThisYear
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *dateCmps = [calendar components:NSCalendarUnitYear fromDate:self];
    NSDateComponents *nowCmps = [calendar components:NSCalendarUnitYear fromDate:[NSDate date]];
    
    return dateCmps.year == nowCmps.year;
}

// 是否是昨天
- (BOOL)isYesterday
{
    // 1. 获得当前时间
    NSDate *nowDate = [NSDate date];
    
    // 2. 设置格式化转换器
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd";
    
    // 3. 得到转化后的时间字符串
    NSString *nowStr = [formatter stringFromDate:nowDate];
    NSString *dateStr = [formatter stringFromDate:self];
    
    // 4. 根据得到的时间字符串转换为时间
    nowDate = [formatter dateFromString:nowStr];
    NSDate *date = [formatter dateFromString:dateStr];
    
    // 5. 创建日历类
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    // 6. 设置日历类的对比类型
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    
    // 7. 根据对比类型得到两个时间的差值
    NSDateComponents *comps = [calendar components:unit fromDate:date toDate:nowDate options:0];
    
    // 8. 根据得到的差值类返回是否是昨天
    return comps.year == 0 && comps.month == 0 && comps.day == 1;
}

// 是否是今天
- (BOOL)isToday
{
    // 1. 获得当前时间
    NSDate *nowDate = [NSDate date];
    
    // 2. 设置格式化转换器
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd";
    
    // 3. 得到转化后的时间字符串
    NSString *nowStr = [formatter stringFromDate:nowDate];
    NSString *dateStr = [formatter stringFromDate:self];
    
    // 4. 根据得到的时间字符串转换为时间
    nowDate = [formatter dateFromString:nowStr];
    NSDate *date = [formatter dateFromString:dateStr];
    
    // 5. 创建日历类
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    // 6. 设置日历类的对比类型
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    
    // 7. 根据对比类型得到两个时间的差值
    NSDateComponents *comps = [calendar components:unit fromDate:date toDate:nowDate options:0];
    
    // 8. 根据得到的差值类返回是否是昨天
    return comps.year == 0 && comps.month == 0 && comps.day == 0;
}

// 是否在一小时内
- (BOOL)isOneHour
{
    // 1. 获得当前时间
    NSDate *nowDate = [NSDate date];
    
    // 2. 设置格式化转换器
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd HH";
    
    // 3. 得到转化后的时间字符串
    NSString *nowStr = [formatter stringFromDate:nowDate];
    NSString *dateStr = [formatter stringFromDate:self];
    
    // 4. 根据得到的时间字符串转换为时间
    nowDate = [formatter dateFromString:nowStr];
    NSDate *date = [formatter dateFromString:dateStr];
    
    // 5. 创建日历类
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    // 6. 设置日历类的对比类型
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour;
    
    // 7. 根据对比类型得到两个时间的差值
    NSDateComponents *comps = [calendar components:unit fromDate:date toDate:nowDate options:0];
    
    // 8. 根据得到的差值类返回是否是昨天
    return comps.year == 0 && comps.month == 0 && comps.day == 0 && comps.hour == 0;
}

// 是否在一分钟内
- (BOOL)isOneMinute
{
    // 1. 获得当前时间
    NSDate *nowDate = [NSDate date];
    
    // 2. 设置格式化转换器
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    
    // 3. 得到转化后的时间字符串
    NSString *nowStr = [formatter stringFromDate:nowDate];
    NSString *dateStr = [formatter stringFromDate:self];
    
    // 4. 根据得到的时间字符串转换为时间
    nowDate = [formatter dateFromString:nowStr];
    NSDate *date = [formatter dateFromString:dateStr];
    
    // 5. 创建日历类
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    // 6. 设置日历类的对比类型
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    
    // 7. 根据对比类型得到两个时间的差值
    NSDateComponents *comps = [calendar components:unit fromDate:date toDate:nowDate options:0];
    
    // 8. 根据得到的差值类返回是否是昨天
    return comps.year == 0 && comps.month == 0 && comps.day == 0 && comps.hour == 0 && comps.minute == 0;
}
-(NSString *)getCurrentMonthDayTime
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"MM月dd日";
    NSString *dateStr = [formatter stringFromDate:self];
    return dateStr;
}
-(NSString *)getCurrentMonthDayHourMinuteTime{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"MM月dd日 HH:mm";
    NSString *dateStr = [formatter stringFromDate:self];
    return dateStr;
}
-(NSString *)getCurrentYearMonthDayTime{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy年MM月dd日";
    NSString *dateStr = [formatter stringFromDate:self];
    return dateStr;
}
-(NSString *)getCurrentYearMonthTime{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy年MM月";
    NSString *dateStr = [formatter stringFromDate:self];
    return dateStr;
}
-(NSString *)getCurrentYearTime{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy年";
    NSString *dateStr = [formatter stringFromDate:self];
    return dateStr;
}
-(NSString *)getCurrentMonthTime{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"MM月";
    NSString *dateStr = [formatter stringFromDate:self];
    return dateStr;
}
@end
