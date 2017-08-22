//
//  NSDate+Formater.m
//  XSTravel
//
//  Created by 謝傳友 on 15/5/30.
//  Copyright (c) 2015年 XieShou. All rights reserved.
//

#import "NSDate+Formater.h"

@implementation NSDate (Formater)

/*!
 * 创建NSDate实例
 */
+ (NSDate *)dateWithFormatedDateString:(NSString *)formatedDateString formate:(NSString *)formate
{
    if (!formatedDateString || formatedDateString <= 0) {
        return [NSDate date];
    }
    if (!formate || formate.length <= 0) {
        formate = @"yyyy-MM-dd";
    }
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = formate;
    NSDate *date = [dateFormatter dateFromString:formatedDateString];
    return date;
}

- (NSString *)stringWithFormatDate
{
    if (!self) {
        return @"";
    }
    
    NSDateFormatter *dateFormate = [[NSDateFormatter alloc] init];
    dateFormate.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSString *dateString = [dateFormate stringFromDate:self];
    
    return dateString;
}

/*!
 * 把NSDate转成相应格式的字符串
 */
- (NSString *)stringByFormate:(NSString *)format
{
    if (!format || format.length < 1) {
        format = @"yyyy-MM-dd HH:mm:ss";
    }
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = format;
    NSString *dateString = [dateFormatter stringFromDate:self];
    
    return dateString;
}

/*!
 * 时间比较，
 * 相等返回0
 * 比date后返回正时间戳
 * 比date前返回负时间戳
 */
- (NSInteger)compareDate:(NSDate *)anotherDate
{
    if (!anotherDate) {
        return -1;
    }
    
    if (![anotherDate isKindOfClass:[NSDate class]]) {
        return -1;
    }
    
    return [self timeIntervalSinceDate:anotherDate];
}

/*!
 * 当前年份
 */
- (NSInteger)currentYear
{
    NSDate *currentDate = [NSDate date];
    NSDateComponents *dateComponpents = [self getDateComponentsByDate:currentDate];
    return [dateComponpents year];
}

/*!
 * 当前月份
 */
- (NSInteger)currentMonth
{
    NSDate *currentDate = [NSDate date];
    NSDateComponents *dateComponpents = [self getDateComponentsByDate:currentDate];
    return [dateComponpents month];
}

/*!
 * 当前天
 */
- (NSInteger)currentDay
{
    NSDate *currentDate = [NSDate date];
    NSDateComponents *dateComponpents = [self getDateComponentsByDate:currentDate];
    return [dateComponpents day];
}

/*!
 * 当前小时
 */
- (NSInteger)currentHour
{
    NSDate *currentDate = [NSDate date];
    NSDateComponents *dateComponpents = [self getDateComponentsByDate:currentDate];
    return [dateComponpents hour];
}

/*!
 * 当前分
 */
- (NSInteger)currentMinute
{
    NSDate *currentDate = [NSDate date];
    NSDateComponents *dateComponpents = [self getDateComponentsByDate:currentDate];
    return [dateComponpents minute];
}

/*!
 * 当前秒
 */
- (NSInteger)currentSecond
{
    NSDate *currentDate = [NSDate date];
    NSDateComponents *dateComponpents = [self getDateComponentsByDate:currentDate];
    return [dateComponpents second];
}


/*!
 * 获得时间部件
 */
- (NSDateComponents *)getDateComponentsByDate:(NSDate *)date
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *dateComponpent = [calendar components:unitFlags fromDate:date];
    return dateComponpent;
}

@end
