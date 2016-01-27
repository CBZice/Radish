//
//  LBUpdateTabbar.h
//  萝卜周末
//
//  Created by Apple_16 on 16/1/18.
//  Copyright (c) 2016年 com.mall. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LBUpdateTabbar;
@protocol LBUpdateTabbarDelegate <UITabBarDelegate>

@optional
- (void)updateTabbarDidClick:(LBUpdateTabbar *)updateTabbar;

@end
@interface LBUpdateTabbar : UITabBar
@property (nonatomic, weak) id<LBUpdateTabbarDelegate> subdelegate;
@end
