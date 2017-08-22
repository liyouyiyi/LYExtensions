//
//  UIView+Custom.m
//  NavigationBarDemo
//
//  Created by DarrenXie on 15/6/9.
//  Copyright (c) 2015年 YeahKa. All rights reserved.
//

#import "UIView+Custom.h"
#import "Constant.h"
#import "UIColor+Custom.h"
#import "UILabel+Custom.h"
#import "UIImage+Custom.h"
#import "NSString+Custom.h"

@implementation UIView (Custom)

+ (UIView *)viewWithFrame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor
{
    UIView *view = [[UIView alloc] init];
    view.frame = frame;
    view.backgroundColor = backgroundColor;
    return view;
}

+ (UIView *)createRedDotViewWithFrame:(CGRect)frame number:(NSInteger)number
{
    CGFloat width = frame.size.width;
    CGFloat height = frame.size.height;
//    frame = CGRectMake(frame.origin.x, frame.origin.y, width, height);
    UIView *redDotView = [[self class] viewWithFrame:frame backgroundColor:ColorRGB(0xee, 0x3e, 0x00)];
    redDotView.layer.cornerRadius = width / 2.0;
    redDotView.clipsToBounds = YES;
    
    CGRect labelFrame = CGRectMake(0, 0, width, height);
    NSString *text = [NSString stringWithFormat:@"%d", (int)number];
    if (number < 0) {
        text = @"";
    } else {
        UILabel *numberLabel = [UILabel createLableWithFrame:labelFrame text:text fontSize:10 textAlignment:NSTextAlignmentCenter textColor:[UIColor whiteColor]];
        [redDotView addSubview:numberLabel];
    }
    
    return redDotView;
}



- (CGFloat)top
{
    CGRect frame = self.frame;
    return frame.origin.y;
}

- (CGFloat)bottom
{
    CGRect frame = self.frame;
    CGFloat bottom = frame.origin.y + frame.size.height;
    return bottom;
}

- (CGFloat)left
{
    CGRect frame = self.frame;
    return frame.origin.x;
}

- (CGFloat)right
{
    CGRect frame = self.frame;
    CGFloat bottom = frame.origin.x + frame.size.width;
    return bottom;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    self.frame = CGRectMake(x, frame.origin.y, frame.size.width, frame.size.height);
}

- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    self.frame = CGRectMake(frame.origin.x, y, frame.size.width, frame.size.height);
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    self.frame = CGRectMake(frame.origin.x, frame.origin.y, width, frame.size.height);
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    self.frame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, height);
}

- (void)setCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (CGFloat)centerX
{
    return self.center.x;
}

- (void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (CGFloat)centerY
{
    return self.center.y;
}

+ (UIView *)lineView:(CGFloat)leftMargin topMargin:(CGFloat)topMargin
{
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(leftMargin, topMargin - 0.5, SCREEN_WIDTH, 0.5)];
    line.backgroundColor = ColorRGB(0xCF, 0xCF, 0xCF);
    return line;
}

+ (UIView *)lineView:(CGFloat)leftMargin rightMargin:(CGFloat)rightMargin topMargin:(CGFloat)topMargin
{
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(leftMargin, topMargin - 0.5, SCREEN_WIDTH - leftMargin - rightMargin, 0.5)];
    line.backgroundColor = ColorRGB(0xCF, 0xCF, 0xCF);
    return line;
}

/*!
 * 变成圆形或椭圆
 */
- (void)roundness
{
    self.layer.cornerRadius = MIN(self.width, self.height) / 2.0;
    self.clipsToBounds = YES;
}

/*!
 * 删除所有的子视图
 */
- (void)removeAllSubViews
{
    NSArray *subViews = [self subviews];
    if (!subViews) {
        return;
    }
    for (UIView *subView in subViews) {
        [subView removeFromSuperview];
    }
}

//把UIView转换成图片UIImage
- (UIImage *)convertToImage
{
    CGSize size = self.bounds.size;
    // 下面方法，第一个参数表示区域大小。第二个参数表示是否是非透明的。如果需要显示半透明效果，需要传NO，否则传YES。第三个参数就是屏幕密度了
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end


@implementation UIView(PurchaseBao)

+ (UIView *)headerView
{
    UIView *headerView = [[UIView alloc] init];
    headerView.backgroundColor = [UIColor baseBackgroundColor];
    
    return headerView;
}

/*!
 * 虚线边框
 */
- (void)dashedLineBorder
{
    CAShapeLayer *border = [CAShapeLayer layer];
    border.strokeColor = [UIColor lightGrayColor].CGColor;
    border.fillColor = nil;
    border.path = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:2.0].CGPath;
    border.frame = self.bounds;
    border.lineWidth = 1.f;
    border.lineCap = @"square";
    border.lineDashPattern = @[@2, @4];
//    [self.layer addSublayer:border];  
}

- (id)with:(void(^)(id v))setting {
    if (setting) {
        setting(self);
    }
    return self;
}

@end
