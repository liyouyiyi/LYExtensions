//
//  UITextField+Custom.h
//  PurchaseBao
//
//  Created by DarrenXie on 15/11/4.
//  Copyright © 2015年 YeahKa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (Custom)

- (void)setPlaceholderText:(NSString *)placeholderText color:(UIColor *)color fontSize:(float)fontSize;

- (void)addLeftImage:(UIImage *)image leftXMargin:(CGFloat)leftXMargin rightXMargin:(CGFloat)rightXMargin;
- (void)addLeftImage:(UIImage *)image xMargin:(CGFloat)xMargin;
- (void)addLeftImageName:(NSString *)imageName leftXMargin:(CGFloat)leftXMargin rightXMargin:(CGFloat)rightXMargin;
- (void)addLeftImageName:(NSString *)imageName xMargin:(CGFloat)xMargin;

- (void)addRightImage:(UIImage *)image xMargin:(CGFloat)xMargin target:(id)target action:(SEL)action;
- (void)addRightImage:(UIImage *)image xMargin:(CGFloat)xMargin target:(id)target action:(SEL)action buttonTag:(NSInteger)buttonTag;
- (void)addRightImageName:(NSString *)imageName xMargin:(CGFloat)xMargin target:(id)target action:(SEL)action;
- (void)addRightImageName:(NSString *)imageName xMargin:(CGFloat)xMargin target:(id)target action:(SEL)action buttonTag:(NSInteger)buttonTag;
- (void)addRightText:(NSString *)text leftXMargin:(CGFloat)leftXMargin rightXMargin:(CGFloat)rightXMargin;

- (void)addLeftText:(NSString *)text xMargin:(CGFloat)xMargin;

- (void)setNomalStyle;

- (void)addLeftText:(NSString *)text leftXMargin:(CGFloat)leftXMargin rightXMargin:(CGFloat)rightXMargin font:(UIFont *)font textColor:(UIColor *)textColor;
- (void)addLeftText:(NSString *)text leftXMargin:(CGFloat)leftXMargin rightXMargin:(CGFloat)rightXMargin;
- (void)setLeftMargin:(CGFloat)xMargin;

- (void)setNomalStyleWithLeftText:(NSString *)leftText placeholderText:(NSString *)placeholderText;
- (void)updateTextAlignment;
- (void)setupNumberPadKeyboard;

@end
