//
//  LBMyGroupViewController.m
//  萝卜周末
//
//  Created by Apple－13 on 16/1/20.
//  Copyright (c) 2016年 com.mall. All rights reserved.
//

#import "LBMyGroupViewController.h"
#import "LBSetupTableViewCell.h"
#import "UIImageView+LBCreateCircleImgView.h"

@interface LBMyGroupViewController ()

@property (nonatomic, strong) NSArray *itemArr;

@end

@implementation LBMyGroupViewController

-(NSArray *)itemArr
{
    if (!_itemArr) {
        _itemArr = @[@"我创建的圈子", @"我加入的圈子"];
    }
    return _itemArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tableView.backgroundColor = [UIColor grayColor];
    
    self.tableView.rowHeight = 69;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return self.itemArr.count;;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LBSetupTableViewCell *cell = [LBSetupTableViewCell dequenCellWithTableView:tableView];
    
//    UIImageView *imgView = [UIImageView createCircleImgViewWithimageName:@"222.jpg" boardWidth:0 circleRadius:27 boardColor:[UIColor redColor]];
//    [cell.imgView addSubview:imgView];
    
    cell.imgView.image = [UIImage imageNamed:@"222.jpg"];
    cell.circleImgView = YES;
    
    cell.textlbl.text = @"骑行团";
    cell.detaillbl.text = @"承德大坝";
    
    return cell;
}




- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return self.itemArr[section];
}

@end
