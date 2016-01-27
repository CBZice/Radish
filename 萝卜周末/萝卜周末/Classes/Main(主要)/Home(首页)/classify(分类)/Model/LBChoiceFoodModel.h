//
//  LBChoiceFoodModel.h
//  萝卜周末
//
//  Created by dp on 16/1/21.
//  Copyright (c) 2016年 com.mall. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LBChoiceFoodModel : NSObject
//图片地址
@property (nonatomic, strong) NSString *imageUrl;
//item大小
@property (nonatomic, assign) CGSize imageSize;
//美食名称
@property (nonatomic,copy) NSString *foodName;
@end
