//
//  UIViewController+Custom.h
//  PayBao
//
//  Created by 謝傳友 on 15/7/25.
//  Copyright (c) 2015年 PAYBAO. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Custom)

+ (UIViewController *)viewControllerWithId:(NSString *)identifier storyboardName:(NSString *)storyboardName;

- (void)pushToViewControllerWithStoryboardId:(NSString *)storyboardId;
- (BOOL)popToViewControllerWithName:(NSString *)viewControllerName;

- (void)addLeftBarItem:(NSString *)title
             imageName:(NSString *)imageName
            hImageName:(NSString *)hImageName
                target:(id)target
                action:(SEL)action;

- (void)addLeftBarItem:(NSString *)title
                 image:(UIImage *)image
                hImage:(UIImage *)heName
                target:(id)target
                action:(SEL)action;

- (void)addRightBarItem:(NSString *)title
                  image:(UIImage *)image
                 hImage:(UIImage *)hImage
                 target:(id)target
                 action:(SEL)action;

- (void)addRightBarItem:(NSString *)title
              imageName:(NSString *)imageName
             hImageName:(NSString *)hImageName
                 target:(id)target
                 action:(SEL)action;

- (void)setTitle:(NSString *)title color:(UIColor *)color font:(UIFont *)font;
- (void)setNormalTitle:(NSString *)title;

- (void)showLeftBackBarItemWithTitle:(NSString *)title;
- (void)showLeftAvatarBarItemWithImage:(UIImage *)image target:(id)target action:(SEL)action;

- (UIView *)getRightItemView;
- (UIButton *)getRightButton;

- (void)goBack;

@end
