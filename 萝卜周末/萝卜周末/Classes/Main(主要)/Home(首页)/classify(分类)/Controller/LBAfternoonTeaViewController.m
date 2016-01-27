//
//  LBAfternoonTeaViewController.m
//  萝卜周末
//
//  Created by Apple_16 on 16/1/22.
//  Copyright (c) 2016年 com.mall. All rights reserved.
//

#import "LBAfternoonTeaViewController.h"
#import "LBAfternoonTeaCollectionCell.h"

#import "LBShopFoodViewController.h"

@interface LBAfternoonTeaViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
/**分段控制器*/
@property (nonatomic,strong) UISegmentedControl *segementControl;
@property (nonatomic,strong) UILabel *shopNameLabel;
@property (nonatomic,strong) UIImageView *searchImageView;
@property (nonatomic,strong)UICollectionView *collectionView;
@property (nonatomic,strong)UIView *middleView;
@end
static NSString *cellWithIdentifier = @"cellWithIdentifier";
@implementation LBAfternoonTeaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
#warning 这里预留出200的高度放广告的轮播器
    self.title=@"下午茶";
    self.view.backgroundColor=[UIColor whiteColor];
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, LBScreenWidth, 200)];
    view.backgroundColor=[UIColor grayColor];
    [self.view addSubview:view];
    //添加中间的视图
    [self buildMiddleView];
    //添加UICollectionView
    [self.view addSubview:self.collectionView];
}
#pragma mark-懒加载
-(UISegmentedControl *)segementControl{
    if (_segementControl==nil) {
        NSArray *array=[NSArray arrayWithObjects:@"优惠",@"地址",@"商品", nil];
        _segementControl=[[UISegmentedControl alloc]initWithItems:array];
        _segementControl.frame=CGRectMake((LBScreenWidth-(CGRectGetMaxX(self.searchImageView.frame)+10)-250)/2+(CGRectGetMaxX(self.searchImageView.frame)+10), self.searchImageView.y, 250, 40);
        //设置UISegmentedControl的整体颜色
        _segementControl.tintColor=LBColor(172, 164, 158);
        //设置默认UISegmentedControl选中的位置
        _segementControl.selectedSegmentIndex=0;
        _segementControl.userInteractionEnabled=YES;
        [_segementControl addTarget:self action:@selector(segementChange:) forControlEvents:UIControlEventValueChanged];
    }
    return _segementControl;
}
-(UICollectionView *)collectionView
{
    if (!_collectionView) {
        //将子视图的位置，大小和外观的控制权委托给一个单独的布局对象UICollectionViewLayout的对象
        //流式布局，较为常用
        UICollectionViewFlowLayout *collectionViewLayout = [[UICollectionViewFlowLayout alloc] init];
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.middleView.frame)+5, LBScreenWidth, LBScreenHeight-self.tabBarController.tabBar.height-CGRectGetMaxY(self.middleView.frame)-5) collectionViewLayout:collectionViewLayout];
        _collectionView.backgroundColor = LBColor(232, 234, 235);
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        
        //注册CollectionViewCell，添加cell
        //self是实例的指针，[self class]是类的指针，静态方法得用类的指针来调用
        [_collectionView registerClass:[LBAfternoonTeaCollectionCell class] forCellWithReuseIdentifier:cellWithIdentifier];
    }
    return _collectionView;
}
#pragma mark-创建中间的视图
-(void)buildMiddleView{
    //创建一个视图
    UIView *middleView=[[UIView alloc]initWithFrame:CGRectMake(0, 200, LBScreenWidth, 150)];
    middleView.backgroundColor=LBColor(240, 229, 221);
    [self.view addSubview:middleView];
    self.middleView=middleView;
    //在视图上添加小店的名称
    UILabel *shopNameLabel=[[UILabel alloc]initWithFrame:CGRectMake((LBScreenWidth-250)/2, 10, 250, 40)];
    shopNameLabel.text=@"时光甜品小站";
    shopNameLabel.textColor=[UIColor blackColor];
    shopNameLabel.font=[UIFont boldSystemFontOfSize:18];
    self.shopNameLabel=shopNameLabel;
    [middleView addSubview:shopNameLabel];
    //添加一个UIImageView
#warning 这里还需要添加图片
    UIImageView *searchImageView=[[UIImageView alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(shopNameLabel.frame)+10, 40, 40)];
    searchImageView.backgroundColor=[UIColor grayColor];
    [middleView addSubview:searchImageView];
    self.searchImageView=searchImageView;
    //添加一个分段控制器
    [middleView addSubview:self.segementControl];
}
#pragma mark-分段控制器的点击事件
-(void)segementChange:(UISegmentedControl *)segement{
    LBLog(@"%ld",segement.selectedSegmentIndex);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - 代理方法
//定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

//定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 6;
}

//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LBAfternoonTeaCollectionCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:cellWithIdentifier forIndexPath:indexPath];
    //自适应
    [cell sizeToFit];
    cell.addressLabel.text=@"远洋城时光甜品店";
    cell.discountLabel.text=@"美味奶酪到店享八折优惠";
    return cell;
    
}


#pragma mark - UICollectionFlowLayoutDelegate
//定义每个item的 大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(LBScreenWidth-10,200);
}
//定义item的间距
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(5, 5, 5, 5);
}

//定义每个UICollectionView,列与列之间的距离
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 5;
}

//行与行之间的距离
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 5;
}

//cell点击事件
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self.navigationController pushViewController:[[LBShopFoodViewController alloc] init] animated:YES];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
