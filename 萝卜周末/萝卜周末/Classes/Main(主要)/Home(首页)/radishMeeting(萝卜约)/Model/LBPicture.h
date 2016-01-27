//
//  LBPicture.h
//  萝卜周末
//
//  Created by Apple_16 on 16/1/20.
//  Copyright (c) 2016年 com.mall. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LBPicture : NSObject
/** 缩略图的网络地址 */
@property (nonatomic, copy) NSString *thumbnail_pic;
/** 缩略图的名称 */
@property (nonatomic, copy) NSString *thumbnail_picName;
/** 缩略图的本地地址 */
@property (nonatomic, copy) NSString *thumbnail_picAddress;
/** 放大图的名称 */
@property (nonatomic, copy) NSString *original_picName;
/** 放大图的本地地址 */
@property (nonatomic, copy) NSString *original_picAddress;
@end
