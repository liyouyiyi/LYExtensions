//
//  NSString+Custome.m
//  XSTravel
//
//  Created by 謝傳友 on 15/6/6.
//  Copyright (c) 2015年 XieShou. All rights reserved.
//

#import "NSString+Custome.h"


@implementation NSString (Custom)

- (NSString *)trimSpaceString
{
    if (!self) {
        return nil;
    }
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

+ (NSString *)stringByAvoidNil:(NSString *)string;
{
    if (!string) {
        return @"";
    }
    return string;
}

- (CGFloat)widthByLimitHeight:(CGFloat)height fontSize:(CGFloat)fontSize
{
    CGSize size = CGSizeMake(0, height);
    NSDictionary *attribute = @{NSFontAttributeName: [UIFont systemFontOfSize:fontSize]};
    CGRect frame = [self boundingRectWithSize:size options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute context:nil];
    return frame.size.width;
}

- (CGFloat)heightByLimitWidth:(CGFloat)width fontSize:(CGFloat)fontSize
{
    CGFloat height = 0;
    CGSize size = CGSizeMake(width, 0);
    NSDictionary *attribute = @{NSFontAttributeName: [UIFont systemFontOfSize:fontSize]};
    CGRect frame = [self boundingRectWithSize:size options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute context:nil];
    height = frame.size.height;
    return height;
}

@end

/*!
 * 验证字符串的合法性
 */
@implementation NSString (Verification)

/*!
 * 是否为正整数，成功返回整数数值，失败返回-1
 */
- (NSInteger)isPositiveInteger {
    NSScanner* scan = [NSScanner scannerWithString:self];
    NSInteger val = -1;
    BOOL success = [scan scanInteger:&val] && [scan isAtEnd];
    NSLog(@"isPositiveInteger = %d", (int)val);
    if (!success) {
        return -1;
    }
    return val;
}

/*!
 * 是否为正浮点型数,成功返回浮点数值，失败返回-1
 */
- (float)isPositiveFloat {
    NSScanner* scan = [NSScanner scannerWithString:self];
    float val = -1;
    BOOL success = [scan scanFloat:&val] && [scan isAtEnd];
    NSLog(@"isPureFloat = %f", val);
    if (!success) {
        return -1;
    }
    return val;
}

-(BOOL)isValidateEmail {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}

@end






