//
//  NSString+Custom.m
//  PurchaseBao
//
//  Created by DarrenXie on 15/10/30.
//  Copyright © 2015年 YeahKa. All rights reserved.
//

#import "NSString+Custom.h"
#import <UIKit/UIKit.h>
#import "NSDictionary+Custom.h"
#import "Constant.h"

@implementation NSString (Custom)

NSString *NSStringFromInteger(NSInteger intValue)
{
    return [NSString stringWithFormat:@"%d", (int)intValue];
}

NSString *NSStringFromFloat(float floatValue)
{
    return [NSString stringWithFormat:@"%f", floatValue];
}

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

- (float)widthByLimitHeight:(float)height fontSize:(float)fontSize
{
    return [self widthByLimitHeight:height font:[UIFont systemFontOfSize:fontSize]];
}

- (float)widthByLimitHeight:(float)height font:(UIFont *)font
{
    CGSize size = CGSizeMake(0, height);
    NSDictionary *attribute = @{NSFontAttributeName: font};
    CGRect frame = [self boundingRectWithSize:size options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute context:nil];
    return frame.size.width;
}

- (float)heightByLimitWidth:(float)width fontSize:(float)fontSize
{
    return [self heightByLimitWidth:width font:[UIFont systemFontOfSize:fontSize]];
}

- (float)heightByLimitWidth:(float)width font:(UIFont *)font
{
    CGFloat height = 0;
    CGSize size = CGSizeMake(width, 0);
    NSDictionary *attribute = @{NSFontAttributeName: font};
    CGRect frame = [self boundingRectWithSize:size options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute context:nil];
    height = frame.size.height;
    return height;
}

- (CGSize)sizeWithFont:(UIFont *)font maxWidth:(CGFloat)maxWidth
{
    NSDictionary *attribute = @{NSFontAttributeName: font};
    CGSize size = CGSizeMake(MAXFLOAT, MAXFLOAT);
    CGRect frame = [self boundingRectWithSize:size options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute context:nil];
    
    if (frame.size.width <= maxWidth) {
        return frame.size;
    }
    
    size.width = maxWidth;
    frame = [self boundingRectWithSize:size options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute context:nil];
    
    return frame.size;
}

/*!
 * 中文转拼音
 */
- (NSString *)chineseToPhonetic
{
    if (self.length <= 0) {
        return nil;
    }
    NSMutableString *ms = [[NSMutableString alloc] initWithString:self];
    if (CFStringTransform((__bridge CFMutableStringRef)ms, 0, kCFStringTransformMandarinLatin, NO)) {
        //        NSLog(@"pinyin: %@", ms);
    }
    if (CFStringTransform((__bridge CFMutableStringRef)ms, 0, kCFStringTransformStripDiacritics, NO)) {
//        NSLog(@"pinyin: %@", ms);
    }
    
    return [ms uppercaseString];
}

/*!
 * 中文转数字
 */
