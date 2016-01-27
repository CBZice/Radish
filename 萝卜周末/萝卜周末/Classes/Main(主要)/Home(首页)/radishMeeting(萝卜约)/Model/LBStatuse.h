//
//  LBStatuse.h
//  萝卜周末
//
//  Created by Apple_16 on 16/1/20.
//  Copyright (c) 2016年 com.mall. All rights reserved.
//

#import <Foundation/Foundation.h>
@class LBUser;
@interface LBStatuse : NSObject
/**	string	字符串型的萝卜约信息ID*/
@property (nonatomic, copy) NSString *idstr;
/**	string	微萝卜约信息标题*/
@property (nonatomic, copy) NSString *title;
/**	string	微萝卜约信息内容*/
@property (nonatomic, copy) NSString *text;

/**	object	微萝卜约信息作者的用户信息字段 详细*/
@property (nonatomic, strong) LBUser *user;

/** string  萝卜约信息博创建时间 */
@property (nonatomic, copy) NSString *created_at;

/** array 萝卜约信息的图片数组  */
@property (nonatomic, strong) NSArray *pic_urls;
@end
