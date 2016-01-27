//
//  LBClassifyViewController.m
//  萝卜周末
//
//  Created by Apple_16 on 16/1/18.
//  Copyright (c) 2016年 com.mall. All rights reserved.
//

#import "LBClassifyViewController.h"
#import "LBClassifyCollectionViewCell.h"
#import "LBChoiceFoodViewController.h"
#import "LBArrangeMeetingViewController.h"
#import "LBShoppingViewController.h"
#import "LBOutDoorViewController.h"
@interface LBClassifyViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,LBClassifyCollectionViewCellDelegate>
@property (nonatomic,strong)UICollectionView *collectionView;
@property (nonatomic,strong)NSArray *array;
@end
static NSString *collectionCellIdentifer=@"cellID";
@implementation LBClassifyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title=@"分类";
    [self.view addSubview:self.collectionView];
    self.view.backgroundColor=[UIColor whiteColor];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden=NO;
    self.tabBarController.tabBar.hidden=NO;

//    self.tabBarController.tabBar.x=0;
}
#pragma mark-懒加载
-(UICollectionView *)collectionView{
    if (_collectionView==nil) {
        //将子视图的位置，大小和外观的控制权委托给一个单独的布局对象UICollectionViewLayout的对象
        //流式布局，较为常用
        UICollectionViewFlowLayout *collectionViewLayout = [[UICollectionViewFlowLayout alloc] init];
        // 设置滑动方向
        collectionViewLayout.scrollDirection = UICollectionViewScrollDirectionVertical; // 水平方向
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height) collectionViewLayout:collectionViewLayout];
        _collectionView.bounces = NO;
        _collectionView.pagingEnabled = NO;
        _collectionView.contentSize=CGSizeMake(0, 750);
        // 设置水平方向上的滚动条不显示
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor=[UIColor whiteColor];
        //注册CollectionViewCell，添加cell
        //self是实例的指针，[self class]是类的指针，静态方法得用类的指针来调用
        [_collectionView registerClass:[LBClassifyCollectionViewCell class] forCellWithReuseIdentifier:collectionCellIdentifer];
    }
    return _collectionView;
}
-(NSArray *)array{
    if (_array==nil) {
        NSString *path=[[NSBundle mainBundle]pathForResource:@"classifyType" ofType:@"plist"];
        _array=[NSArray arrayWithContentsOfFile:path];
    }
    return _array;
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
    return self.array.count;
}

//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LBClassifyCollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:collectionCellIdentifer forIndexPath:indexPath];
    //自适应
    [cell sizeToFit];
    cell.delegate=self;
    NSDictionary *dict=self.array[indexPath.row];
    if (cell.classTypeButton.tag) {
        cell.classTypeButton.tag=indexPath.row;
    }else{
        cell.classTypeButton.tag=indexPath.row;
    }
    
    cell.classTypeNameLabel.text=[dict objectForKey:@"typeName"];
    [cell.classTypeButton setImage:[UIImage imageNamed:[dict objectForKey:@"typeButtonImage"]] forState:UIControlStateNormal];
    cell.backImageView=[dict objectForKey:@"typeBackImage"];
    return cell;
    
}
#pragma mark - UICollectionFlowLayoutDelegate
//定义每个item的 大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((self.view.frame.size.width-20)/2,(self.view.frame.size.width-20)/2);
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

#pragma mark - UICollectionDelegate
//被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%ld",indexPath.row);
}
//是否可以被选择
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
#pragma mark-cell的代理方法，页面的跳转
-(void)classifyCollectionViewCellDidClickedClassTypeButton:(LBClassifyCollectionViewCell *)cell withTag:(NSUInteger)tag{
    LBLog(@"点击了第几个%ld",tag);
    if (tag==1) {
        [self.navigationController pushViewController:[[LBChoiceFoodViewController alloc]init] animated:YES];
    }
    if (tag==4) {
        [self.navigationController pushViewController:[[LBOutDoorViewController alloc]init] animated:YES];
    }
    if (tag==5) {
        [self.navigationController pushViewController:[[LBShoppingViewController alloc]init] animated:YES];
    }
    if (tag==7) {
        [self.navigationController pushViewController:[[LBArrangeMeetingViewController alloc]init] animated:YES];
    }
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
