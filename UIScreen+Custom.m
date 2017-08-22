//
//  UIScreen+Custom.m
//  PurchaseBao
//
//  Created by DarrenXie on 15/11/4.
//  Copyright © 2015年 YeahKa. All rights reserved.
//

#import "UIScreen+Custom.h"

@implementation UIScreen (Custom)

+ (CGFloat)screenWidth;
{
    return [[self class] mainScreen].bounds.size.width;
}

+ (CGFloat)screenHeight;
{
    return [[self class] mainScreen].bounds.size.height;
}

@end
