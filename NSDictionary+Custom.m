//
//  NSDictionary+Custom.m
//  PurchaseBao
//
//  Created by DarrenXie on 15/10/30.
//  Copyright © 2015年 YeahKa. All rights reserved.
//

#import "NSDictionary+Custom.h"
#import "NSString+Custom.h"
#import "Constant.h"

@implementation NSDictionary (Custom)

+ (NSDictionary *)dictionaryWithString:(NSString *)string
{
    if (![NSString isValidateString:string]) {
        return nil;
    }
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error;
    id object = [NSJSONSerialization JSONObjectWithData:data
                                             options:NSJSONReadingAllowFragments
                                               error:&error];
    if (!object || [object isKindOfClass:[NSNull class]] || ![object isKindOfClass:[NSDictionary class]]) {
        return nil;
    }
    return object;
}

- (NSString *)toJsonString
{
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:&error];
    if (error || !jsonData || jsonData.length <= 0) {
        return @"";
    }
    NSString *result = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return result;
}



/*!
 * 验证数组是否有效，排除 =nil，=NSNull， count<=0
 */
+ (BOOL)isValidOfDictionary:(NSDictionary *)dictionary
{
    if (!dictionary || [dictionary isKindOfClass:[NSNull class]] || dictionary.count <= 0) return NO;
    return YES;
}

- (BOOL)isValid
{
    return [[self class] isValidOfDictionary:self];
}



@end
