//
//  UITextField+Custom.m
//  PurchaseBao
//
//  Created by DarrenXie on 15/11/4.
//  Copyright © 2015年 YeahKa. All rights reserved.
//

#import "UITextField+Custom.h"
#import "Extension.h"
#import "Constant.h"

float const TextFieldFontSize = 17.0f;    //textfield的默认字体大小

@implementation UITextField (Custom)

- (void)setPlaceholderText:(NSString *)placeholderText color:(UIColor *)color fontSize:(float)fontSize;
{
    placeholderText = [NSString isValidateString:placeholderText] ? placeholderText : @"";
    NSMutableDictionary *attribute = [NSMutableDictionary dictionary];
    if (color) {
        [attribute setObject:color forKey:NSForegroundColorAttributeName];
    }
    if (fontSize > 0) {
        [attribute setObject:[UIFont systemFontOfSize:fontSize] forKey:NSFontAttributeName];
    }
    //设置段落样式
//    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
//    paragraph.alignment = NSTextAlignmentCenter;
//    [attribute setObject:paragraph forKey:NSParagraphStyleAttributeName];
    
    self.attributedPlaceholder = [[NSAttributedString alloc] initWithString:placeholderText attributes:attribute];
}

- (void)addLeftImage:(UIImage *)image leftXMargin:(CGFloat)leftXMargin rightXMargin:(CGFloat)rightXMargin
{
    if (!image) {
        return;
    }
    
    CGSize imageSize = image.size;
    CGFloat leftViewWidth = imageSize.width + leftXMargin + rightXMargin;
    UIView *leftView = [[UIView alloc] init];
    leftView.frame = CGRectMake(0, 0, leftViewWidth, self.height);
    
    CGFloat imageViewYMargin = (self.height - imageSize.height) / 2.0;
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.frame = CGRectMake(leftXMargin, imageViewYMargin, imageSize.width, imageSize.height);
    imageView.image = image;
    [leftView addSubview:imageView];
    
    self.leftViewMode = UITextFieldViewModeAlways;
    self.leftView = leftView;
}

- (void)addLeftImage:(UIImage *)image xMargin:(CGFloat)xMargin {
    [self addLeftImage:image leftXMargin:xMargin rightXMargin:xMargin];
}

- (void)addLeftImageName:(NSString *)imageName leftXMargin:(CGFloat)leftXMargin rightXMargin:(CGFloat)rightXMargin
{
    if (![NSString isValidateString:imageName]) {
        return;
    }
    UIImage *image = [UIImage imageNamed:imageName];
    [self addLeftImage:image leftXMargin:leftXMargin rightXMargin:rightXMargin];
}

- (void)addLeftImageName:(NSString *)imageName xMargin:(CGFloat)xMargin;
{
    if (![NSString isValidateString:imageName]) {
        return;
    }
    UIImage *image = [UIImage imageNamed:imageName];
    [self addLeftImage:image xMargin:xMargin];
}

- (void)addRightImage:(UIImage *)image xMargin:(CGFloat)xMargin target:(id)target action:(SEL)action ;
{
    return[self addRightImage:image xMargin:xMargin target:target action:action buttonTag:0];
}

- (void)addRightImage:(UIImage *)image xMargin:(CGFloat)xMargin target:(id)target action:(SEL)action buttonTag:(NSInteger)buttonTag
{
    if (!image) {
//        return;
    }
    
    CGSize imageSize = image ? image.size : CGSizeZero;
    CGFloat rightViewWidth = imageSize.width + xMargin * 2.0;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, rightViewWidth, self.height);
    button.tag = buttonTag;
    if (target && action && [target respondsToSelector:action]) {
        [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    }
    if (image) {
        [button setImage:image forState:UIControlStateNormal];
    }
    
    self.rightViewMode = UITextFieldViewModeAlways;
    self.rightView = button;
}

- (void)addRightImageName:(NSString *)imageName xMargin:(CGFloat)xMargin target:(id)target action:(SEL)action buttonTag:(NSInteger)buttonTag
{
    if (![NSString isValidateString:imageName]) {
        return;
    }
    UIImage *image = [UIImage imageNamed:imageName];
    [self addRightImage:image xMargin:xMargin target:target action:action buttonTag:buttonTag];
}

- (void)addRightImageName:(NSString *)imageName xMargin:(CGFloat)xMargin target:(id)target action:(SEL)action
{
    if (![NSString isValidateString:imageName]) {
        return;
    }
    UIImage *image = [UIImage imageNamed:imageName];
    [self addRightImage:image xMargin:xMargin target:target action:action buttonTag:0];
}

