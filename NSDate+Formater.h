//
//  NSDate+Formater.h
//  XSTravel
//
//  Created by 謝傳友 on 15/5/30.
//  Copyright (c) 2015年 XieShou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Formater)

/*!
 * 创建NSDate实例
 */
+ (NSDate *)dateWithFormatedDateString:(NSString *)formatedDateString formate:(NSString *)formate;

/*!
 * 把date转成字符串
 */
- (NSString *)stringWithFormatDate;

/*!
 * 把NSDate转成相应格式的字符串，默认格式@"yyyy-MM-dd HH:mm:ss"
 */
- (NSString *)stringByFormate:(NSString *)format;

/*!
 * 时间比较，
 * 相等返回0
 * 比date后返回正时间戳
 * 比date前返回负时间戳
 */
- (NSInteger)compareDate:(NSDate *)anotherDate;

/*!
 * 当前年份
 */
- (NSInteger)currentYear;

/*!
 * 当前月份
 */
- (NSInteger)currentMonth;

/*!
 * 当前年份
 */
- (NSInteger)currentDay;

/*!
 * 当前小时
 */
- (NSInteger)currentHour;

/*!
 * 当前分
 */
- (NSInteger)currentMinute;

/*!
 * 当前秒
 */
- (NSInteger)currentSecond;

@end
