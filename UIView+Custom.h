//
//  UIView+Custom.h
//  NavigationBarDemo
//
//  Created by DarrenXie on 15/6/9.
//  Copyright (c) 2015年 YeahKa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Custom)

+ (UIView *)viewWithFrame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor;
/*!
 * width和height是固定的
 */
+ (UIView *)createRedDotViewWithFrame:(CGRect)frame number:(NSInteger)number;

- (CGFloat)top;
- (CGFloat)bottom;
- (CGFloat)left;
- (CGFloat)right;
- (CGFloat)width;
- (CGFloat)height;

- (void)setX:(CGFloat)x;
- (void)setY:(CGFloat)y;
- (void)setWidth:(CGFloat)width;
- (void)setHeight:(CGFloat)width;

- (void)setCenterX:(CGFloat)centerX;
- (CGFloat)centerX;
- (void)setCenterY:(CGFloat)centerY;
- (CGFloat)centerY;

+ (UIView *)lineView:(CGFloat)leftMargin topMargin:(CGFloat)topMargin;
+ (UIView *)lineView:(CGFloat)leftMargin rightMargin:(CGFloat)rightMargin topMargin:(CGFloat)topMargin;

/*!
 * 变成圆形或椭圆
 */
- (void)roundness;

/*!
 * 删除所有的子视图
 */
- (void)removeAllSubViews;

/*!
 * 把view转换成image
 */
- (UIImage *)convertToImage;

@end


@interface UIView (PurchaseBao)

+ (UIView *)headerView;
- (void)dashedLineBorder;

- (id)with:(void(^)(id v))setting;

@end
