//
//  LBMaskingView.h
//  萝卜周末
//
//  Created by Apple_16 on 16/1/20.
//  Copyright (c) 2016年 com.mall. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LBMaskingView;
@protocol LBMaskingViewDelegate <NSObject>

- (void)createMaskingView:(LBMaskingView *)view;

@end
@interface LBMaskingView : UIView
@property (nonatomic, weak) id<LBMaskingViewDelegate> delegate;

+ (instancetype)addCoverWithColor:(UIColor *)color showView:(UIView *)showview backImg:(NSString *)backimg fromAction:(UIView *)action;

- (void)show;

- (void)dismiss;
@end
