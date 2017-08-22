//
//  UILabel+Custom.m
//  PayBao
//
//  Created by 謝傳友 on 15/7/25.
//  Copyright (c) 2015年 PAYBAO. All rights reserved.
//

#import "UILabel+Custom.h"

@implementation UILabel (Custom)

+ (UILabel *)createLableWithFrame:(CGRect)frame text:(NSString *)text
{
    UILabel *label = [[UILabel alloc] init];
    label.frame = frame;
    label.text = text;
    return label;
}

+ (UILabel *)createLableWithFrame:(CGRect)frame text:(NSString *)text fontSize:(NSInteger)fontSzie
{
    UILabel *label = [[self class] createLableWithFrame:frame text:text];
    label.font = [UIFont systemFontOfSize:fontSzie];
    return label;
}

+ (UILabel *)createLableWithFrame:(CGRect)frame text:(NSString *)text fontSize:(NSInteger)fontSzie textAlignment:(NSTextAlignment)textAlignment
{
    UILabel *label = [[self class] createLableWithFrame:frame text:text fontSize:fontSzie];
    label.textAlignment = textAlignment;
    return label;
}

+ (UILabel *)createLableWithFrame:(CGRect)frame text:(NSString *)text fontSize:(NSInteger)fontSzie textAlignment:(NSTextAlignment)textAlignment textColor:(UIColor *)textColor
{
    UILabel *label = [[self class] createLableWithFrame:frame text:text fontSize:fontSzie textAlignment:textAlignment];
    label.textColor = textColor;
    return label;
}

+ (UILabel *)createLableWithFrame:(CGRect)frame text:(NSString *)text fontSize:(NSInteger)fontSzie textAlignment:(NSTextAlignment)textAlignment textColor:(UIColor *)textColor backgroundColor:(UIColor *)backgroundColor
{
    UILabel *label = [[self class] createLableWithFrame:frame text:text fontSize:fontSzie textAlignment:textAlignment textColor:textColor];
    label.backgroundColor = backgroundColor;
    return label;
}

- (CGFloat)widthByLimitHeight:(CGFloat)height
{
    CGSize size = CGSizeMake(0, height);
    NSDictionary *attribute = @{NSFontAttributeName: self.font};
    CGRect frame = [self.text boundingRectWithSize:size options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute context:nil];
    
    return frame.size.width;
}

- (CGFloat)heightByLimitWidth:(CGFloat)width
{
    return [[self class] heightByLimitWidth:width text:self.text font:self.font];
}

+ (CGFloat)heightByLimitWidth:(CGFloat)width text:(NSString *)text font:(UIFont *)font
{
    CGFloat height = 0;
    CGSize size = CGSizeMake(width, 0);
    NSDictionary *attribute = @{NSFontAttributeName: font};
    CGRect frame = [text boundingRectWithSize:size options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute context:nil];
    height = frame.size.height;
    return height;
}

- (CGSize)sizeWithMaxWidth:(CGFloat)maxWidth
{
    CGRect rect = [self textRectForBounds:CGRectMake(0, 0, MAXFLOAT, MAXFLOAT) limitedToNumberOfLines:0];
    if (rect.size.width < maxWidth) {
        return rect.size;
    }
    
    rect = [self textRectForBounds:CGRectMake(0, 0, maxWidth, MAXFLOAT) limitedToNumberOfLines:0];
    
    return rect.size;
}


@end
