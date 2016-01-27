//
//  LBChoiceFoodChooseButtonView.h
//  萝卜周末
//
//  Created by Apple_16 on 16/1/21.
//  Copyright (c) 2016年 com.mall. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LBChoiceFoodChooseButtonView;
@protocol LBChoiceFoodChooseButtonViewDelegate <NSObject>
@optional
-(void)choiceFoodChooseButtonViewDidClickedButton:(LBChoiceFoodChooseButtonView *)buttonView withButton:(UIButton *)sender;
@end
@interface LBChoiceFoodChooseButtonView : UIView
@property (nonatomic,weak)id <LBChoiceFoodChooseButtonViewDelegate>delegate;
@end
