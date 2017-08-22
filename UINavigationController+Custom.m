//
//  UINavigationController+Custom.m
//  PayBao
//
//  Created by 謝傳友 on 15/7/31.
//  Copyright (c) 2015年 PAYBAO. All rights reserved.
//

#import "UINavigationController+Custom.h"
#import "Extension.h"

@implementation UINavigationController (Custom)

- (BOOL)popToViewController:(NSString *)viewControllerName
{
    NSLog(@"viewControllerName = %@", viewControllerName);
    if (!viewControllerName || [[viewControllerName trimSpaceString] isEqualToString:@""]) {
        return NO;
    }
    id destinationViewController = NSClassFromString(viewControllerName);
    if (!destinationViewController || ![destinationViewController isKindOfClass:[UIViewController class]]) {
        return NO;
    }
    
    NSArray *viewControllers = self.viewControllers;
    for (UIViewController *viewController in viewControllers) {
        if ([destinationViewController isEqual:viewController]) {
            [self popToViewController:viewController animated:YES];
            return YES;
        }
    }
    
    return NO;
}

@end
