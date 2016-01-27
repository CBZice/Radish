//
//  LBNavigationController.m
//  萝卜周末
//
//  Created by Apple_16 on 16/1/18.
//  Copyright (c) 2016年 com.mall. All rights reserved.
//

#import "LBNavigationController.h"

@interface LBNavigationController ()

@end

@implementation LBNavigationController
-(instancetype)initWithRootViewController:(UIViewController *)rootViewController{
    self=[super initWithRootViewController:rootViewController];
    if (self) {

    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.viewControllers.count>0) {
        //这时push进来的控制器viewController,不是第一个子控制器（不是根控制器）
        //自动显示和隐藏tabbar
//        viewController.hidesBottomBarWhenPushed=YES;
        //设置导航栏上面的内容
        UIImage *backImage=[UIImage imageNamed:@"fahui"];
        backImage=[backImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        viewController.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithImage:backImage style:UIBarButtonItemStylePlain target:self action:@selector(back)];
        
    }
    [super pushViewController:viewController animated:NO];
}
-(void)back{
    [self popViewControllerAnimated:NO];
}


@end
