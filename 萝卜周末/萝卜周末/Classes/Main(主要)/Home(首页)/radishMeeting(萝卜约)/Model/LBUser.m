//
//  LBUser.m
//  萝卜周末
//
//  Created by Apple_16 on 16/1/20.
//  Copyright (c) 2016年 com.mall. All rights reserved.
//

#import "LBUser.h"

@implementation LBUser
-(id)init{
    self=[super init];
    if (self) {
        self.idstr=nil;
        self.userName=nil;
        self.profile_image_url=nil;
        self.personalSign=@"这个人很懒，没有添加内容";
        self.man=NO;
        self.dynamicMessageListArray=[NSMutableArray array];
        self.likedPeopelListArray=[NSMutableArray array];
        self.fansListArray=[NSMutableArray array];
        self.collectionsListArray=[NSMutableArray array];
        self.newUser=YES;
        self.createdLoopsListArray=[NSMutableArray array];
        self.joinedLoopsListArray=[NSMutableArray array];
    }
    return self;
}
@end
