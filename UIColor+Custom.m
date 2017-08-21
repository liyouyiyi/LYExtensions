//
//  UIColor+Custom.m
//  PurchaseBao
//
//  Created by DarrenXie on 15/11/4.
//  Copyright © 2015年 YeahKa. All rights reserved.
//

#import "UIColor+Custom.h"

@implementation UIColor (Custom)

UIColor * ColorRGB(float red, float green, float blue)
{
    red = (red < 0 ? 0 : red) > 255 ? 255 : red;
    green = (green < 0 ? 0 : green) > 255 ? 255 : green;
    blue = (blue < 0 ? 0 : blue) > 255 ? 255 : blue;
    UIColor *color = [UIColor colorWithRed:red / 255.0 green:green / 255.0 blue:blue / 255.0 alpha:1];
    return color;
}

UIColor * ColorRGBA(float red, float green, float blue, float alpha)
{
    red = (red < 0 ? 0 : red) > 255 ? 255 : red;
    green = (green < 0 ? 0 : green) > 255 ? 255 : green;
    blue = (blue < 0 ? 0 : blue) > 255 ? 255 : blue;
    alpha = (alpha < 0 ? 0 : alpha) > 1 ? 1 : alpha;
    UIColor *color = [UIColor colorWithRed:red / 255.0 green:green / 255.0 blue:blue / 255.0 alpha:alpha];
    return color;
}

+ (UIColor *)baseBackgroundColor
{
    return [UIColor colorWithRed:14/255.0 green:14/255.0 blue:14/255.0 alpha:1];
}

+ (UIColor *)navigationBarColor
{
    return ColorRGB(0x12, 0x9c, 0xef);
}

+ (UIColor *)rightLabelColor
{
    return [UIColor colorWithRed:0x97/255.0 green:0x97/255.0 blue:0x97/255.0 alpha:1];
}

+ (UIColor *)leftTextColor;
{
    return [UIColor colorWithRed:156.0/255.0 green:164.0/255.0 blue:161.0/255.0 alpha:1];
}

+ (UIColor *)redButtonColor
{
    return [UIColor colorWithRed:230.0/255.0 green:1.0/255.0 blue:34.0/255.0 alpha:1];
}

+ (UIColor *)blackButtonColor
{
    return [UIColor colorWithRed:52.0/255.0 green:51.0/255.0 blue:51.0/255.0 alpha:1];
}

+ (UIColor *)placeholderColor;
{
    return [UIColor colorWithRed:219.0/255.0 green:219.0/255.0 blue:219.0/255.0 alpha:1];
}

@end
