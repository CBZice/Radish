//
//  LBRootTabbarController.m
//  萝卜周末
//
//  Created by Apple_16 on 16/1/18.
//  Copyright (c) 2016年 com.mall. All rights reserved.
//

#import "LBRootTabbarController.h"
#import "LBUpdateTabbar.h"
#import "LBFindViewController.h"
#import "LBProfileViewController.h"
#import "LBSearchViewController.h"
#import "LBHomeViewController.h"
#import "LBNavigationController.h"
@interface LBRootTabbarController ()<LBUpdateTabbarDelegate>

@end

@implementation LBRootTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // 1. "首页"导航控制器
    LBHomeViewController *home = [[LBHomeViewController alloc] init];
    [self addShowController:home Title:@"首页" NormalImageName:@"tabbar_home"];
    
    // 2. "发现"导航控制器
    LBFindViewController *find = [[LBFindViewController alloc] init];
    [self addShowController:find Title:@"发现" NormalImageName:@"tabbar_find"];
    
    // 3. "搜索"导航控制器
    LBSearchViewController *search = [[LBSearchViewController alloc] init];
    [self addShowController:search Title:@"搜索" NormalImageName:@"tabbar_search"];
    
    // 4. "我"导航控制器
    LBProfileViewController *own = [[LBProfileViewController alloc] init];
    [self addShowController:own Title:@"我" NormalImageName:@"tabbar_profile"];

    // 5. 自定义tabbar -- 用KVC的模式修改系统私有的属性值
    LBUpdateTabbar *tabbar = [[LBUpdateTabbar alloc] init];
    tabbar.subdelegate = self;
    [self setValue:tabbar forKeyPath:@"tabBar"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
// 添加子控制器--并实现子控制器中的某些属性
- (void)addShowController:(UIViewController *)showController Title:(NSString *)title NormalImageName:(NSString *)imageName
{
    // 0. 创建一个navigationController
     LBNavigationController *nav = [[LBNavigationController alloc] initWithRootViewController:showController];
    
    // 2. 子控制器在tabbar上的名字
//    showController.title = title; //navigationBar和tabbar上的文字一块显示
        showController.navigationItem.title = title; // navigationBar上的文字
        nav.tabBarItem.title = title; // tabbar上的文字
    
    // 3.1 设置子控制器在tabbar上显示的图片---normal状态--并设置好图片不进行渲染
    nav.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]; // 正常状态下的图片
    
    // 4.1 设置显示在tabbar上的文字的颜色--normal状态
    NSMutableDictionary *normalDic = [[NSMutableDictionary alloc] init]; // 创建一个可变的字典用来存储文字颜色
    normalDic[NSForegroundColorAttributeName] = [UIColor colorWithRed:123/255.0 green:123/255.0 blue:123/255.0 alpha:1.0]; // 已NSForegroundColorAttributeName为Key存储文字颜色
    [nav.tabBarItem setTitleTextAttributes:normalDic forState:UIControlStateNormal];
    
    
    if (![UIImage imageNamed:[imageName stringByAppendingString:@"_selected"]]) {
        NSLog(@"选中状态的图片不存在,或格式错误!正确格式为:正常状态图片后缀_selected");
    }else {
        // 3.1 设置子控制器在tabbar上显示的图片---selected状态--并设置好图片不进行渲染
        nav.tabBarItem.selectedImage = [[UIImage imageNamed:[imageName stringByAppendingString:@"_selected"]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]; // 选中状态下的图片
        
        // 4.2 设置显示在tabbar上的文字的颜色--selected状态
        NSMutableDictionary *highlightDic = [[NSMutableDictionary alloc] init];
        highlightDic[NSForegroundColorAttributeName] = [UIColor orangeColor];
        [nav.tabBarItem setTitleTextAttributes:highlightDic forState:UIControlStateSelected];
    }
    
    // 5. 添加到tabbar上
    
    [self addChildViewController:nav];
    
}
#pragma mark-updateTabbar的代理
-(void)updateTabbarDidClick:(LBUpdateTabbar *)updateTabbar{
    LBLog(@"发表按钮点击了");
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
