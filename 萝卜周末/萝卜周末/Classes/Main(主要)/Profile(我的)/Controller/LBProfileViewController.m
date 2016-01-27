//
//  LBMoreChooseViewController.m
//  萝卜周末
//
//  Created by Apple－13 on 16/1/19.
//  Copyright (c) 2016年 com.mall. All rights reserved.
//

#import "LBProfileViewController.h"
#import "LBSetupTableViewCell.h"
#import "LBSetupViewController.h"
#import "LBPersonallyView.h"

#define     LBMoreChooseViewCellTypeNewMain         @"新人红包"
#define     LBMoreChooseViewCellTypeCollection      @"我的收藏"
#define     LBMoreChooseViewCellTypeRecords         @"历史记录"
#define     LBMoreChooseViewCellTypeSetup           @"设置"
#define     LBMoreChooseViewCellTypeQuit            @"退出"


@interface LBProfileViewController ()

/** 每行显示的内容 */
@property (nonatomic, strong) NSArray *kindArr;

/** 每行显示的照片 */
@property (nonatomic, strong) NSArray *photosArr;

@property (nonatomic, strong) LBSetupViewController *setupViewCtrl;
@property (nonatomic, strong) LBPersonallyView *personalView;

@end

@implementation LBProfileViewController

#pragma mark ---- 懒加载

-(NSArray *)photosArr
{
    if (!_photosArr) {
        _photosArr = @[@"personalCenter_newmain", @"personalCenter_collection", @"personalCenter_historyRecord", @"personalCenter_setup", @"personalCenter_quit"];
    }
    return _photosArr;
}

-(LBPersonallyView *)personalView
{
    if (!_personalView) {
        _personalView = [[LBPersonallyView alloc] init];
        
        
        _personalView.frame = CGRectMake(0, 0, LBScreenWidth, 333);
    }
    return _personalView;
}

-(LBSetupViewController *)setupViewCtrl
{
    if (!_setupViewCtrl) {
        _setupViewCtrl = [[LBSetupViewController alloc] init];
    }
    return _setupViewCtrl;
}
-(NSArray *)kindArr
{
    if (!_kindArr) {
        _kindArr = @[LBMoreChooseViewCellTypeNewMain ,   LBMoreChooseViewCellTypeCollection, LBMoreChooseViewCellTypeRecords, LBMoreChooseViewCellTypeSetup,
            LBMoreChooseViewCellTypeQuit];
    }
    return _kindArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
 
    self.tableView.rowHeight = 55;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
}


#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.kindArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LBSetupTableViewCell *cell = [LBSetupTableViewCell dequenCellWithTableView:tableView];
    cell.textlbl.text = self.kindArr[indexPath.row];
    
    cell.imgView.image = [UIImage imageNamed:self.photosArr[indexPath.row]];
    
    cell.accesstype = LBSetupTableViewCellAccessoryArrow;
    if (indexPath.row == self.kindArr.count - 1) {
        cell.lineView.hidden = YES;
    }
    return cell;
}
-(instancetype)init
{
    if (self = [super initWithStyle:UITableViewStyleGrouped]) {
        
    }
    return self;
}

/** 设置头视图 */
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    self.personalView.backgroundColor = LBColorAlpha(244, 79, 28, 0.83);
    return self.personalView;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 250;
}
/** 设置尾视图高度，隐藏 */
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 1.1;
}
/** cell点击事件 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *str = self.kindArr[indexPath.row];
    NSLog(@"%@", str);
    
    if ([str isEqualToString:LBMoreChooseViewCellTypeSetup]) {
        [self.navigationController pushViewController:self.setupViewCtrl animated:YES];
    }
}


@end
