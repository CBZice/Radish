//
//  LBRadishCoopViewController.m
//  萝卜周末
//
//  Created by Apple_16 on 16/1/18.
//  Copyright (c) 2016年 com.mall. All rights reserved.
//

#import "LBRadishCoopViewController.h"
#import "LBRadishCoopToolbarView.h"

#import "LBHotArticleViewController.h"
#import "LBItemChartsViewController.h"
#import "LBMyGroupViewController.h"

@interface LBRadishCoopViewController ()<LBRadishCoopToolbarViewDelegate>

@property (nonatomic, strong) LBRadishCoopToolbarView *toolBarView;
@property (nonatomic, strong) LBHotArticleViewController *hotView;
@property (nonatomic, strong) LBItemChartsViewController *itemView;
@property (nonatomic, strong) LBMyGroupViewController *groupView;

/** 用于显示其他控制器的内容 */
@property (nonatomic, strong) UIView *showView;

@end

@implementation LBRadishCoopViewController

#pragma mark ----- 懒加载
-(LBRadishCoopToolbarView *)toolBarView
{
    if (!_toolBarView) {
        _toolBarView = [[LBRadishCoopToolbarView alloc] init];
    }
    return _toolBarView;
}
-(LBHotArticleViewController *)hotView
{
    if (!_hotView) {
        _hotView = [[LBHotArticleViewController alloc] init];
    }
    return _hotView;
}
-(LBItemChartsViewController *)itemView
{
    if (!_itemView) {
        _itemView = [[LBItemChartsViewController alloc] init];
    }
    return _itemView;
}
-(LBMyGroupViewController *)groupView
{
    if (!_groupView) {
        _groupView = [[LBMyGroupViewController alloc] init];
    }
    return _groupView;
}

-(UIView *)showView
{
    if (!_showView) {
        _showView = [[UIView alloc] init];
        _showView.width = LBScreenWidth;
        _showView.height = LBScreenHeight - CGRectGetMaxY(_toolBarView.frame);
        _showView.y = CGRectGetMaxY(_toolBarView.frame);
    }
    return _showView;
}

#pragma mark ----- 系统方法
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.navigationBar.hidden = NO;
    
//    self.view.backgroundColor = [UIColor cyanColor];
    
    /** 加载工具栏 */
    [self setupToolBar];
    
    /** 切换控制器 */
    [self setupContectWithCtrl:self.hotView];
    
    
}
//- (void)viewWillAppear:(BOOL)animated
//{
//    [super viewWillAppear:animated];
//    /** 视图显示时显示navigationBar */
//    self.navigationController.navigationBarHidden = NO;
//    
////    UIWindow *window = [UIApplication sharedApplication].keyWindow;
////    [window addSubview:self.tabBarController.tabBar];
//}
//
//- (void)viewDidAppear:(BOOL)animated
//{
//    LBLog(@"%@", NSStringFromCGRect(self.tabBarController.tabBar.frame));
//    self.tabBarController.tabBar.hidden = NO;
//    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        self.tabBarController.tabBar.hidden = NO;
//    });
//}

/** 加载工具栏 */
- (void)setupToolBar
{
    [self.view addSubview:self.toolBarView];
    _toolBarView.height = 44;
    _toolBarView.width = LBScreenWidth;
    _toolBarView.y = 64;
    _toolBarView.delegate = self;
}
/** 切换控制器 */
- (void)setupContectWithCtrl:(UIViewController *)ctrl
{
    [self.showView addSubview:ctrl.view];
    
    /** 设置cell的高度 */
    ctrl.view.height = LBScreenHeight - CGRectGetMaxY(_toolBarView.frame);

    /** 设置控制器cell的y值，默认有一个非0值 */
    ctrl.view.y = 0;
    [self.view addSubview:_showView];
}

#pragma mark --- LBRadishCoopToolbarViewDelegate
-(void)changeTheCtrlWithBtnType:(LBRadishCoopToolbarButtonType)type
{
    switch (type) {
            /** 圈内热帖 */
        case LBRadishCoopToolbarButtonTypeHotArti:
            [self setupContectWithCtrl:self.hotView];
            break;
            /** 圈子排行 */
        case LBRadishCoopToolbarButtonTypeItemChart:
            [self setupContectWithCtrl:self.itemView];
            break;
            /** 我的圈子 */
        case LBRadishCoopToolbarButtonTypeMineGroup:
            [self setupContectWithCtrl:self.groupView];
            break;
            
        default:
            break;
    }
}




@end
