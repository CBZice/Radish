//
//  LBRadishMeetingViewController.m
//  萝卜周末
//
//  Created by Apple_16 on 16/1/18.
//  Copyright (c) 2016年 com.mall. All rights reserved.
//

#import "LBRadishMeetingViewController.h"
#import "LBRecommendedActivityViewController.h"
#import "LBMyFootprintViewController.h"
@interface LBRadishMeetingViewController ()
@property (strong,nonatomic) UIButton *recommendedButton;
@property (nonatomic,strong) UIButton *footprintButton;
@property (nonatomic,strong) UIButton *aboutUsButton;
@property (nonatomic,strong) UIView *conentView;
@property (nonatomic,strong) LBRecommendedActivityViewController *recommendedActivityViewController;
@property (nonatomic,strong)LBMyFootprintViewController *myFootpeintViewController;
@property (nonatomic,strong) UIView *myFootprintView;
@property (nonatomic,strong) UIView *view3;
@end

@implementation LBRadishMeetingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor whiteColor];
    // Do any additional setup after loading the view.
    self.title=@"萝卜约";
    //添加顶部的切换控制栏
    UIView *menuView=[[UIView alloc]initWithFrame:CGRectMake(0, 68, self.view.width, 44)];
    menuView.backgroundColor=[UIColor blueColor];
    [self.view addSubview:menuView];
    //添加活动推荐的按钮
    [menuView addSubview:self.recommendedButton];
    //添加我的足迹的按钮
    [menuView addSubview:self.footprintButton];
    //添加关于我的的按钮
    [menuView addSubview:self.aboutUsButton];
    
    //添加切换的视图
    UIView *conentView=[[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(menuView.frame), self.view.width, self.view.height-CGRectGetMaxY(menuView.frame))];
    self.conentView=conentView;
    [self.view addSubview:conentView];
    [self.conentView addSubview:self.recommendedActivityViewController.view];
}
#pragma mark-页面将要显示
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden=NO;
    self.tabBarController.tabBar.hidden=YES;
}
#pragma mark-懒加载按钮
-(UIButton *)recommendedButton{
    if (_recommendedButton==nil) {
        _recommendedButton=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, self.view.width/3, 44)];
        [_recommendedButton setTitle:@"活动推荐" forState:UIControlStateNormal];
        [_recommendedButton addTarget:self action:@selector(recommendedButtonClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _recommendedButton;
}
-(UIButton *)footprintButton{
    if (_footprintButton==nil) {
        _footprintButton=[[UIButton alloc]initWithFrame:CGRectMake(self.view.width/3, 0, self.view.width/3, 44)];
        [_footprintButton setTitle:@"我的足迹" forState:UIControlStateNormal];
        [_footprintButton addTarget:self action:@selector(footprintButtonClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _footprintButton;
}
-(UIButton *)aboutUsButton{
    if (_aboutUsButton==nil) {
        _aboutUsButton=[[UIButton alloc]initWithFrame:CGRectMake(self.view.width/3*2, 0, self.view.width/3, 44)];
        [_aboutUsButton setTitle:@"关于我的" forState:UIControlStateNormal];
        [_aboutUsButton addTarget:self action:@selector(aboutUsButtonClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _aboutUsButton;
}
-(LBRecommendedActivityViewController *)recommendedActivityViewController{
    if (_recommendedActivityViewController==nil) {
        _recommendedActivityViewController=[[LBRecommendedActivityViewController alloc]init];
        _recommendedActivityViewController.view.frame=self.conentView.bounds;
    }
    return _recommendedActivityViewController;
}
-(UIView *)myFootprintView{
    if (_myFootprintView==nil) {
        _myFootprintView=[[UIView alloc]initWithFrame:self.conentView.bounds];
        //左边的视图
        UIView *leftView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, _myFootprintView.width/4, _myFootprintView.height)];
        [_myFootprintView addSubview:leftView];
        //右边的视图
        UIView *rightView=[[UIView alloc]initWithFrame:CGRectMake(_myFootprintView.width/4, 10, _myFootprintView.width/4*3, _myFootprintView.height-10)];
        LBMyFootprintViewController *footprintViewController=[[LBMyFootprintViewController alloc]init];
        self.myFootpeintViewController=footprintViewController;
        footprintViewController.view.frame=rightView.bounds;
        [rightView addSubview:footprintViewController.view];
        [_myFootprintView addSubview:rightView];
        //中间的线视图
        UIView *middleView=[[UIView alloc]initWithFrame:CGRectMake(_myFootprintView.width/4, 0, 1, _myFootprintView.height)];
        middleView.backgroundColor=[UIColor orangeColor];
        [_myFootprintView addSubview:middleView];
    }
    return _myFootprintView;
}
-(UIView *)view3{
    if (_view3==nil) {
        _view3=[[UIView alloc]initWithFrame:self.conentView.bounds];
        _view3.backgroundColor=[UIColor cyanColor];
    }
    return _view3;
}
#pragma mark-三个控制按钮的点击事件
//活动推荐按钮的点击事件
-(void)recommendedButtonClick{
    LBLog(@"点击了活动推荐按钮");
    [self.conentView addSubview:self.recommendedActivityViewController.view];
    [self.myFootprintView removeFromSuperview];
    [self.view3 removeFromSuperview];
}
//我的足迹按钮的点击事件
-(void)footprintButtonClick{
    LBLog(@"点击了我的足迹按钮");
    [self.conentView addSubview:self.myFootprintView];
    [self.recommendedActivityViewController.view removeFromSuperview];
    [self.view3 removeFromSuperview];
}
//关于我的按钮的点击事件
-(void)aboutUsButtonClick{
    
    LBLog(@"点击了关于我的按钮");
    [self.conentView addSubview:self.view3];
    [self.myFootprintView removeFromSuperview];
    [self.recommendedActivityViewController.view removeFromSuperview];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
