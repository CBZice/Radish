//
//  Macro.h
//  萝卜周末
//
//  Created by Apple－13 on 16/1/19.
//  Copyright (c) 2016年 com.mall. All rights reserved.
//

#ifndef _____Macro_h
#define _____Macro_h


#define LBColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define LBColorAlpha(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]
// 随机色
#define LBRandomColor LBColor(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

//屏幕大小
#define LBKeyWindow                 [[UIApplication sharedApplication] keyWindow]
#define LBScreenWidth               [UIScreen mainScreen].bounds.size.width
#define LBScreenHeight              [UIScreen mainScreen].bounds.size.height
#define LBScreenBounds              [[UIScreen mainScreen] bounds]
#define LBApplicationFrame          [[UIScreen mainScreen] applicationFrame]
// Include any system framework and library headers here that should be included in all compilation units.
// You will also need to set the Prefix Header build setting of one or more of your targets to reference this file.

//系统版本号
#define LBSystemVersion  [[UIDevice currentDevice] systemVersion].floatValue

/** 跳转到设置界面以及其他 */
#define JumpToAnother @"JumpToAnother"
#define JumpToAnotherKey @"JumpToAnotherKey"

#define GrayLineColor LBColorAlpha(197, 197, 197, 0.7)

#endif
