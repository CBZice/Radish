//
//  LBRecommendedActivityViewController.m
//  萝卜周末
//
//  Created by Apple_16 on 16/1/20.
//  Copyright (c) 2016年 com.mall. All rights reserved.
//

#import "LBRecommendedActivityViewController.h"
#import "LBStatuse.h"
#import "LBStatuseFrame.h"
#import "LBStatuseCell.h"
#import "LBUser.h"
#import "LBMaskingView.h"                 //创建蒙版
@interface LBRecommendedActivityViewController ()<LBMaskingViewDelegate>
@property (nonatomic,strong)NSMutableArray *statuseFrames;   //活动动态frame模型的数组


@end

@implementation LBRecommendedActivityViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 获得用户信息
    [self getUserInfo];
    // 创建并设置下拉获得最新动态/上拉获取以前的动态
    [self createRefresh];
}
#pragma mark-懒加载
-(NSMutableArray *)statuseFrames{
    if (_statuseFrames==nil) {
        _statuseFrames=[NSMutableArray array];
    }
    return _statuseFrames;
}
#pragma mark-获取用户信息
-(void)getUserInfo{
    
}
#pragma mark-下拉刷新
-(void)createRefresh{
    // 1. 创建刷新控件
    UIRefreshControl *refresh = [[UIRefreshControl alloc] init];
    refresh.attributedTitle = [[NSAttributedString alloc] initWithString:@"下拉刷新"];
    // 2. 添加一个刷新事件
    [refresh addTarget:self action:@selector(refreshStatuse:) forControlEvents:UIControlEventValueChanged];
    
    // 3. 添加到表格上
    self.refreshControl = refresh;
    
    // 4. 调用刷新控件的开始刷新方法
    [refresh beginRefreshing];
    
    // 5. 手动实现刷新微博数据
    [self refreshStatuse:refresh];
}
// 下拉获得最新微博
- (void)refreshStatuse:(UIRefreshControl *)refresh
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [refresh endRefreshing];
    });
    LBLog(@"下拉刷新");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark-添加蒙版的代理方法
-(void)createMaskingView:(LBMaskingView *)view{
    
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
