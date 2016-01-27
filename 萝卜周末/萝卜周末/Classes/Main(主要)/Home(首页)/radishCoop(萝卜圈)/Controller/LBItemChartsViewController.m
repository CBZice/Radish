//
//  LBItemChartsViewController.m
//  萝卜周末
//
//  Created by Apple－13 on 16/1/20.
//  Copyright (c) 2016年 com.mall. All rights reserved.
//

#import "LBItemChartsViewController.h"
#import "LBSetupTableViewCell.h"
#import "UIImageView+LBCreateCircleImgView.h"

@interface LBItemChartsViewController ()



@end

@implementation LBItemChartsViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    
    self.tableView.rowHeight = 69;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LBSetupTableViewCell *cell = [LBSetupTableViewCell dequenCellWithTableView:tableView];
    
    
//    UIImageView *imgView = [UIImageView createCircleImgViewWithimageName:@"1.jpg" boardWidth:2 circleRadius:27 boardColor:[UIColor redColor]];
//    [cell.imgView addSubview:imgView];
    
    cell.imgView.image = [UIImage imageNamed:@"23233.jpg"];
    
    /** 设置显示圆形图标 */
    cell.circleImgView = YES;
    
    /** 设置圆形图标的边框 */
    cell.circleHaveBoard = YES;
    cell.circleBoardWidth = 2.0;
    cell.circleBoardColor = [UIColor redColor];
    
    /** 设置显示属性 */
    cell.textlbl.text = @"女生部落";
    cell.textlbl.textColor = [UIColor redColor];
    cell.detaillbl.text = @"总金额和";
    cell.detaillbl.textColor = [UIColor blackColor];
    cell.detaillbl.font = [UIFont systemFontOfSize:16];
    
    return cell;
}





@end
