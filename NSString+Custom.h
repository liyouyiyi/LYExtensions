//
//  NSString+Custom.h
//
//
//  Created by DarrenXie on 15/10/30.
//  Copyright © 2015年 YeahKa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>




@interface NSString (Custom)

FOUNDATION_EXPORT NSString *NSStringFromInteger(NSInteger intValue);
FOUNDATION_EXPORT NSString *NSStringFromFloat(float floatValue);

/*!
 * 去除空格和回车,换行
 */
- (NSString *)trimSpaceString;

/*!
 * 避免string=nil
 */
+ (NSString *)stringByAvoidNil:(NSString *)string;

/*!
 * 计算字符串放入lable的宽度
 */
- (float)widthByLimitHeight:(float)height fontSize:(float)fontSize;
- (float)widthByLimitHeight:(float)height font:(UIFont *)font;

/*!
 * 计算字符串放入lable的高度
 */
- (float)heightByLimitWidth:(float)width fontSize:(float)fontSize;
- (float)heightByLimitWidth:(float)width font:(UIFont *)font;

- (CGSize)sizeWithFont:(UIFont *)font maxWidth:(CGFloat)maxWidth;

/*!
 * 中文转拼音
 */
- (NSString *)chineseToPhonetic;

/*!
 * 中文转数字
 */
- (NSString *)chineseToDigit;

/*!
 * 16进制字符串转data
 * 7472616bc6b9d0c6efc9a246ba5984c64bd9d800,7472616b3fbcd0c685cba24652083c3f56dbd800,7472616be6bdd0c6c6cea2469281693fccdcd800,7472616b11bdd0c65ad2a24637086b3f3dded800,7472616bc6b9d0c6edd3a2469281693fb3dfd800,7472616b2eb6d0c613d4a2462626663f34e1d800,7472616be3b2d0c6d0d2a2463692613fc4e2d800,7472616bc8b0d0c607d0a2464e6f5f3f5be4d800,7472616b87b1d0c663cca24661c76d3fc3e5d800,7472616b97b4d0c6a2caa24657e0613f52e7d800,7472616be9b7d0c6c1c9a246c2c55b3ff5e8d800,7472616bc7b9d0c697cca246b954593fa0ead800,7472616bd1b9d0c62acfa24681d6243ff7ecd800
 */
+ (NSData *)convertHexStrToData:(NSString *)str;

/*!
 * 16进制字符串转data
 * 7472616bc6b9d0c6efc9a246ba5984c64bd9d800,7472616b3fbcd0c685cba24652083c3f56dbd800,7472616be6bdd0c6c6cea2469281693fccdcd800,7472616b11bdd0c65ad2a24637086b3f3dded800,7472616bc6b9d0c6edd3a2469281693fb3dfd800,7472616b2eb6d0c613d4a2462626663f34e1d800,7472616be3b2d0c6d0d2a2463692613fc4e2d800,7472616bc8b0d0c607d0a2464e6f5f3f5be4d800,7472616b87b1d0c663cca24661c76d3fc3e5d800,7472616b97b4d0c6a2caa24657e0613f52e7d800,7472616be9b7d0c6c1c9a246c2c55b3ff5e8d800,7472616bc7b9d0c697cca246b954593fa0ead800,7472616bd1b9d0c62acfa24681d6243ff7ecd800
 */
- (NSData *)convertHexStrToData;

/*!
 * 把16进制字符串转成10进制数字
 * @"10" - 16
 */
+ (long long)convertHexStrToLongLong:(NSString *)str;

/*!
 * 把16进制字符串转成10进制数字
 * @"10" - 16
 */
- (long long)convertHexStrToLongLong;

/*!
 * 转换成16进制格式的字符串
 */
- (NSString *)convertToHexString;

/*!
 * byte数组转字符串
 */
- (NSString *)stringWithBytes:(Byte *)bytes length:(NSInteger)length;

/*!
 * 版本号对比
 * self > versionSting  返回 1
 * self == versionSting  返回 0
 * self < versionSting  返回 -1
 */
- (NSInteger)versionCompareWithVersionString:(NSString *)versionSting;

@end



/*!
 * 验证字符串的合法性
 */
@interface NSString (Verification)

/*!
 * 是否为合法的字符串
 * string!=nil && string!=NSNull && string.length>0
 */
+ (BOOL)isValidateString:(NSString *)string;

- (NSString *)safeString;

/*!
 * 是否为正整数，成功返回整数数值，失败返回-1
 */
- (NSInteger)isPositiveInteger;

/*!
 * 是否为正浮点型数,成功返回浮点数值，失败返回-1
 */
- (float)isPositiveFloat;

/*!
 * 是否为合法的email地址
 */
- (BOOL)isValidateEmail;
+ (BOOL)isValidateEmail:(NSString *)email;

- (BOOL)isChineseString;
+ (BOOL)isChineseString:(NSString *)string;

//获取拼音首字母(传入汉字字符串, 返回大写拼音首字母)
+ (NSString *)firstCharactor:(NSString *)aString;
- (NSString *)firstCharactor;

+ (BOOL)isValidateMobile:(NSString *)mobile;
- (BOOL)isValidateMobile;

+ (BOOL)isOnlyDigit:(NSString *)string;
- (BOOL)isOnlyDigit;

+ (BOOL)isOnlyDigitLetterUnderline:(NSString *)string;
- (BOOL)isOnlyDigitLetterUnderline;

+ (BOOL)isOnlyDigitLetter:(NSString *)string;
- (BOOL)isOnlyDigitLetter;

+ (BOOL)isPwd:(NSString*)string;

/*!
 * 把时间戳转成， xx时xx分xx秒
 */
+ (NSString *)formateTimestamp:(NSInteger)timestamp;

@end






