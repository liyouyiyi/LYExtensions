//
//  UIViewController+Custom.m
//  PayBao
//
//  Created by 謝傳友 on 15/7/25.
//  Copyright (c) 2015年 PAYBAO. All rights reserved.
//

#import "UIViewController+Custom.h"
#import "Extension.h"
#import "Constant.h"

static NSInteger const NavigationRightButtonTag = 334;
static CGFloat const NavigationBarTitleSize = 18.0;
static CGFloat const NavigationBarButtonItemSize = 15.0;


@implementation UIViewController (Custom)

+ (UIViewController *)viewControllerWithId:(NSString *)identifier storyboardName:(NSString *)storyboardName
{
    if (![NSString isValidateString:identifier]) return nil;
    if (![NSString isValidateString:storyboardName]) storyboardName = @"Main";
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle:[NSBundle mainBundle]];
    UIViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:identifier];
    return viewController;
}

- (void)pushToViewControllerWithStoryboardId:(NSString *)storyboardId
{
    if (!storyboardId || [[storyboardId trimSpaceString] isEqualToString:@""]) {
        return;
    }
    UIViewController *destination = [[self class] viewControllerWithId:storyboardId storyboardName:nil];
    if (!destination || ![destination isKindOfClass:[UIViewController class]]) {
        return;
    }
    [self.navigationController pushViewController:destination animated:YES];
}

- (BOOL)popToViewControllerWithName:(NSString *)viewControllerName
{
    if (!viewControllerName || [[viewControllerName trimSpaceString] isEqualToString:@""]) {
        return NO;
    }
    NSArray *viewControllers = self.navigationController.viewControllers;
    for (UIViewController *viewController in viewControllers) {
        if ([viewController isMemberOfClass:NSClassFromString(viewControllerName)]) {
            [self.navigationController popToViewController:viewController animated:YES];
            return YES;
        }
    }
    return NO;
}

- (void)addLeftBarItem:(NSString *)title
             imageName:(NSString *)imageName
            hImageName:(NSString *)hImageName
                target:(id)target
                action:(SEL)action;
{
    UIImage *image = [UIImage imageNamed:imageName];
    UIImage *hImage = [UIImage imageNamed:hImageName];
    [self addLeftBarItem:title image:image hImage:hImage target:target action:action];
}

- (void)addLeftBarItem:(NSString *)title
                 image:(UIImage *)image
                hImage:(UIImage *)hImage
                target:(id)target
                action:(SEL)action
{
    title = !title ? @"" : title;
    CGFloat fontSize = NavigationBarButtonItemSize;
    
    CGFloat imageWidth = image.width;
    CGFloat imageHeight = image.height;
    CGFloat titleWidth = [title widthByLimitHeight:imageHeight fontSize:fontSize];
    
    CGRect frame = CGRectMake(0, 0, imageWidth + titleWidth + 20, NavigationBarHeight);
    UIButton *leftButton= [UIButton buttonWithType:UIButtonTypeCustom
                                             frame:frame
                                             title:title
                                        titleColor:[UIColor whiteColor]
                                     titleFontSize:fontSize
                                   backgroundColor:nil
                                       normarImage:image
                                    highLightImage:hImage];
    
    leftButton.tintColor = [UIColor clearColor];
    [leftButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    leftButton.titleEdgeInsets = UIEdgeInsetsMake(0, 7, 0, 0);
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
//    self.navigationItem.leftBarButtonItem = leftItem;
    
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                       target:nil action:nil];
    negativeSpacer.width = -15;
    self.navigationItem.leftBarButtonItems = @[negativeSpacer, leftItem];
}

- (void)addRightBarItem:(NSString *)title
              imageName:(NSString *)imageName
             hImageName:(NSString *)hImageName
                 target:(id)target
                 action:(SEL)action
{
    UIImage *image = [UIImage imageNamed:imageName];
    UIImage *hImage = [UIImage imageNamed:hImageName];
    [self addRightBarItem:title image:image hImage:hImage target:target action:action];
}

- (void)addRightBarItem:(NSString *)title
                  image:(UIImage *)image
                 hImage:(UIImage *)hImage
                 target:(id)target
                 action:(SEL)action
{
    //右边菜单
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    CGFloat fontSize = NavigationBarButtonItemSize;
    
    CGFloat imageWidth = image.width;
    CGFloat imageHeight = image.height;
    CGFloat titleWidth = [title widthByLimitHeight:imageHeight fontSize:fontSize];
    
    rightBtn.frame = CGRectMake(SCREEN_WIDTH, 0, imageWidth + 20 + titleWidth, NavigationBarHeight);
    rightBtn.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    [rightBtn setImage:image forState:UIControlStateNormal];
    [rightBtn setImage:hImage forState:UIControlStateHighlighted];
    [rightBtn setTitle:title forState:UIControlStateNormal];
    [rightBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    rightBtn.tintColor = [UIColor clearColor];
    rightBtn.titleLabel.textColor = [UIColor whiteColor];
    rightBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 7);
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                       target:nil action:nil];
    negativeSpacer.width = -16;
    self.navigationItem.rightBarButtonItems = @[negativeSpacer, rightItem];
}



