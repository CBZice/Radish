//
//  LBHotArticleViewController.m
//  萝卜周末
//
//  Created by Apple－13 on 16/1/20.
//  Copyright (c) 2016年 com.mall. All rights reserved.
//

#import "LBHotArticleViewController.h"
#import "LBHotArticleCell.h"

@interface LBHotArticleViewController ()


@end

@implementation LBHotArticleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /** 根据比例获得单元格宽度 */
    self.tableView.rowHeight = LBScreenHeight * (225.47/667);
    
    /** 隐藏cell下划线 */
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    /** 初始加载时，设置内边距，使footView不会显示 */
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, -40, 0);
    
}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    LBHotArticleCell *cell = [LBHotArticleCell dequenCellWithTableView:tableView];
    
    /** 首行上部不显示线条 */
    if (indexPath.row == 0) {
        cell.showUplineHidden = YES;
    }
    
    return cell;
}

/** 添加footView */
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor greenColor];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];

    btn.width = 100;
    btn.height = 40;
    btn.centerX = LBScreenWidth * 0.6;
    btn.layer.masksToBounds = YES;
    btn.layer.cornerRadius = 5.0;
    btn.layer.borderWidth = 2;
    btn.layer.borderColor = [UIColor redColor].CGColor;
    [btn setTitle:@"查看更多>>" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(doit) forControlEvents:UIControlEventTouchUpInside];
    
    [view addSubview:btn];
    return view;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 40;
}

- (void)doit
{
    LBLog(@"dashjdkhsajhdakjsd");
}

/** 设置footView随着滚动显示 */
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat sectionFooterHeight = 40;
    CGFloat sectionChange = self.tableView.contentSize.height - (scrollView.contentOffset.y + self.tableView.height);

    if (sectionChange <= sectionFooterHeight && sectionChange>=0) {
        scrollView.contentInset = UIEdgeInsetsMake(0, 0, -sectionChange, 0);
    }
    else if (sectionChange >= sectionFooterHeight) {
        scrollView.contentInset = UIEdgeInsetsMake(0, 0, -sectionFooterHeight, 0);
    }
}



@end
