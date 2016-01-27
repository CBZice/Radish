//
//  LBSetupViewController.m
//  萝卜周末
//
//  Created by Apple－13 on 16/1/19.
//  Copyright (c) 2016年 com.mall. All rights reserved.
//

#import "LBSetupViewController.h"
#import "LBSetupTableViewCell.h"

@interface LBSetupViewController ()

@property (nonatomic, strong) NSArray *textArr;
@property (nonatomic, strong) NSArray *detailArr;

@property (nonatomic, strong) NSArray *anotherArr;

@end

@implementation LBSetupViewController

-(NSArray *)textArr
{
    if (!_textArr) {
        _textArr = @[@"推送功能", @"显示精品推荐", @"非WIFI条件下，提示"];
    }
    return _textArr;
}
-(NSArray *)detailArr
{
    if (!_detailArr) {
        _detailArr = @[@"关闭推送功能，停止热门推送", @"关闭精品推荐功能，将不再接受每日推荐", @"非WIFI网络下，产生资费时，是否提示"];
    }
    return _detailArr;
}
-(NSArray *)anotherArr
{
    if (!_anotherArr) {
        _anotherArr = @[@"版本更新", @"意见反馈", @"关于"];
    }
    return _anotherArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /** 去除系统自带下划线 */
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    /** 关闭弹簧效果 */
    self.tableView.bounces = NO;
    self.tableView.backgroundColor = [UIColor whiteColor];
}

-(instancetype)init
{
    if (self = [super init]) {
        
    }
    return [self initWithStyle:UITableViewStyleGrouped];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section <= 2) {
        return 1;
    }else
        return 3;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section <= 2) {
        return 79;
    }else
        return 60;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LBSetupTableViewCell *cell = [LBSetupTableViewCell dequenCellWithTableView:tableView];
    
    if (indexPath.section <= 2) {
        cell.textlbl.text = self.textArr[indexPath.section];
        cell.detaillbl.text = self.detailArr[indexPath.section];
        cell.accesstype = LBSetupTableViewCellAccessoryPicker;
    }else{
        cell.textlbl.text = self.anotherArr[indexPath.row];
        cell.accesstype = LBSetupTableViewCellAccessoryNone;
    }
    return cell;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, LBScreenWidth, 20)];
    view.backgroundColor = LBColor(238, 238, 238);
    return view;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, -1, LBScreenWidth, 1)];
    view.backgroundColor = [UIColor whiteColor];
    return view;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}


@end