- (void)setNormalTitle:(NSString *)title
{
    [self setTitle:title color:[UIColor whiteColor] font:[UIFont systemFontOfSize:NavigationBarTitleSize]];
}

- (void)setTitle:(NSString *)title color:(UIColor *)color font:(UIFont *)font
{
    if (!self.navigationController) return;
    title = [NSString isValidateString:title] ? title : @"";
    CGFloat labelAndImageXMargin = 10.0;
    CGFloat labelWidth = [title widthByLimitHeight:NavigationBarHeight font:[UIFont systemFontOfSize:NavigationBarTitleSize]];
    UIImage *image = [UIImage imageNamed:@"navigation_bar_logo"];

    //titleView
    UIView *titleView = [[UIView alloc] init];
    titleView.backgroundColor = [UIColor clearColor];
    CGFloat titleViewWidth = image.width + labelWidth + labelAndImageXMargin;
    titleView.frame = CGRectMake(0, 0, titleViewWidth, NavigationBarHeight);
    
    //小图标 imageView
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    CGFloat imageViewYMargin = (NavigationBarHeight - image.height) / 2.0;
    imageView.frame = CGRectMake(0, imageViewYMargin, image.width, image.height);
    [titleView addSubview:imageView];
    
    //标题Label
    CGFloat labelXMargin = imageView.right + labelAndImageXMargin;
    CGRect labelframe = CGRectMake(labelXMargin, 0, labelWidth, titleView.height);
    UILabel *label = [UILabel createLableWithFrame:labelframe
                                              text:title
                                          fontSize:NavigationBarTitleSize
                                     textAlignment:NSTextAlignmentCenter
                                         textColor:color
                                   backgroundColor:[UIColor clearColor]];
    [titleView addSubview:label];

    self.navigationItem.titleView = titleView;
    
    /*
    color = color ? color : ColorRGB(0x8e, 0xd9, 0x78);
    font = font ? font : [UIFont systemFontOfSize:18.0];
    self.title = title;
    NSDictionary *attribute = [NSDictionary dictionaryWithObjectsAndKeys:color, NSForegroundColorAttributeName, font, NSFontAttributeName, nil];
    [self.navigationController.navigationBar setTitleTextAttributes:attribute];
     */
}

- (UIView *)getRightItemView
{
    NSArray *rightItems = self.navigationItem.rightBarButtonItems;
    if (![NSArray isValidOfArray:rightItems] || rightItems.count < 2) {
        return nil;
    }
    UIBarButtonItem *rightItem = [rightItems objectAtIndex:1];
    if (![rightItem isKindOfClass:[UIBarButtonItem class]]) {
        return nil;
    }
    return [rightItem customView];
}

- (UIButton *)getRightButton
{
    UIView *rightItemView = [self getRightItemView];
    if (!rightItemView) {
        return nil;
    }
    UIButton *button = [rightItemView viewWithTag:NavigationRightButtonTag];
    return button;
}

- (void)showLeftBackBarItemWithTitle:(NSString *)title
{
    [self addLeftBarItem:title imageName:@"navi_bar_back" hImageName:nil target:self action:@selector(goBack:)];
}

- (void)showLeftAvatarBarItemWithImage:(UIImage *)image target:(id)target action:(SEL)action
{
    if (!image) {
        return;
    }
    if (image.width > 34.0 || image.height >= 34.0) {
        image = [image scaleWithWidth:34.0 height:34.0];
    }
    
    CGFloat imageWidth = image.width;
    CGFloat imageHeight = image.height;
    
    CGRect frame = CGRectMake(0, (NavigationBarHeight - imageHeight) / 2.0, imageWidth, imageHeight);
    UIButton *leftButton= [UIButton buttonWithType:UIButtonTypeCustom
                                             frame:frame
                                             title:@""
                                        titleColor:ColorRGB(0xba, 0xba, 0xba)
                                     titleFontSize:12
                                   backgroundColor:nil
                                       normarImage:image
                                    highLightImage:nil];
    
    leftButton.tintColor = [UIColor clearColor];
    [leftButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    leftButton.layer.cornerRadius = imageWidth / 2.0;
    leftButton.clipsToBounds = YES;
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                       target:nil action:nil];
    negativeSpacer.width = -5;
    self.navigationItem.leftBarButtonItems = @[negativeSpacer, leftItem];
}

#pragma mark - Event Response

- (void)goBack:(UIButton *)button
{
    [self goBack];
}

- (void)goBack
{
    [self.navigationController popViewControllerAnimated:YES];
}





@end





