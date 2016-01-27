//
//  LBRadishCoopToolbarView.h
//  萝卜周末
//
//  Created by Apple－13 on 16/1/20.
//  Copyright (c) 2016年 com.mall. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    LBRadishCoopToolbarButtonTypeHotArti,       //圈内热帖
    LBRadishCoopToolbarButtonTypeItemChart,     //圈子排行
    LBRadishCoopToolbarButtonTypeMineGroup      //我的圈子
}LBRadishCoopToolbarButtonType;

@protocol LBRadishCoopToolbarViewDelegate <NSObject>

@optional
-(void)changeTheCtrlWithBtnType:(LBRadishCoopToolbarButtonType)type;

@end

@interface LBRadishCoopToolbarView : UIView

@property (nonatomic, weak) id<LBRadishCoopToolbarViewDelegate>delegate;

@end
