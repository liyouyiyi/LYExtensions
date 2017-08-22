//
//  UILabel+Custom.h
//  PayBao
//
//  Created by 謝傳友 on 15/7/25.
//  Copyright (c) 2015年 PAYBAO. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Custom)

+ (UILabel *)createLableWithFrame:(CGRect)frame text:(NSString *)text;
+ (UILabel *)createLableWithFrame:(CGRect)frame text:(NSString *)text fontSize:(NSInteger)fontSzie;
+ (UILabel *)createLableWithFrame:(CGRect)frame text:(NSString *)text fontSize:(NSInteger)fontSzie textAlignment:(NSTextAlignment)textAlignment;
+ (UILabel *)createLableWithFrame:(CGRect)frame text:(NSString *)text fontSize:(NSInteger)fontSzie textAlignment:(NSTextAlignment)textAlignment textColor:(UIColor *)textColor;
+ (UILabel *)createLableWithFrame:(CGRect)frame text:(NSString *)text fontSize:(NSInteger)fontSzie textAlignment:(NSTextAlignment)textAlignment textColor:(UIColor *)textColor backgroundColor:(UIColor *)backgroundColor;

- (CGFloat)widthByLimitHeight:(CGFloat)height;
- (CGFloat)heightByLimitWidth:(CGFloat)width;

+ (CGFloat)heightByLimitWidth:(CGFloat)width text:(NSString *)text font:(UIFont *)font;
- (CGSize)sizeWithMaxWidth:(CGFloat)maxWidth;
@end
