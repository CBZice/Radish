//
//  LBTodayRecommedViewController.m
//  萝卜周末
//
//  Created by dp on 16/1/20.
//  Copyright (c) 2016年 com.mall. All rights reserved.
//

#import "LBTodayRecommedViewController.h"
#import "LBTodayRecommedCollectionViewCell.h"
#import "LBTodayRecommedCollectionviewLayout.h"
@interface LBTodayRecommedViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,LBTodayRecommedCollectionViewCellDelegate>
@property (nonatomic,strong) UICollectionView *collectionView;
@end
static NSString *collectionCellIdentifer=@"cellID";
@implementation LBTodayRecommedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title=@"今日推荐";
    [self.view addSubview:self.collectionView];
    self.view.backgroundColor=[UIColor whiteColor];
    self.navigationController.navigationBar.hidden=NO;
    
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];

    self.navigationController.navigationBar.hidden=NO;
    self.tabBarController.tabBar.x=0;
}
#pragma mark-懒加载
-(UICollectionView *)collectionView{
    if (_collectionView==nil) {
        //将子视图的位置，大小和外观的控制权委托给一个单独的布局对象UICollectionViewLayout的对象
        //流式布局，较为常用
        LBTodayRecommedCollectionviewLayout *collectionViewLayout = [[LBTodayRecommedCollectionviewLayout alloc] init];
        // 设置滑动方向
        collectionViewLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal; // 水平方向
        // 设置layout的数量
        collectionViewLayout.itemCount = 4;
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 10, LBScreenWidth, self.view.height*3/5) collectionViewLayout:collectionViewLayout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.bounces = NO;
        _collectionView.pagingEnabled = YES;
        
        // 设置水平方向上的滚动条不显示
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        //注册CollectionViewCell，添加cell
        //self是实例的指针，[self class]是类的指针，静态方法得用类的指针来调用
        [_collectionView registerClass:[LBTodayRecommedCollectionViewCell class] forCellWithReuseIdentifier:collectionCellIdentifer];
    }
    return _collectionView;
}
#pragma mark - UICollectionView代理方法
//定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

//定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 4;
    
}

//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    LBTodayRecommedCollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:collectionCellIdentifer forIndexPath:indexPath];
    
    return cell;
}
#pragma mark-UIScrollViewDelegate的代理方法
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
