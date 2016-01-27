//
//  LBUser.h
//  萝卜周末
//
//  Created by Apple_16 on 16/1/20.
//  Copyright (c) 2016年 com.mall. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LBUser : NSObject
/**	string	字符串型的用户UID*/
@property (nonatomic, copy) NSString *idstr;
/**	string	用户头像地址，50×50像素*/
@property (nonatomic, copy) NSString *profile_image_url;
/**	string	用户头像，50×50像素*/
@property (nonatomic, copy) NSString *iconName;
/** string  用户的昵称*/
@property (nonatomic,copy) NSString *userName;
/** string  用户的个性签名*/
@property (nonatomic,copy) NSString *personalSign;
/** BOOL  用户的性别*/
@property (nonatomic,assign,getter=isMan) BOOL man;
/** NSMutableArray  用户发布的动态消息的数组*/
@property (nonatomic,strong) NSMutableArray *dynamicMessageListArray;
/** NSMutableArray  用户关注的人的数组*/
@property (nonatomic,strong) NSMutableArray *likedPeopelListArray;
/** NSMutableArray  用户的粉丝人数数组*/
@property (nonatomic,strong) NSMutableArray *fansListArray;
/** NSMutableArray  用户的收藏数组*/
@property (nonatomic,copy) NSMutableArray *collectionsListArray;
/** BOOL  判断是否是新人*/
@property (nonatomic,assign,getter=isNewUser) BOOL newUser;
/** NSMutableArray  用户创建的圈子的数组*/
@property (nonatomic,strong) NSMutableArray *createdLoopsListArray;
/** NSMutableArray  用户加入的圈子的数组*/
@property (nonatomic,strong) NSMutableArray *joinedLoopsListArray;
@end
