//
//  LBMyFootprintViewController.m
//  萝卜周末
//
//  Created by Apple_16 on 16/1/20.
//  Copyright (c) 2016年 com.mall. All rights reserved.
//

#import "LBMyFootprintViewController.h"
#import "LBMyFootprintFrame.h"
#import "LBMyFootprint.h"
#import "LBMyFootprintCell.h"
@interface LBMyFootprintViewController ()
@property (nonatomic,strong)NSMutableArray *listArray;
@end

@implementation LBMyFootprintViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    //设置当前的tableView为没有下划线的形式
    self.tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    // 创建并设置下拉获得最新动态/上拉获取以前的动态
    [self createRefresh];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
#pragma mark-懒加载数组
-(NSMutableArray *)listArray{
    if (_listArray==nil) {
        _listArray=[NSMutableArray array];
        LBMyFootprint *l1=[[LBMyFootprint alloc]init];
        l1.time=@"7:00";
        l1.userName=@"江南烟雨尽";
        l1.conent=@"巴黎是地上一座城，地球...";
        
        LBMyFootprintFrame *f1=[[LBMyFootprintFrame alloc]init];
        f1.myFootprint=l1;
        [_listArray addObject:f1];
        
        LBMyFootprint *l2=[[LBMyFootprint alloc]init];
        l2.time=@"6:30";
        l2.iconName=@"萌萌的";
        l2.conent=@"魅力的周末你还准备宅在家里吗,放下手机远离电脑，一起去南湖野营吧。";
        LBMyFootprintFrame *f2=[[LBMyFootprintFrame alloc]init];
        f2.myFootprint=l2;
        [_listArray addObject:f2];
        
        LBMyFootprint *l3=[[LBMyFootprint alloc]init];
        l3.time=@"6:15";
        l3.iconName=@"photo.jpg";
        LBMyFootprintFrame *f3=[[LBMyFootprintFrame alloc]init];
        f3.myFootprint=l3;
        [_listArray addObject:f3];
        
        LBMyFootprint *l4=[[LBMyFootprint alloc]init];
        l4.time=@"5:32";
        l4.iconName=@"213.jpg";
        LBMyFootprintFrame *f4=[[LBMyFootprintFrame alloc]init];
        f4.myFootprint=l4;
        [_listArray addObject:f4];
        
    }
    return _listArray;
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return self.listArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 1. 获取单元格 -- 可重用 -- 自定义
    LBMyFootprintCell *cell = [LBMyFootprintCell footprintCellWithTableView:tableView];
    
    // 2. 给单元格中的属性frame赋值
    cell.footprintFrame = self.listArray[indexPath.row];
    
    return cell;
}
// 对应行有多高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LBMyFootprintFrame *footprintFrame = self.listArray[indexPath.row];
    return footprintFrame.cellHeight;
}

@end
