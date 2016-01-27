//
//  LBCircleModel.h
//  萝卜周末
//
//  Created by Apple－13 on 16/1/20.
//  Copyright (c) 2016年 com.mall. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LBCircleModel : NSObject

/** 圈子id */
@property (nonatomic, copy) NSString *circleId;
/** 圈子头像 */
@property (nonatomic, copy) NSString *circleIcon;
/** 圈子名称 */
@property (nonatomic, copy) NSString *circleName;
/** 圈子说明 */
@property (nonatomic, copy) NSString *circleSign;
/** 圈子人数 */
@property (nonatomic, strong) NSArray *usersArr;


@end
