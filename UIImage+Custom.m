//
//  UIImage+Custom.m
//  XSTravel
//
//  Created by 謝傳友 on 15/6/6.
//  Copyright (c) 2015年 XieShou. All rights reserved.
//

#import "UIImage+Custom.h"
#import "NSString+Custom.h"

@implementation UIImage (Custom)

+ (UIImage *)imageWithURLString:(NSString *)urlString
{
    if (![NSString isValidateString:urlString]) {
        return nil;
    }
    NSURL *url = [NSURL URLWithString:urlString];
    if (!url) {
        return nil;
    }
    NSData *data = [NSData dataWithContentsOfURL:url];
    if (!data || data.length <= 0) {
        return nil;
    }
    UIImage *image = [UIImage imageWithData:data];
    return image;
}

- (UIImage*)transformWidth:(CGFloat)width
                    height:(CGFloat)height {
    
    CGFloat destW = width;
    CGFloat destH = height;
    CGFloat sourceW = width;
    CGFloat sourceH = height;
    
    CGImageRef imageRef = self.CGImage;
    
    
    CGContextRef bitmap = CGBitmapContextCreate(NULL,
                                                destW,
                                                destH,
                                                CGImageGetBitsPerComponent(imageRef),
                                                4*destW,
                                                CGImageGetColorSpace(imageRef),
                                                (kCGBitmapByteOrder32Little | kCGImageAlphaPremultipliedFirst));
    
    CGContextDrawImage(bitmap, CGRectMake(0, 0, sourceW, sourceH), imageRef);
    
    CGImageRef ref = CGBitmapContextCreateImage(bitmap);
    UIImage *result = [UIImage imageWithCGImage:ref];
    CGContextRelease(bitmap);
    CGImageRelease(ref);
    
    return result;
}

+ (UIImage *)scaleToSize:(UIImage *)img size:(CGSize)size {
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    UIGraphicsBeginImageContext(size);
    // 绘制改变大小的图片
    [img drawInRect:CGRectMake(0, 0, size.width, size.height)];
    // 从当前context中创建一个改变大小后的图片
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    // 返回新的改变大小后的图片
    return scaledImage;
}

- (UIImage *)scaleWithSize:(CGSize)size
{
    return [self scaleWithWidth:size.width height:size.height];
}

- (UIImage *)scaleWithWidth:(CGFloat)width height:(CGFloat)height
{
    // 创建一个bitmap的context
    UIGraphicsBeginImageContext(CGSizeMake(width, height));
    // 绘制改变大小的图片
    [self drawInRect:CGRectMake(0, 0, width, height)];
    // 从当前context中创建一个改变大小后的图片
    UIImage *TransformedImg=UIGraphicsGetImageFromCurrentImageContext();
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    // 返回新的改变大小后的图片
    return TransformedImg;
}

- (UIImage *)scaleWithMaxWidth:(CGFloat)maxWidth maxheight:(CGFloat)maxHeight;
{
    CGFloat width = self.width;
    CGFloat height = self.height;
    if (width > maxWidth) {
        height = (height / width) * maxWidth;
        width = maxWidth;
    }
    if (height > maxHeight) {
        width = (width / height) * maxHeight;
        height = maxHeight;
    }
    return [self scaleWithWidth:width height:height];
}

+ (UIImage *)captureImage:(UIImage *)image rect:(CGRect)rect
{
    if (!image) {
        return nil;
    }
    CGImageRef imageRef = CGImageCreateWithImageInRect(image.CGImage, rect);
    CFAutorelease(imageRef);
    if (imageRef == NULL) {
        return nil;
    }
    return [UIImage imageWithCGImage:imageRef];
}

- (UIImage *)imageByCaptureRect:(CGRect)rect;
{
    CGImageRef imageRef = CGImageCreateWithImageInRect(self.CGImage, rect);
    CFAutorelease(imageRef);
    return [UIImage imageWithCGImage:imageRef];
}


+ (UIImage*)imageWithColor:(UIColor*)color
{
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    
    UIGraphicsBeginImageContext(rect.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    
    CGContextFillRect(context, rect);
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return theImage;
}

- (CGFloat)width
{
    return self.size.width;
}

- (CGFloat)height
{
    return self.size.height;
}

- (CGSize)sizeWithLimitMaxWidth:(CGFloat)maxWidth maxHeight:(CGFloat)maxHeight
{
    CGFloat height = 0;
    CGFloat width = 0;
    if (self.width > maxWidth) {
        width = maxWidth;
        height =  (self.height / self.width) * width;
    } else if (self.height > maxHeight) {
        height = maxHeight;
        width =  (self.width / self.height) * height;
    } else {
        height = maxHeight;
        width = maxWidth;
        CGFloat widthScale = maxWidth / self.width;
        CGFloat heightScale = maxHeight / self.height;
        if (widthScale < heightScale) {
            width = maxWidth;
            height = self.height * widthScale;
        } else {
            height = maxHeight;
            width = self.width * heightScale;
        }
    }
    
    return CGSizeMake(width, height);
}

+ (void)loadImageFromURLStr:(NSString *)urlStr complete:(void(^)(UIImage *image))complete
{
    if (!urlStr || urlStr.length <= 0) {
        complete(nil);
        return;
    }
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        UIImage *image = [UIImage imageWithURLString:urlStr];
        dispatch_sync(dispatch_get_main_queue(), ^{
            complete(image);
        });
    });
}


@end
