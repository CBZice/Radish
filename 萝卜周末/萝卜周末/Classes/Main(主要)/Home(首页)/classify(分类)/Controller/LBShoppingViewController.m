//
//  LBShoppingViewController.m
//  萝卜周末
//
//  Created by Apple_16 on 16/1/22.
//  Copyright (c) 2016年 com.mall. All rights reserved.
//

#import "LBShoppingViewController.h"
#import "LBShoppingToLeftCell.h"
#import "LBShoppingToRightCell.h"
@interface LBShoppingViewController ()

@end

@implementation LBShoppingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"购物";
    //设置tableView的样式是没有线条
    self.tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row%2==0) {
        LBShoppingToRightCell *cell=[LBShoppingToRightCell cellWithTableView:tableView];
        cell.detailsLabel.text=@"2016/02/15~2016/06/30裕华道路北区日化化妆品店，百草集系列，满100减20，可累加";
        cell.addressLabel.text=@"0.1公里";
        cell.goodsNameLabel.text=@"【佰草集】专区123213123";
        return cell;
    }
    LBShoppingToLeftCell *cell=[LBShoppingToLeftCell cellWithTableView:tableView];
    cell.detailsLabel.text=@"2016/02/15~2016/06/30裕华道路北区日化化妆品店，百草集系列，满100减20，可累加";
    cell.addressLabel.text=@"0.1公里";
    cell.goodsNameLabel.text=@"【佰草集】专区";
    return cell;
}
#pragma mark-返回高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200;
}

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