- (NSString *)chineseToDigit
{
    if (self.length <= 0) {
        return nil;
    }
    NSArray *zh = @[@"零", @"一", @"二", @"三", @"四", @"五", @"六", @"七", @"八", @"九"];
    NSArray *unit = @[@"0", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9"];
    NSString *digit = @"";
    for (NSInteger i = 0; i < self.length; i++) {
        NSRange range = NSMakeRange(i, 1);
        NSString *chineseDigit = [self substringWithRange:range];
        if (![zh containsObject:chineseDigit] && ![unit containsObject:chineseDigit]) {
            return nil;
        }
        if ([unit containsObject:chineseDigit]) {
            continue;
        }
        NSInteger index = [zh indexOfObject:chineseDigit];
        digit = [unit objectAtIndex:index];
        digit = [self stringByReplacingCharactersInRange:range withString:digit];
    }
    
    return digit;
}

+ (NSData *)convertHexStrToData:(NSString *)str
{
    if (!str || [str length] == 0) {
        return nil;
    }
    
    NSMutableData *hexData = [[NSMutableData alloc] initWithCapacity:8];
    NSRange range;
    if ([str length] % 2 == 0) {
        range = NSMakeRange(0,2);
    } else {
        range = NSMakeRange(0,1);
    }
    for (NSInteger i = range.location; i < [str length]; i += 2) {
        unsigned int anInt;
        NSString *hexCharStr = [str substringWithRange:range];
        NSScanner *scanner = [[NSScanner alloc] initWithString:hexCharStr];
        
        [scanner scanHexInt:&anInt];
        NSData *entity = [[NSData alloc] initWithBytes:&anInt length:1];
        [hexData appendData:entity];
        
        range.location += range.length;
        range.length = 2;
    }
    
    return hexData;
}

- (NSData *)convertHexStrToData
{
    return [[self class] convertHexStrToData:self];
}

+ (long long)convertHexStrToLongLong:(NSString *)str
{
    if (!str || [str length] == 0) {
        return 0;
    }
    unsigned long long result = 0;
    NSScanner *scanner = [NSScanner scannerWithString:str];
    [scanner scanHexLongLong:&result];
    NSLog(@"result = %lld", result);
    return result;
}

- (long long)convertHexStrToLongLong
{
    return [[self class] convertHexStrToLongLong:self];
}

- (NSString *)convertToHexString
{
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    
    NSMutableString *string = [[NSMutableString alloc] initWithCapacity:[data length]];
    
    [data enumerateByteRangesUsingBlock:^(const void *bytes, NSRange byteRange, BOOL *stop) {
        unsigned char *dataBytes = (unsigned char*)bytes;
        for (NSInteger i = 0; i < byteRange.length; i++) {
            NSString *hexStr = [NSString stringWithFormat:@"%x", (dataBytes[i]) & 0xff];
            if ([hexStr length] == 2) {
                [string appendString:hexStr];
            } else {
                [string appendFormat:@"0%@", hexStr];
            }
        }
    }];
    
    return string;
}

- (NSString *)stringWithBytes:(Byte *)bytes length:(NSInteger)length
{
    NSString *result = @"";
    for (NSInteger i = 0; i < length; i++) {
        NSString *temp = [NSString stringWithFormat:@"%@", [[NSString alloc] initWithFormat:@"%02lx",(long)bytes[i]]];
        result = [result stringByAppendingString:temp];
    }
    
    return result;
}

- (NSInteger)versionCompareWithVersionString:(NSString *)versionSting;
{
    if (!versionSting || versionSting.length <= 0) {
        return 1;
    }
    NSString *sepStr = @".";
    
    if ([self rangeOfString:sepStr].location == NSNotFound || [versionSting rangeOfString:sepStr].location == NSNotFound ) {
        return [self floatValue] > [versionSting floatValue] ? 1 : [self floatValue] == [versionSting floatValue] ? 0 : -1;
    }
    
    NSArray *currentVersionSeps = [self componentsSeparatedByString:sepStr];
    NSArray *targetVersionSeps = [versionSting componentsSeparatedByString:sepStr];
    
    NSInteger currentCount = currentVersionSeps.count;
    NSInteger targetCount = targetVersionSeps.count;
    
    NSInteger count = MAX(currentCount, targetCount);
    NSInteger result = 0;
    for (NSInteger i = 0; i < count; i++) {
        NSInteger currentSubVersion = 0;
        NSInteger targetSubVersion = 0;
        if (currentCount > i) {
            currentSubVersion = [[currentVersionSeps objectAtIndex:i] integerValue];
        }
        if (targetCount > i) {
            targetSubVersion = [[targetVersionSeps objectAtIndex:i] integerValue];
        }
        
        if (currentSubVersion > targetSubVersion) {
            result = 1;
            break;
        }
        if (currentSubVersion < targetSubVersion) {
            result = -1;
            break;
        }
    }
    
    return result;
}

@end

/*!
 * 验证字符串的合法性
 */
@implementation NSString (Verification)

/*!
 * 是否为合法的字符串
 * string!=nil && string!=NSNull && string.length>0
 */
+ (BOOL)isValidateString:(NSString *)string
{
    BOOL success = YES;
    if (!string || [string isKindOfClass:[NSNull class]] || string.length <= 0) {
        success = NO;
    }
    return success;
}

- (NSString *)safeString;
{
    if (![NSString isValidateString:self]) {
        return @"";
    }
    return self;
}

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

- (BOOL)isChineseString
{
    return [[self class] isChineseString:self];
}

+ (BOOL)isChineseString:(NSString *)string
{
    BOOL isChinese = YES;
    if (![[self class] isValidateString:string]) {
        return NO;
    }
    
    for (NSInteger i = 0; i < string.length; i++) {
        unichar chineseChar = [string characterAtIndex:i];
        if (!(chineseChar >= 0x4E00 && chineseChar <= 0x9FFF)) {
            isChinese = NO;
        }
    }
    
    return isChinese;
}

- (BOOL)isContainsChineseString
{
    return [[self class] isContainsChineseString:self];
}

+ (BOOL)isContainsChineseString:(NSString *)string
{
    BOOL isContainsChineseString = NO;
    if (![[self class] isValidateString:string]) {
        return NO;
    }
    
    for (NSInteger i = 0; i < string.length; i++) {
        unichar chineseChar = [string characterAtIndex:i];
        if ((chineseChar >= 0x4E00 && chineseChar <= 0x9FFF)) {
            isContainsChineseString = YES;
            break;
        }
    }
    
    return isContainsChineseString;
}

//获取拼音首字母(传入汉字字符串, 返回大写拼音首字母)
+ (NSString *)firstCharactor:(NSString *)aString
{
    //转成了可变字符串
    NSMutableString *str = [NSMutableString stringWithString:aString];
    //先转换为带声调的拼音
    CFStringTransform((CFMutableStringRef)str,NULL, kCFStringTransformMandarinLatin,NO);
    //再转换为不带声调的拼音
    CFStringTransform((CFMutableStringRef)str,NULL, kCFStringTransformStripDiacritics,NO);
    //转化为大写拼音
    NSString *pinYin = [str capitalizedString];
    //获取并返回首字母
    return [pinYin substringToIndex:1];
}

- (NSString *)firstCharactor
{
    return [[self class] firstCharactor:self];
}

+ (BOOL)isValidateMobile:(NSString *)mobile
{
    if (![self isValidateString:mobile]) {
        return NO;
    }
    NSString *phoneRegex = @"^((13[0-9])|(147)|(15[^4,\\D])|(18[0-9])|(17[0-9]))\\d{8}$";
    NSPredicate *phonePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneRegex];
    return [phonePredicate evaluateWithObject:mobile];
}

