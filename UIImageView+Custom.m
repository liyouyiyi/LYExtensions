//
//  UIImageView+Custom.m
//  PurchaseBao
//
//  Created by DarrenXie on 16/1/21.
//  Copyright © 2016年 YeahKa. All rights reserved.
//

#import "UIImageView+Custom.h"

@implementation UIImageView (Custom)

- (void)loadImageWithURLString:(NSString *)urlString;
{
    if (!urlString || [urlString isEqualToString:@""]) {
        return;
    }
    NSURL *url = [NSURL URLWithString:urlString];
    [self loadImageWithURL:url];
}

- (void)loadImageWithURL:(NSURL *)url;
{
    if (!url) {
        return;
    }
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:url]];
        dispatch_sync(dispatch_get_main_queue(), ^{
            if (image) {
                self.image = image;
            }
        });
    });
}

@end
