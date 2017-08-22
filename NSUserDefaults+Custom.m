//
//  NSUserDefaults+Custom.m
//  XTalkie
//
//  Created by 謝傳友 on 16/4/12.
//  Copyright © 2016年 CarTalkie. All rights reserved.
//

#import "NSUserDefaults+Custom.h"
#import "NSDate+Formater.h"
#import "User.h"
#import "NSString+Custom.h"

static NSString * const kVersion  = @"user_default_version";
static NSString * const kAppNotFirstLaunch  = @"user_default_app_not_first_launch";

static NSString * const kUsername  = @"key_username";
static NSString * const kPassword = @"key_password";

//是否保存密码
static NSString * const kIsRememberPassword = @"key_is_remember_password";

static NSString * const kMotionEndTime = @"key_motion_end_time";

static NSString * const kSelectedBLEDeviceMac = @"key_selected_ble_device_mac";

static NSString * const kRecentCourtType = @"key_recent_court_type";

static NSString * const kIsHadShowMapMark = @"key_is_had_show_map_mark";

static NSString * const kNeedAutoLogin = @"key_need_auto_login";

@implementation NSUserDefaults (Custom)

+ (NSString *)currentLanguage;
{
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    NSArray * allLanguages = [defaults objectForKey:@"AppleLanguages"];
    NSString * preferredLang = [allLanguages objectAtIndex:0];
    return preferredLang;
}

+ (BOOL)isAppFirstLaunch;
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    BOOL appNotFirstLaunch = [userDefaults boolForKey:kAppNotFirstLaunch];
    
    [userDefaults setBool:YES forKey:kAppNotFirstLaunch];
    [userDefaults synchronize];
    
    return !appNotFirstLaunch;
}

+ (BOOL)isNewVersionFirstLaunch
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *savedVersion = [userDefaults stringForKey:kVersion];
    
    NSString *currentVersion = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    
    [userDefaults setObject:currentVersion forKey:kVersion];
    [userDefaults synchronize];
    
    return [currentVersion versionCompareWithVersionString:savedVersion] == 1;
}

/*!
 * 是否需要保存密码
 */
+ (BOOL)isRememberPassword;
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    BOOL isRememberPassword = [[userDefaults stringForKey:kIsRememberPassword] boolValue];
    return isRememberPassword;
}

/*!
 * 设置是否保存密码
 */
+ (void)setIsRememberPassword:(BOOL)isRememberPassword;
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setBool:isRememberPassword forKey:kIsRememberPassword];
    [userDefaults synchronize];
}

+ (void)saveUser:(User *)user
{
    NSString *username = @"";
    NSString *password = @"";
    if (user) {
        username = user.username;
        password = user.password;
    }
    [self saveUsername:username password:password];
}

+ (void)saveUsername:(NSString *)username password:(NSString *)password
{
    [[self standardUserDefaults] setObject:username forKey:kUsername];
    [[self standardUserDefaults] setObject:password forKey:kPassword];
    [[self standardUserDefaults] synchronize];
}

+ (User *)loadDefaultUser
{
    NSString *username = [[self standardUserDefaults] stringForKey:kUsername];
    NSString *password = [[self standardUserDefaults] stringForKey:kPassword];
//    if (!username || username.length <= 0 || !password || password.length <= 0) {
//        return nil;
//    }
    User *user = [[User alloc] init];
    user.username = username;
    user.password = password;
    return user;
}

+ (void)saveMotionEndTime:(NSInteger)endtime userId:(NSString *)userId uuid:(NSString *)uuid;
{
    userId = !userId ? @"" : userId;
    uuid = !uuid ? @"" : uuid;
    NSString *key = [NSString stringWithFormat:@"%@_%@_%@", userId, uuid, kMotionEndTime];
    NSDictionary *dict = @{key: @(endtime)};
    
    [[self standardUserDefaults] setObject:dict forKey:key];
    [[self standardUserDefaults] synchronize];
}

+ (NSInteger)loadMontionEndTimeWithUserId:(NSString *)userId uuid:(NSString *)uuid;
{
    userId = !userId ? @"" : userId;
    uuid = !uuid ? @"" : uuid;
    NSString *key = [NSString stringWithFormat:@"%@_%@_%@", userId, uuid, kMotionEndTime];
    NSDictionary *dict = [[self standardUserDefaults] objectForKey:key];
    if (!dict || dict.count <= 0) {
        return 0;
    }
    id endTime = [dict objectForKey:key];
    if (!endTime) {
        return 0;
    }
    return [endTime integerValue];
}

+ (void)saveSelectedBLEDeviceMac:(NSString *)deviceMac;
{
    deviceMac = !deviceMac ? @"" : deviceMac;
    [[self standardUserDefaults] setObject:deviceMac forKey:kSelectedBLEDeviceMac];
    [[self standardUserDefaults] synchronize];
}

+ (NSString *)loadSelectedBLEDeviceMac;
{
    NSString *deviceMac = [[self standardUserDefaults] stringForKey:kSelectedBLEDeviceMac];
    return deviceMac;
}

+ (void)saveRecentCourtType:(NSInteger)courtType;
{
    [[self standardUserDefaults] setInteger:courtType forKey:kRecentCourtType];
    [[self standardUserDefaults] synchronize];
}

+ (NSInteger)loadRecentCourtType
{
    NSInteger recentCourtType = [[self standardUserDefaults] integerForKey:kRecentCourtType];
    return recentCourtType;
}

+ (void)saveIsHadShowMapMark:(BOOL)isHadShowMapMark;
{
    [[self standardUserDefaults] setBool:isHadShowMapMark forKey:kIsHadShowMapMark];
    [[self standardUserDefaults] synchronize];
}

+ (BOOL)isHadShowMapMark
{
    BOOL isHadShowMapMark = [[self standardUserDefaults] boolForKey:kIsHadShowMapMark];
    return isHadShowMapMark;
}

+ (void)saveNeedAutoLogin:(BOOL)needAutoLogin;
{
    [[self standardUserDefaults] setBool:needAutoLogin forKey:kNeedAutoLogin];
    [[self standardUserDefaults] synchronize];
}

+ (BOOL)needAutoLogin
{
    BOOL needAutoLogin = [[self standardUserDefaults] boolForKey:kNeedAutoLogin];
    return needAutoLogin;
}






@end




