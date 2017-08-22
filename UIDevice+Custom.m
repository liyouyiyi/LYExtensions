//
//  UIDevice+Custom.m
//  PurchaseBao
//
//  Created by DarrenXie on 15/11/3.
//  Copyright © 2015年 YeahKa. All rights reserved.
//

#import "UIDevice+Custom.h"
#import "Constant.h"


@implementation UIDevice (Custom)

+ (float)floatVersion
{
    return [[[UIDevice currentDevice] systemVersion] floatValue];
}

+ (BOOL)IsIPhone4
{
    return [[self class] ScreenHeight] == IPhone4Height;
}

+ (BOOL)IsIPhone5
{
    return [[self class] ScreenHeight] == IPhone5Height;
}

+ (BOOL)IsIPhone6
{
    return [[self class] ScreenHeight] == IPhone6Height;
}

+ (BOOL)IsIPhone6p
{
    return [[self class] ScreenHeight] == IPhone6PHeight;
}

+ (CGFloat)ScreenWidth
{
    return [UIScreen mainScreen].bounds.size.width;
}

+ (CGFloat)ScreenHeight
{
    return [UIScreen mainScreen].bounds.size.height;
}

@end




