//
//  LBOutDoorViewController.m
//  萝卜周末
//
//  Created by Apple－13 on 16/1/22.
//  Copyright (c) 2016年 com.mall. All rights reserved.
//

#import "LBOutDoorViewController.h"
#import "LBOutdoorHeaderView.h"
#import "LBOutdoorPictureCell.h"

#define OutdoorHeaderViewHeight         LBScreenWidth * 0.6

@interface LBOutDoorViewController ()

@property (nonatomic, strong) LBOutdoorHeaderView *outdoorHeaderView;

@end

@implementation LBOutDoorViewController

#pragma mark ----  懒加载
-(LBOutdoorHeaderView *)outdoorHeaderView
{
    if (!_outdoorHeaderView) {
        _outdoorHeaderView = [[LBOutdoorHeaderView alloc] init];
    }
    return _outdoorHeaderView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.rowHeight = LBScreenHeight / 3 + 40;
    
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, -40, 0);
    
}
-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = NO;
}

/** 设置单元格格式为分组 */
-(instancetype)init{
    if (self = [super initWithStyle:UITableViewStyleGrouped]) {
        
    }
    return self;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

/** 设置行数 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LBOutdoorPictureCell *cell = [LBOutdoorPictureCell dequenCellWithTableView:tableView];
    return cell;
}

#pragma mark -----   设置头视图
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    self.outdoorHeaderView.imageView.image = [UIImage imageNamed:@"3.jpg"];
        UIView *view = [[UIView alloc] init];
    [view addSubview:_outdoorHeaderView];
    return view;
}
-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForHeaderInSection:(NSInteger)section
{
    return OutdoorHeaderViewHeight;
}
@end
