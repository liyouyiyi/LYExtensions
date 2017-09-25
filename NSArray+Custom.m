//
//  NSArray+Custom.m
//  PurchaseBao
//
//  Created by DarrenXie on 15/10/30.
//  Copyright © 2015年 YeahKa. All rights reserved.
//

#import "NSArray+Custom.h"

@implementation NSArray (Custom)

/*!
 * 验证数组是否有效，排除 =nil，=NSNull， count<=0
 */
+ (BOOL)isValidOfArray:(NSArray *)array
{
    if (!array || [array isKindOfClass:[NSNull class]]) return NO;
    return YES;
}

- (BOOL)isValid
{
    return [[self class] isValidOfArray:self] ;
}

+ (NSArray *)letters;
{
    return @[@"A", @"B", @"C", @"D", @"E", @"F", @"G", @"H", @"I", @"J", @"K", @"L", @"M", @"N", @"O", @"P", @"Q", @"R", @"S", @"T", @"U", @"V", @"W", @"X", @"Y", @"Z"];
}

@end
