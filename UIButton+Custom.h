//
//  UIButton+Custom.h
//  PayBao
//
//  Created by 謝傳友 on 15/7/18.
//  Copyright (c) 2015年 PAYBAO. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Custom)

+ (UIButton *)buttonWithType:(UIButtonType)type
                       frame:(CGRect)frame
                       title:(NSString *)title
                  titleColor:(UIColor *)titleColor
               titleFontSize:(float)titleFontSize
             backgroundColor:(UIColor *)backgroundColor
       normarBackgroundImage:(UIImage *)normarBackgroundImage
    highLightBackgroundImage:(UIImage *)highLightBackgroundImage;

+ (UIButton *)buttonWithType:(UIButtonType)type
                       frame:(CGRect)frame
                       title:(NSString *)title
                  titleColor:(UIColor *)titleColor
               titleFontSize:(float)titleFontSize
             backgroundColor:(UIColor *)backgroundColor
                 normarImage:(UIImage *)normarImage
              highLightImage:(UIImage *)highLightImage;

+ (UIButton *)createPlusSignButton;
+ (UIButton *)createCloseSignButton;

- (void)loadImageWithURLString:(NSString *)urlString;
- (void)loadBackgroundImageWithURLString:(NSString *)urlString;
- (void)loadBackgroundImageWithURLString:(NSString *)urlString complete:(void (^)(UIImage *image))complete;

/*!
 * 设置内容（图片和title）垂直居中，图片在上面，title在下面
 * @param ySpace 图片和文字的间距
 */
- (void)setupContentVerticalAlignmentWithYSpace:(CGFloat)ySpace;

@end
