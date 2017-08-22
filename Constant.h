//
//  Constant.h
//  PayBao
//
//  Created by 謝傳友 on 15/7/12.
//  Copyright (c) 2015年 PurchaseBAO. All rights reserved.
//

#ifndef PurchaseBao_Constant_h
#define PurchaseBao_Constant_h

// ******** 常用宏 ********
#define SCREEN_WIDTH  ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
#define APP_VERSION [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
#define APP_VERSION_FLOAT [[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"] floatValue]
#define APP_NAME [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"]

// ******** 界面相关 ********
extern float const NavigationBarHeight;   //顶部导航栏的高度
extern float const StatusBarHeight;       //导航栏高度
extern float const TabBarCustomHeight;    //自定义tabbar的高度
extern float const TabBarHeight;

extern float const IPhone4Height;
extern float const IPhone5Height;
extern float const IPhone6Height;
extern float const IPhone6PHeight;

extern float const IPhone4Width;
extern float const IPhone5Width;
extern float const IPhone6Width;
extern float const IPhone6PWidth;






#endif






