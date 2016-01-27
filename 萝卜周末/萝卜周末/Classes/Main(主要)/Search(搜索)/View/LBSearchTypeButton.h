//
//  LBSearchTypeButton.h
//  萝卜周末
//
//  Created by Apple_16 on 16/1/19.
//  Copyright (c) 2016年 com.mall. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LBSearchTypeButton;
@protocol LBSearchTypeButtonDelegate <NSObject>
@optional
-(void)SearchTypeButtonDidClick:(LBSearchTypeButton *)searchTypeButton button:(UIButton *)button;
@end
@interface LBSearchTypeButton : UIView
@property (nonatomic,weak)id <LBSearchTypeButtonDelegate>delegate;
@property (nonatomic,strong) UIButton *imageButton;
@property (nonatomic,strong) UILabel *titleLable;
-(id)searchTypeButtonWithNormalImage:(NSString *)normalImage SelectedImage:(NSString *)selectedImage title:(NSString *)titleName tap:(NSUInteger)tap;

@end
