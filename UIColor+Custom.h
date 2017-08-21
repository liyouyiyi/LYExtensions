//
//  UIColor+Custom.h
//  PurchaseBao
//
//  Created by DarrenXie on 15/11/4.
//  Copyright © 2015年 YeahKa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Custom)

UIColor * ColorRGB(float red, float green, float blue);
UIColor * ColorRGBA(float red, float green, float blue, float alpha);

+ (UIColor *)baseBackgroundColor;

+ (UIColor *)navigationBarColor;
+ (UIColor *)rightLabelColor;

+ (UIColor *)leftTextColor;

+ (UIColor *)redButtonColor;
+ (UIColor *)blackButtonColor;

+ (UIColor *)placeholderColor;

@end
