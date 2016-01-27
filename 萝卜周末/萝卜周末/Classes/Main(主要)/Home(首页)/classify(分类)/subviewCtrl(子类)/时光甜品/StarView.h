//
//  StarView.h
//  Moive
//
//  Created by mac on 15/8/26.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StarView : UIView
{
    UIView *_grayView;
    
    UIView *_yellowView;
    
    UILabel *_ratinglabel;
    
}


@property(nonatomic,assign)float score;


@end
