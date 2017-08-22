//
//  NSDictionary+Custom.h
//  PurchaseBao
//
//  Created by DarrenXie on 15/10/30.
//  Copyright © 2015年 YeahKa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Custom)

+ (NSDictionary *)dictionaryWithString:(NSString *)strong;
- (NSString *)toJsonString;

/*!
 * 验证数组是否有效，排除 =nil，=NSNull， count<=0
 */
+ (BOOL)isValidOfDictionary:(NSDictionary *)dictionary;
- (BOOL)isValid;


@end
