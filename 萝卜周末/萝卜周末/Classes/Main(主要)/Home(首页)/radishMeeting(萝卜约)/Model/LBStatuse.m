//
//  LBStatuse.m
//  萝卜周末
//
//  Created by Apple_16 on 16/1/20.
//  Copyright (c) 2016年 com.mall. All rights reserved.
//

#import "LBStatuse.h"
#import "LBPicture.h"

@implementation LBStatuse
// 重写create_at属性的get方法
- (NSString *)created_at
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    formatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_us"];// en_us
    
    // 设置日期格式
    formatter.dateFormat = @"EEE MMM dd HH:mm:ss Z yyyy";
    
    NSDate *createDate = [formatter dateFromString:_created_at];
    
    
    if ([createDate isThisYear]) { /*今年*/
        if ([createDate isYesterday]) { // 昨天 xx:xx
            formatter.dateFormat = @"昨天 HH:mm";
            return [formatter stringFromDate:createDate];
        }else if ([createDate isToday]) {
            if ([createDate isOneHour]) { //
                if ([createDate isOneMinute]) { // 刚刚
                    return @"刚刚";
                }else { // xx分钟前
                    // 利用创建的日历对象方便的比较两个日期的差距
                    NSCalendar *calendar = [NSCalendar currentCalendar];
                    NSCalendarUnit unit = NSCalendarUnitMinute | NSCalendarUnitSecond;
                    
                    // 计算两个日期的差值
                    NSDateComponents *components = [calendar components:unit fromDate:createDate toDate:[NSDate date] options:0];
                    return [NSString stringWithFormat:@"%ld分钟前",components.minute];
                }
            }else { // 一小时外, xx小时:xx分钟
                formatter.dateFormat = @"HH:mm";
                return [formatter stringFromDate:createDate];
            }
        }else { // 今年的其他天, xx月xx日
            formatter.dateFormat = @"MM-dd";
            return [formatter stringFromDate:createDate];
        }
    }else { // 不是今年  xxxx年xx月xx日
        formatter.dateFormat = @"yyyy-MM-dd";
        return [formatter stringFromDate:createDate];
    }
}
@end
