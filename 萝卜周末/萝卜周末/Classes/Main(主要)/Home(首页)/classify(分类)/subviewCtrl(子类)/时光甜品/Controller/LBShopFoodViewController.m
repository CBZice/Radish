//
//  LBShopFoodViewController.m
//  萝卜周末
//
//  Created by Apple－13 on 16/1/21.
//  Copyright (c) 2016年 com.mall. All rights reserved.
//

#warning 直接将btn添加到foodheaderView上，容易出现错误，下次最好自定义创建继承自UITableViewHeaderFooterView 的view

#import "LBShopFoodViewController.h"
#import "LBFoodFootView.h"
#import "LBFoodMessageCell.h"

@interface LBShopFoodViewController ()

@property (nonatomic, strong) LBFoodFootView *lbFoodFootView;

/** 头视图btn */
@property (nonatomic, strong) UIButton *foodHeaderViewBtn;
@property (nonatomic, strong) UIView *foodHeaderView;
/** 尾视图btn */
@property (nonatomic, strong) UIButton *foodFootViewBtn;
@property (nonatomic, strong) UIView *foodFootView;

/** 初始化全局，防止重复加载 */
@property (nonatomic, strong) UIView *headerView;

@end

@implementation LBShopFoodViewController

#pragma mark----- 懒加载
/** 设置食物的视图 */
-(LBFoodFootView *)lbFoodFootView
{
    if (!_lbFoodFootView) {
        _lbFoodFootView = [[LBFoodFootView alloc] init];
    }
    return _lbFoodFootView;
}
-(UIView *)foodHeaderView
{
    if (!_foodHeaderView) {
        _foodHeaderView = [[UIView alloc] init];
    }
    return _foodHeaderView;
}
-(UIView *)foodFootView
{
    if (!_foodFootView) {
        _foodFootView = [[UIView alloc] init];
    }
    return _foodFootView;
}

/** 设置食物介绍的头视图 */
-(UIButton *)foodHeaderViewBtn
{
    if (!_foodHeaderViewBtn) {
        _foodHeaderViewBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, LBScreenWidth, 44)];
        [_foodHeaderViewBtn setTitle:@"产品优惠  (10)" forState:UIControlStateNormal];
        _foodHeaderViewBtn.backgroundColor = [UIColor whiteColor];
        [_foodHeaderViewBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        _foodHeaderViewBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        _foodHeaderViewBtn.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        _foodHeaderViewBtn.enabled = NO;
    }
    return _foodHeaderViewBtn;
}
/** 设置食物介绍的尾视图 */
-(UIButton *)foodFootViewBtn
{
    if (!_foodFootViewBtn) {
        _foodFootViewBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, LBScreenWidth, 44)];
        [_foodFootViewBtn setTitle:@"查看更多优惠" forState:UIControlStateNormal];

        [_foodFootViewBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        _foodFootViewBtn.backgroundColor = [UIColor whiteColor];
        [_foodFootViewBtn addTarget:self action:@selector(morePreferential) forControlEvents:UIControlEventTouchUpInside];
    }
    return _foodFootViewBtn;
}
-(void)morePreferential{
    LBLog(@"hehe");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /** 设置内边距，使tableView正常显示 */
    self.tableView.contentInset = UIEdgeInsetsMake(-1, 0, 21, 0);
    
    self.tableView.rowHeight = 80;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
/** 界面显示时使导航栏显示 */
-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = NO;
}
/** 重写init，使tableViewstyle转为分组 */
-(instancetype)init
{
    if (self = [super initWithStyle:UITableViewStyleGrouped]) {
    }
    return self;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 1) {
        return 5;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LBFoodMessageCell *cell = [LBFoodMessageCell dequenCellWithTableView:tableView];
    
    
    
    return cell;
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        if (!_headerView) {
            _headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 10)];
            _headerView.backgroundColor = [UIColor whiteColor];
        }
        return _headerView;
    }else  if(section == 1){
        [self.foodHeaderView addSubview:self.foodHeaderViewBtn];
        return self.foodHeaderView;
    }else{
        return nil;
    }
}

-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 1.1;
    }else if (section == 1)
        return 44;
    return 44;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    
    if (section == 0) {
        return self.lbFoodFootView;
    }else if (section == 1){
        [self.foodFootView addSubview:self.foodFootViewBtn];
        return self.foodFootView;
    }else{
        return nil;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 0) {
        return 396 + 2;
    }else if (section == 1){
        return 44;
    }else{
        return 5;
    }
}

@end
