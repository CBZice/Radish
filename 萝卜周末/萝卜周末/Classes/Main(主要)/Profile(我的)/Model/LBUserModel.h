//
//  LBUserModel.h
//  萝卜周末
//
//  Created by Apple－13 on 16/1/20.
//  Copyright (c) 2016年 com.mall. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LBUserModel : NSObject

/** 用户id */
@property (nonatomic, copy) NSString *userId;
/** 用户头像 */
@property (nonatomic, copy) NSString *userIcon;
/** 用户名称 */
@property (nonatomic, copy) NSString *userName;
/** 用户个性签名 */
@property (nonatomic, copy) NSString *userSign;

/** 参与的活动 */
@property (nonatomic, strong) NSArray *activityArr;

/** 用户关注人数 */
@property (nonatomic, strong) NSArray *attentionArr;

/** 用户粉丝数 */
@property (nonatomic, strong) NSArray *fansArr;

/** 用户收藏 */
@property (nonatomic, strong) NSArray *collectArr;

/** 用户性别 */
@property (nonatomic, assign, getter=isUserSex) BOOL userSex;

/** 用户是否为新人 */
@property (nonatomic, assign, getter=isNewUser) BOOL newUser;

@end
