//
//  UITextView+Custom.m
//  PurchaseBao
//
//  Created by DarrenXie on 15/11/12.
//  Copyright © 2015年 YeahKa. All rights reserved.
//

#import "UITextView+Custom.h"
#import "Extension.h"

@implementation UITextView (Custom)

- (void)setNomalStyle
{
//    self.layer.cornerRadius = 3.0;
    self.backgroundColor = [UIColor whiteColor];
    self.textColor = ColorRGB(52.0, 52.0, 52.0);
    self.font = [UIFont systemFontOfSize:17.0];
//    self.textAlignment = NSTextAlignmentRight;
    self.tintColor = ColorRGB(0xff, 0x7e, 0x00);
}



@end



