//
//  LBArrangeMeetingViewController.m
//  萝卜周末
//
//  Created by Apple_16 on 16/1/22.
//  Copyright (c) 2016年 com.mall. All rights reserved.
//

#import "LBArrangeMeetingViewController.h"
#import "LBArrangeMeetingCollectionCell.h"
#import "LBArrangeMeetingReusableView.h"
#import "LBAfternoonTeaViewController.h"
//cell之间的间距
#define Cellpadding 10
@interface LBArrangeMeetingViewController ()<UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
//创建collectionView
@property (nonatomic, strong) UICollectionView *collectionView;
//数据源的数组
@property (nonatomic,strong) NSArray *dateArray;
@end
static NSString *cellWithIdentifier = @"cellWithIdentifier";
@implementation LBArrangeMeetingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //添加uicollectionview
    [self.view addSubview:self.collectionView];

}
#pragma mark - 懒加载
-(UICollectionView *)collectionView
{
    if (!_collectionView) {
        //将子视图的位置，大小和外观的控制权委托给一个单独的布局对象UICollectionViewLayout的对象
        //流式布局，较为常用
        UICollectionViewFlowLayout *collectionViewLayout = [[UICollectionViewFlowLayout alloc] init];
        
        //设置头部
        collectionViewLayout.headerReferenceSize = CGSizeMake(LBScreenWidth, 80);
        _collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:collectionViewLayout];
        _collectionView.backgroundColor = LBColor(232, 234, 235);
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        
        //注册CollectionViewCell，添加cell
        //self是实例的指针，[self class]是类的指针，静态方法得用类的指针来调用
        [_collectionView registerClass:[LBArrangeMeetingCollectionCell class] forCellWithReuseIdentifier:cellWithIdentifier];
        [_collectionView registerClass:[LBArrangeMeetingReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"Reuserbleview"];
        //        [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footerView"];
    }
    return _collectionView;
}
-(NSArray *)dateArray{
    if (_dateArray==nil) {
        NSArray *array1=[NSArray arrayWithObjects:@"mettingType_01",@"mettingType_02",@"mettingType_03",@"mettingType_04",@"mettingType_05",@"mettingType_06",nil];
        NSArray *array2=[NSArray arrayWithObjects:@"mettingType_07",@"mettingType_08",@"mettingType_09", nil];
        _dateArray=[NSArray arrayWithObjects: array1,array2,nil];
    }
    return _dateArray;
}
#pragma mark - 代理方法
//定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.dateArray.count;
}

//定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.dateArray[section]count];
}

//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LBArrangeMeetingCollectionCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:cellWithIdentifier forIndexPath:indexPath];
    //自适应
    cell.imageName=self.dateArray[indexPath.section][indexPath.row];
    [cell sizeToFit];
    return cell;
    
}

//头部显示的内容
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    LBArrangeMeetingReusableView *reusableView=nil;
    if (kind==UICollectionElementKindSectionHeader) {
        reusableView = [self.collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"Reuserbleview" forIndexPath:indexPath];
        reusableView.backgroundColor = LBColor(232, 234, 235);
        if (indexPath.section==0) {
            reusableView.typeNameLabel.text=@"-----------午后静谧-----------";
        }else if (indexPath.section==1){
            reusableView.typeNameLabel.text=@"-----------悠然周末-----------";
        }
        
    }
    
    return reusableView;
    
}

#pragma mark - UICollectionFlowLayoutDelegate
//定义每个item的 大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((LBScreenWidth-Cellpadding*4)/3,150);
}
//定义item的间距
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10, 10, 10, 10);
}

//定义每个UICollectionView,列与列之间的距离
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 10;
}

//行与行之间的距离
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 10;
}

#pragma mark - UICollectionDelegate
//被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self.navigationController pushViewController:[[LBAfternoonTeaViewController alloc]init] animated:YES];
    LBLog(@"%ld",indexPath.row);
}
//是否可以被选择
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
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
