//
//  UIButton+Custom.m
//  PayBao
//
//  Created by 謝傳友 on 15/7/18.
//  Copyright (c) 2015年 PAYBAO. All rights reserved.
//

#import "UIButton+Custom.h"
#import "Constant.h"

@implementation UIButton (Custom)

+ (UIButton *)buttonWithType:(UIButtonType)type
                       frame:(CGRect)frame
                       title:(NSString *)title
                  titleColor:(UIColor *)titleColor
               titleFontSize:(float)titleFontSize
             backgroundColor:(UIColor *)backgroundColor
       normarBackgroundImage:(UIImage *)normarBackgroundImage
    highLightBackgroundImage:(UIImage *)highLightBackgroundImage
{
    UIButton *button = [UIButton buttonWithType:type];
    button.frame = frame;
    [button setTitle:title forState:UIControlStateNormal];
    if (titleColor) {
        [button setTitleColor:titleColor forState:UIControlStateNormal];
    }
    button.titleLabel.font = [UIFont systemFontOfSize:titleFontSize > 0 ? titleFontSize : 0];
    if (backgroundColor) {
        [button setBackgroundColor:backgroundColor];
    }
    if (normarBackgroundImage) {
        [button setBackgroundImage:normarBackgroundImage forState:UIControlStateNormal];
    }
    if (highLightBackgroundImage) {
        [button setBackgroundImage:highLightBackgroundImage forState:UIControlStateHighlighted];
    }
    
    return button;
}

+ (UIButton *)buttonWithType:(UIButtonType)type
                       frame:(CGRect)frame
                       title:(NSString *)title
                  titleColor:(UIColor *)titleColor
               titleFontSize:(float)titleFontSize
             backgroundColor:(UIColor *)backgroundColor
                 normarImage:(UIImage *)normarImage
              highLightImage:(UIImage *)highLightImage
{
    UIButton *button = [UIButton buttonWithType:type];
    button.frame = frame;
    [button setTitle:title forState:UIControlStateNormal];
    if (titleColor) {
        [button setTitleColor:titleColor forState:UIControlStateNormal];
    }
    button.titleLabel.font = [UIFont systemFontOfSize:titleFontSize > 0 ? titleFontSize : 0];
    if (backgroundColor) {
        [button setBackgroundColor:backgroundColor];
    }
    if (normarImage) {
        [button setImage:normarImage forState:UIControlStateNormal];
    }
    if (highLightImage) {
        [button setImage:highLightImage forState:UIControlStateHighlighted];
    }
    
    return button;
}

+ (UIButton *)createPlusSignButton;
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 48, 48);
    button.layer.cornerRadius = 22.5;
    [button setBackgroundImage:[UIImage imageNamed:@"plus_sign"] forState:UIControlStateNormal];
    
    return button;
}

+ (UIButton *)createCloseSignButton
{
    UIButton *closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    closeButton.frame = CGRectMake(0, 0, 48, 48);
    closeButton.layer.cornerRadius = 22.5;
    [closeButton setBackgroundImage:[UIImage imageNamed:@"close_sign"] forState:UIControlStateNormal];
    
    return closeButton;
}

- (void)loadImageWithURLString:(NSString *)urlString
{
    if (!urlString || [urlString isEqualToString:@""]) {
        return;
    }
    NSURL *url = [NSURL URLWithString:urlString];
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:url]];
        dispatch_sync(dispatch_get_main_queue(), ^{
            if (image) {
                [self setImage:image forState:UIControlStateNormal];
            }
        });
    });
}

- (void)loadBackgroundImageWithURLString:(NSString *)urlString
{
    if (!urlString || [urlString isEqualToString:@""]) {
        return;
    }
    NSURL *url = [NSURL URLWithString:urlString];
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:url]];
        dispatch_sync(dispatch_get_main_queue(), ^{
            if (image) {
                [self setBackgroundImage:image forState:UIControlStateNormal];
            }
        });
    });
}

- (void)loadBackgroundImageWithURLString:(NSString *)urlString complete:(void (^)(UIImage *image))complete
{
    if (!urlString || [urlString isEqualToString:@""]) {
        return;
    }
    NSURL *url = [NSURL URLWithString:urlString];
    
    __weak UIButton *weakSelf = self;
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        __strong UIButton *strongSelf = weakSelf;
        UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:url]];
        dispatch_sync(dispatch_get_main_queue(), ^{
            if (image) {
                [strongSelf setBackgroundImage:image forState:UIControlStateNormal];
            }
            complete(image);
        });
    });
}

- (void)setupContentVerticalAlignmentWithYSpace:(CGFloat)ySpace
{
    CGFloat imageWidth = self.imageView.bounds.size.width;
    CGFloat imageHeight = self.imageView.bounds.size.height;
    CGFloat titleWidth = self.titleLabel.bounds.size.width;
    CGFloat titleHeight = self.titleLabel.bounds.size.height;
    
    self.imageEdgeInsets = UIEdgeInsetsMake(-0.5 * (titleHeight + ySpace), 0.5 * titleWidth, 0.5 * (titleHeight + ySpace), -0.5 * titleWidth);
    self.titleEdgeInsets = UIEdgeInsetsMake(0.5 * (imageHeight + ySpace), -0.5*imageWidth, -0.5 * (imageHeight + ySpace), 0.5*imageWidth);
}


@end