- (BOOL)isValidateMobile
{
    return [[self class] isValidateMobile:self];
}

+ (BOOL)isValidateEmail:(NSString *)email
{
    if (![self isValidateString:email]) {
        return NO;
    }
    NSString *emailRegex = @"^([a-zA-Z0-9]*[-_]?[a-zA-Z0-9]+)*@([a-zA-Z0-9]*[-_]?[a-zA-Z0-9]+)+[\\.][A-Za-z]{2,3}([\\.][A-Za-z]{2})?$";
    NSPredicate *emailPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailPredicate evaluateWithObject:email];
}

- (BOOL)isValidateEmail
{
    return [[self class] isValidateEmail:self];
}

+ (BOOL)isOnlyDigitLetterUnderline:(NSString *)string;
{
    if (![self isValidateString:string]) {
        return NO;
    }
    NSString *regex = @"^[A-Za-z0-9_]{1,300}$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:string];
}

+ (BOOL)isOnlyDigit:(NSString *)string;
{
    if (![self isValidateString:string]) {
        return NO;
    }
    NSString *regex = @"^[0-9]*$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:string];
}

- (BOOL)isOnlyDigit
{
    return [[self class] isOnlyDigit:self];
}

- (BOOL)isOnlyDigitLetterUnderline
{
    return [[self class] isOnlyDigitLetterUnderline:self];
}

+ (BOOL)isOnlyDigitLetter:(NSString *)string;
{
    if (![self isValidateString:string]) {
        return NO;
    }
    NSString *regex = @"^[A-Za-z0-9]{1,300}$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:string];
}

- (BOOL)isOnlyDigitLetter
{
    return [[self class] isOnlyDigitLetter:self];
}

+ (BOOL)isPwd:(NSString*)string
{
    if (string == nil || [string length] == 0)
    {
        return NO;
    }
    
    if ([string length] < 8 || [string length] > 32)
    {
        return NO;
    }
    
    BOOL haveUppercase=NO, haveLowercase=NO, haveDecimalDigit=NO;
    if (string && string.length>0) {
        NSRange r;
        r = [string rangeOfCharacterFromSet:[NSCharacterSet uppercaseLetterCharacterSet]];
        haveUppercase = r.length > 0;
        
        r = [string rangeOfCharacterFromSet:[NSCharacterSet lowercaseLetterCharacterSet]];
        haveLowercase = r.length > 0;
        
        r = [string rangeOfCharacterFromSet:[NSCharacterSet decimalDigitCharacterSet]];
        haveDecimalDigit = r.length > 0;
    }
    return (haveUppercase && haveLowercase && haveDecimalDigit);
}

+ (BOOL)isContainsTwoEmoji:(NSString *)string
{
    __block BOOL isEomji = NO;
    [string enumerateSubstringsInRange:NSMakeRange(0, [string length]) options:NSStringEnumerationByComposedCharacterSequences usingBlock:
     ^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
         const unichar hs = [substring characterAtIndex:0];
         //         NSLog(@"hs++++++++%04x",hs);
         if (0xd800 <= hs && hs <= 0xdbff) {
             if (substring.length > 1) {
                 const unichar ls = [substring characterAtIndex:1];
                 const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
                 if (0x1d000 <= uc && uc <= 0x1f77f)
                 {
                     isEomji = YES;
                 }
                 //                 NSLog(@"uc++++++++%04x",uc);
             }
         } else if (substring.length > 1) {
             const unichar ls = [substring characterAtIndex:1];
             if (ls == 0x20e3|| ls ==0xfe0f) {
                 isEomji = YES;
             }
             //             NSLog(@"ls++++++++%04x",ls);
         } else {
             if (0x2100 <= hs && hs <= 0x27ff && hs != 0x263b) {
                 isEomji = YES;
             } else if (0x2B05 <= hs && hs <= 0x2b07) {
                 isEomji = YES;
             } else if (0x2934 <= hs && hs <= 0x2935) {
                 isEomji = YES;
             } else if (0x3297 <= hs && hs <= 0x3299) {
                 isEomji = YES;
             } else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50|| hs == 0x231a ) {
                 isEomji = YES;
             }
         }
         
     }];
    return isEomji;
}

+ (NSString *)formateTimestamp:(NSInteger)timestamp
{
    NSString *result = @"";
    if (timestamp >= 3600) {
        result = [result stringByAppendingFormat:@"%d时", (int)(timestamp / 3600)];
    }
    if (timestamp >= 60) {
        result = [result stringByAppendingFormat:@"%d分", (int)((timestamp % 3600) / 60)];
    }
    result = [result stringByAppendingFormat:@"%d秒", (int)(timestamp % 60)];
    return result;
}

@end