- (void)addRightText:(NSString *)text leftXMargin:(CGFloat)leftXMargin rightXMargin:(CGFloat)rightXMargin
{
    if (![NSString isValidateString:text]) {
        text = @"";
    }
    CGFloat fontSize = TextFieldFontSize;
    CGFloat labelHeight = 20;
    CGFloat labelWidth = [text widthByLimitHeight:labelHeight font:[UIFont systemFontOfSize:fontSize]];
    
    CGFloat rightViewWidth = labelWidth + leftXMargin + rightXMargin;
    UIView *rightView = [[UIView alloc] init];
    rightView.frame = CGRectMake(0, 0, rightViewWidth, self.height);
    
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(leftXMargin, (self.height - labelHeight) / 2.0, labelWidth, labelHeight);
    label.text = text;
    label.textColor = [UIColor leftTextColor];
    label.font = [UIFont systemFontOfSize:fontSize];
    label.textAlignment = NSTextAlignmentLeft;
    [rightView addSubview:label];
    
    self.rightViewMode = UITextFieldViewModeAlways;
    self.rightView = rightView;
}

- (void)addLeftText:(NSString *)text leftXMargin:(CGFloat)leftXMargin rightXMargin:(CGFloat)rightXMargin font:(UIFont *)font textColor:(UIColor *)textColor
{
    if (![NSString isValidateString:text]) {
        text = @"";
    }
    CGFloat fontSize = TextFieldFontSize;
    CGFloat labelHeight = 20;
    CGFloat labelWidth = [text widthByLimitHeight:labelHeight font:[UIFont systemFontOfSize:fontSize]];
    
    CGFloat leftViewWidth = labelWidth + leftXMargin + rightXMargin;
    UIView *leftView = [[UIView alloc] init];
    leftView.frame = CGRectMake(0, 0, leftViewWidth, self.height);
    
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(leftXMargin, (self.height - labelHeight) / 2.0, labelWidth, labelHeight);
    label.text = text;
    label.textColor = textColor ? textColor : [self leftTextColor];
    label.font = font ? font : [UIFont systemFontOfSize:fontSize];
    label.textAlignment = NSTextAlignmentLeft;
    [leftView addSubview:label];
    
    self.leftViewMode = UITextFieldViewModeAlways;
    self.leftView = leftView;
}

- (void)addLeftText:(NSString *)text leftXMargin:(CGFloat)leftXMargin rightXMargin:(CGFloat)rightXMargin
{
    if (![NSString isValidateString:text]) {
        text = @"";
    }
    [self addLeftText:text leftXMargin:leftXMargin rightXMargin:rightXMargin font:nil textColor:nil];
}

- (void)addLeftText:(NSString *)text xMargin:(CGFloat)xMargin
{
    [self addLeftText:text leftXMargin:xMargin rightXMargin:xMargin];
}

- (void)setNomalStyle
{
    self.borderStyle = UITextBorderStyleNone;
//    self.background = [UIImage imageNamed:@"input_bg"];
    self.textColor = ColorRGB(52.0, 52.0, 52.0);
    self.font = [UIFont systemFontOfSize:TextFieldFontSize];
    self.textAlignment = NSTextAlignmentLeft;
}

- (void)setLeftMargin:(CGFloat)xMargin
{
    if (xMargin <= 0) {
        return;
    }
    [self addLeftText:@"" xMargin:xMargin / 2.0];
}

- (void)setNomalStyleWithLeftText:(NSString *)leftText placeholderText:(NSString *)placeholderText
{
    [self setNomalStyle];
    [self setPlaceholderText:placeholderText color:ColorRGB(0xcb, 0xcb, 0xcb) fontSize:TextFieldFontSize];
    [self addLeftText:leftText xMargin:10];
    [self addRightImage:nil xMargin:5 target:nil action:nil];
}

- (void)updateTextAlignment
{
    if ([NSString isValidateString:self.text]) {
        self.textAlignment = NSTextAlignmentRight;
    } else {
        self.textAlignment = NSTextAlignmentLeft;
    }
}

- (void)setupNumberPadKeyboard
{
    self.keyboardType = UIKeyboardTypeNumberPad;
    
    UIView *accessoryView = [[UIView alloc] init];
    accessoryView.frame = CGRectMake(0, 0, 320, 30);
    accessoryView.backgroundColor = ColorRGB(208, 216, 217);
    
    UIButton *doneButton = [UIButton buttonWithType:UIButtonTypeCustom];
    doneButton.frame = CGRectMake(SCREEN_WIDTH - 60, 0, 60, 30);
    [doneButton setTitle:@"完成" forState:UIControlStateNormal];
    [doneButton addTarget:self action:@selector(done:) forControlEvents:UIControlEventTouchUpInside];
    [accessoryView addSubview:doneButton];
    
    self.inputAccessoryView = accessoryView;
}

- (void)done:(UIButton *)button
{
    UIView *view = [[button superview] superview];
    NSLog(@"view = %@", view);
    if ([self canResignFirstResponder]) {
        [self resignFirstResponder];
    }
}

- (UIColor *)leftTextColor
{
    return [UIColor colorWithRed:156.0/255.0 green:164.0/255.0 blue:161.0/255.0 alpha:1];
}

@end
