//
//  UISegmentedControl+Custom.m
//  PurchaseBao
//
//  Created by DarrenXie on 15/11/12.
//  Copyright © 2015年 YeahKa. All rights reserved.
//

#import "UISegmentedControl+Custom.h"
#import "UIColor+Custom.h"
#import "UIImage+Custom.h"
#import "Constant.h"

@implementation UISegmentedControl (Custom)

+ (instancetype)segmentedControlWithItems:(NSArray *)items
{
    CGFloat segmentedControlHeight = 50.0;

    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:items];
    segmentedControl.frame = CGRectMake(0, 0, SCREEN_WIDTH, segmentedControlHeight);
    segmentedControl.backgroundColor = [UIColor whiteColor];
    segmentedControl.selectedSegmentIndex = 0;
    [segmentedControl setTitleTextAttributes:@{NSForegroundColorAttributeName: ColorRGB(0xd7, 0xd7, 0xd7), NSFontAttributeName: [UIFont systemFontOfSize:16]} forState:UIControlStateNormal];
    [segmentedControl setTitleTextAttributes:@{NSForegroundColorAttributeName: ColorRGB(0xff, 0x7e, 0x00), NSFontAttributeName: [UIFont systemFontOfSize:16]} forState:UIControlStateSelected];
    [segmentedControl setBackgroundImage:[UIImage imageWithColor:[UIColor whiteColor]] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [segmentedControl setBackgroundImage:[UIImage imageNamed:@"segment_bg"] forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
    [segmentedControl setDividerImage:[UIImage imageWithColor:[UIColor whiteColor]] forLeftSegmentState:UIControlStateNormal rightSegmentState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
    [segmentedControl setDividerImage:[UIImage imageWithColor:[UIColor whiteColor]] forLeftSegmentState:UIControlStateNormal rightSegmentState:UIControlStateNormal barMetrics:UIBarMetricsDefault];

    return segmentedControl;
}

@end
