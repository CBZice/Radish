//
//  LBSearchTextField.h
//  萝卜周末
//
//  Created by Apple_16 on 16/1/19.
//  Copyright (c) 2016年 com.mall. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LBSearchTextField;
@protocol LBSearchTextFieldDelegate <UITextFieldDelegate>
@optional
-(void)SearchTextFieldSearchButtonClick:(LBSearchTextField *)searchBar;
@end
@interface LBSearchTextField : UITextField
@property (nonatomic,weak) id<LBSearchTextFieldDelegate>delegate;
+(instancetype)SearchTextField;

@end
