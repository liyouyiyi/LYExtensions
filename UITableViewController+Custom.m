//
//  UITableViewController+Custom.m
//  PurchaseBao
//
//  Created by DarrenXie on 15/12/14.
//  Copyright © 2015年 YeahKa. All rights reserved.
//

#import "UITableViewController+Custom.h"
#import "Constant.h"
#import "Extension.h"

@implementation UITableViewController (Custom)

- (void)setNormalStyle
{
//    UIImage *backgroundImage = [UIImage imageNamed:@"normal_background"];
//    backgroundImage = [backgroundImage resizableImageWithCapInsets:UIEdgeInsetsMake(10, 100, 20, 100) resizingMode:UIImageResizingModeStretch];
//    UIImageView *imageView = [[UIImageView alloc] init];
//    imageView.image = backgroundImage;
//    self.tableView.backgroundView = imageView;
//    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.backgroundColor = [UIColor baseBackgroundColor];
}

@end
