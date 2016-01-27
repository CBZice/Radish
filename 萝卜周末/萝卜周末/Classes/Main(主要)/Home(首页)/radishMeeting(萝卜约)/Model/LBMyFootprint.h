//
//  LBMyFootprint.h
//  萝卜周末
//
//  Created by Apple_16 on 16/1/20.
//  Copyright (c) 2016年 com.mall. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LBMyFootprint : NSObject
/** 足迹的发表的用户名的头像*/
@property (nonatomic,copy) NSString *iconName;
/** 足迹的发表的时间 */
@property (nonatomic,copy) NSString *time;
/** 足迹的发表的用户名*/
@property (nonatomic,copy) NSString *userName;
/** 足迹发表的内容 */
@property (nonatomic,copy) NSString *conent;
/** 足迹发表的内容图片 */
@property (nonatomic,copy) NSString *conentPicture;
@end
