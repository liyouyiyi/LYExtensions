//
//  NSUserDefaults+Custom.h
//  XTalkie
//
//  Created by 謝傳友 on 16/4/12.
//  Copyright © 2016年 CarTalkie. All rights reserved.
//

#import <Foundation/Foundation.h>



@class User;
@interface NSUserDefaults (Custom)

/*!
 * 当前系统语言
 */
+ (NSString *)currentLanguage;

/*!
 * 是否第一次启动app
 */
+ (BOOL)isAppFirstLaunch;

/*!
 * 是否第一次启动新版本
 */
+ (BOOL)isNewVersionFirstLaunch;

/*!
 * 是否需要保存密码
 */
+ (BOOL)isRememberPassword;

/*!
 * 设置是否保存密码
 */
+ (void)setIsRememberPassword:(BOOL)isRememberPassword;

/*!
 * 保存用户信息,只保存手机号和密码
 */
+ (void)saveUser:(User *)user;
/*!
 * 保存用户信息
 */
+ (void)saveUsername:(NSString *)username password:(NSString *)password;
/*!
 * 加载用户信息
 */
+ (User *)loadDefaultUser;

/*!
 * 保存运动结束的时间， userid+uuid为key
 * endtime 结束时间
 * userId 用户id
 * uuid 设备uuid
 */
+ (void)saveMotionEndTime:(NSInteger)endtime userId:(NSString *)userId uuid:(NSString *)uuid;

/*!
 * 获取运动结束的时间， userid+uuid为key
 */
+ (NSInteger)loadMontionEndTimeWithUserId:(NSString *)userId uuid:(NSString *)uuid;

/*!
 * 保存选中的蓝牙设备mac
 * deviceMac 蓝牙设备mac
 */
+ (void)saveSelectedBLEDeviceMac:(NSString *)deviceMac;

/*!
 * 选中的蓝牙设备mac
 */
+ (NSString *)loadSelectedBLEDeviceMac;

/*!
 * 保存最近设置的运动球场类型
 */
+ (void)saveRecentCourtType:(NSInteger)courtType;

/*!
 * 获取最近设置的运动球场类型
 */
+ (NSInteger)loadRecentCourtType;

/*!
 * 保存是否已经显示过地图mark
 */
+ (void)saveIsHadShowMapMark:(BOOL)isHadShowMapMark;

/*!
 * 获取是否已经显示过地图mark
 */
+ (BOOL)isHadShowMapMark;

/*!
 * 保存是否需要自动登录
 */
+ (void)saveNeedAutoLogin:(BOOL)needAutoLogin;

/*!
 * 获取是否需要自动登录
 */
+ (BOOL)needAutoLogin;

/*!
 * 保存是否正在运动状态
 */
+ (void)saveIsInMotion:(BOOL)isInMotion userId:(NSString *)userId;

/*!
 * 是否正在运动状态
 */
+ (BOOL)isInMotionWithUserId:(NSString *)userId;


@end











