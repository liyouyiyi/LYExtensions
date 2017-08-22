//
//  UIImageView+Custom.h
//  PurchaseBao
//
//  Created by DarrenXie on 16/1/21.
//  Copyright © 2016年 YeahKa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (Custom)

- (void)loadImageWithURLString:(NSString *)urlString;
- (void)loadImageWithURL:(NSURL *)url;

@end
