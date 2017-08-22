//
//  NSString+Custome.h
//  XSTravel
//
//  Created by 謝傳友 on 15/6/6.
//  Copyright (c) 2015年 XieShou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Custom)

/*!
 * 去除空格和回车,换行
 */
- (NSString *)trimSpaceString;

/*!
 * 避免空字符
 */
+ (NSString *)stringByAvoidNil:(NSString *)string;

/*!
 * 计算字符串放入lable的宽度
 */
- (CGFloat)widthByLimitHeight:(CGFloat)height fontSize:(CGFloat)fontSize;

/*!
 * 计算字符串放入lable的高度
 */
- (CGFloat)heightByLimitWidth:(CGFloat)width fontSize:(CGFloat)fontSize;

@end



/*!
 * 验证字符串的合法性
 */
@interface NSString (Verification)

/*!
 * 是否为正整数，成功返回整数数值，失败返回-1
 */
- (NSInteger)isPositiveInteger;

/*!
 * 是否为正浮点型数,成功返回浮点数值，失败返回-1
 */
- (float)isPositiveFloat;

- (BOOL)isValidateEmail;

@end

