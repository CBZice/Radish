//
//  LBChoiceFoodViewController.m
//  萝卜周末
//
//  Created by Apple_16 on 16/1/21.
//  Copyright (c) 2016年 com.mall. All rights reserved.
//

#import "LBChoiceFoodViewController.h"
#import "LBChoiceFoodChooseButtonView.h"
#import "LBChoiceFoodCollectionViewCell.h"
#import "LBChoiceFoodModel.h"
#import "CHTCollectionViewWaterfallLayout.h"
#import "UIImageView+WebCache.h"
@interface LBChoiceFoodViewController ()<UIScrollViewDelegate,LBChoiceFoodChooseButtonViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource,CHTCollectionViewDelegateWaterfallLayout>
//图片的滚动视图
@property (nonatomic,strong)UIScrollView *scrollView;
//pagecontrol
@property (nonatomic,strong)UIPageControl *pageControl;
//定时器
@property (nonatomic,strong)NSTimer *timer;
//美食选项的视图
@property (nonatomic,strong)LBChoiceFoodChooseButtonView *chooseButtonView;
//瀑布流布局
@property (nonatomic,strong) UICollectionView *collectionView;
//数据源数组
@property (nonatomic,strong) NSMutableArray *dataArray;
@end

@implementation LBChoiceFoodViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title=@"美食";
    self.view.backgroundColor=[UIColor whiteColor];

    //添加广告滚动视图
    [self.view addSubview:self.scrollView];
    //添加pagecontroll
    [self.view addSubview:self.pageControl];
    //添加选项视图
    [self.view addSubview:self.chooseButtonView];
    //加载数据
    [self initData];
    //添加UICollectionView
    [self.view addSubview:self.collectionView];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden=NO;
    
    
    [self addTimer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#warning 这里的滚动视图有BUG，多出来20像素的高度
#pragma mark-懒加载
-(UIScrollView *)scrollView{
    if (_scrollView == nil) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, LBScreenWidth, 200)];
        // 0.一些固定的尺寸参数
        CGFloat imageW =LBScreenWidth;
        CGFloat imageH = _scrollView.height;
        CGFloat imageY = -20;
        for (int i=0; i<5; i++) {
            UIImageView *imageView = [[UIImageView alloc] init];
            
            // 设置frame
            CGFloat imageX = i * imageW;
            imageView.frame = CGRectMake(imageX, imageY, imageW, imageH);
            
            // 设置图片
            NSString *name = [NSString stringWithFormat:@"img_0%d", i + 1];
            imageView.image = [UIImage imageNamed:name];
            
            [_scrollView addSubview:imageView];
            
        }
        // 2.设置内容尺寸
        CGFloat contentW = 5 * imageW;
        _scrollView.contentSize = CGSizeMake(contentW, 0);
        
        // 3.隐藏水平滚动条
        _scrollView.showsHorizontalScrollIndicator = NO;
        
        // 4.分页
        _scrollView.pagingEnabled = YES;
        _scrollView.delegate=self;
    }
    return _scrollView;
}
-(UIPageControl *)pageControl{
    if (_pageControl==nil) {
        _pageControl=[[UIPageControl alloc]initWithFrame:CGRectMake((self.view.width-200)/2, CGRectGetMaxY(self.scrollView.frame)-10, 200, 0)];
        _pageControl.numberOfPages=5;
        _pageControl.currentPageIndicatorTintColor=[UIColor orangeColor];

    }
    return _pageControl;
}
-(LBChoiceFoodChooseButtonView *)chooseButtonView{
    if (_chooseButtonView==nil) {
        _chooseButtonView=[[LBChoiceFoodChooseButtonView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.scrollView.frame)+5, LBScreenWidth, 80)];
        _chooseButtonView.delegate=self;
    }
    return _chooseButtonView;
}
-(UICollectionView *)collectionView{
    if (_collectionView==nil) {
        CHTCollectionViewWaterfallLayout *layout = [[CHTCollectionViewWaterfallLayout alloc] init];
        //垂直方向滚动
        layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
//        layout.itemRenderDirection=CHTCollectionViewWaterfallLayoutItemRenderDirectionLeftToRight;
        _collectionView=[[UICollectionView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.chooseButtonView.frame)+5, LBScreenWidth, LBScreenHeight-CGRectGetMaxY(self.chooseButtonView.frame)-5-self.tabBarController.tabBar.height) collectionViewLayout:layout];
        _collectionView.bounces = NO;
        _collectionView.pagingEnabled = YES;
        //设置滑动的区域
        _collectionView.contentSize=CGSizeMake(0, LBScreenHeight);
        _collectionView.collectionViewLayout=layout;
        _collectionView.userInteractionEnabled=YES;
        //
        _collectionView.scrollEnabled=YES;
        // 设置水平方向上的滚动条不显示
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator=NO;
        _collectionView.userInteractionEnabled=YES;
        _collectionView.backgroundColor=[UIColor grayColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[LBChoiceFoodCollectionViewCell class] forCellWithReuseIdentifier:@"item"];
    }
    return _collectionView;
}
#pragma mark-加载数据
- (void)initData {
    NSArray *imageArray = @[
                            @"http://g.hiphotos.baidu.com/image/w%3D310/sign=6f9ce22079ec54e741ec1c1f89399bfd/9d82d158ccbf6c81cea943f6be3eb13533fa4015.jpg",
                            @"http://b.hiphotos.baidu.com/image/pic/item/4bed2e738bd4b31cc6476eb985d6277f9e2ff8bd.jpg",
                            @"http://c.hiphotos.baidu.com/image/pic/item/94cad1c8a786c9174d18e030cb3d70cf3bc7579b.jpg",
                            @"http://e.hiphotos.baidu.com/image/w%3D310/sign=79bc1b1a950a304e5222a6fbe1c9a7c3/d1160924ab18972b50a46fd4e4cd7b899e510a15.jpg",
                            @"http://c.hiphotos.baidu.com/image/w%3D310/sign=05e2c867272dd42a5f0907aa333a5b2f/7dd98d1001e93901f3f7103079ec54e737d196c3.jpg",
                            @"http://e.hiphotos.baidu.com/image/w%3D310/sign=3914596cf1deb48ffb69a7dfc01e3aef/d0c8a786c9177f3ea3e73f0072cf3bc79e3d56e8.jpg",
                            @"http://c.hiphotos.baidu.com/image/w%3D310/sign=8cc67b8cc91349547e1eee65664e92dd/4610b912c8fcc3ce11e40a3e9045d688d43f2093.jpg",
                            @"http://c.hiphotos.baidu.com/image/w%3D310/sign=93e1c429952bd40742c7d5fc4b889e9c/3812b31bb051f8191cdd594bd8b44aed2e73e733.jpg",
                            @"http://b.hiphotos.baidu.com/image/pic/item/4bed2e738bd4b31cc6476eb985d6277f9e2ff8bd.jpg",
                            @"http://c.hiphotos.baidu.com/image/pic/item/94cad1c8a786c9174d18e030cb3d70cf3bc7579b.jpg",
                            @"http://e.hiphotos.baidu.com/image/w%3D310/sign=3914596cf1deb48ffb69a7dfc01e3aef/d0c8a786c9177f3ea3e73f0072cf3bc79e3d56e8.jpg",
                            @"http://c.hiphotos.baidu.com/image/w%3D310/sign=93e1c429952bd40742c7d5fc4b889e9c/3812b31bb051f8191cdd594bd8b44aed2e73e733.jpg",
                            @"http://e.hiphotos.baidu.com/image/w%3D310/sign=d4507def9d3df8dca63d8990fd1072bf/d833c895d143ad4b758c35d880025aafa40f0603.jpg",
                            @"http://c.hiphotos.baidu.com/image/w%3D310/sign=702acce2552c11dfded1b92253266255/d62a6059252dd42a3ac70aaa013b5bb5c8eab8e0.jpg",
                            @"http://h.hiphotos.baidu.com/image/w%3D310/sign=75ff59cd19d5ad6eaaf962ebb1ca39a3/b64543a98226cffcb9f3ddbbbb014a90f703eada.jpg",
                            @"http://e.hiphotos.baidu.com/image/w%3D310/sign=11386163f1deb48ffb69a7dfc01e3aef/d0c8a786c9177f3e8bcb070f72cf3bc79f3d5631.jpg",
                            @"http://f.hiphotos.baidu.com/image/w%3D310/sign=8ed508bbd358ccbf1bbcb33b29d8bcd4/8694a4c27d1ed21b33ff8fecaf6eddc451da3f80.jpg",
                            @"http://b.hiphotos.baidu.com/image/w%3D310/sign=ad40ca82c9ef76093c0b9f9e1edca301/5d6034a85edf8db16aa7b27b0b23dd54564e7420.jpg",
                            @"http://e.hiphotos.baidu.com/image/w%3D310/sign=79bc1b1a950a304e5222a6fbe1c9a7c3/d1160924ab18972b50a46fd4e4cd7b899e510a15.jpg",
                            @"http://c.hiphotos.baidu.com/image/w%3D310/sign=05e2c867272dd42a5f0907aa333a5b2f/7dd98d1001e93901f3f7103079ec54e737d196c3.jpg",
                            @"http://g.hiphotos.baidu.com/image/w%3D310/sign=6f9ce22079ec54e741ec1c1f89399bfd/9d82d158ccbf6c81cea943f6be3eb13533fa4015.jpg",
                            @"http://e.hiphotos.baidu.com/image/w%3D310/sign=79bc1b1a950a304e5222a6fbe1c9a7c3/d1160924ab18972b50a46fd4e4cd7b899e510a15.jpg"
                            ];
    
    self.dataArray = [NSMutableArray array];
    for (NSString *item in imageArray) {
        LBChoiceFoodModel *model = [LBChoiceFoodModel new];
        model.imageUrl = item;
        model.foodName=@"猪蹄";
        
        [self.dataArray addObject:model];
    }
}

#pragma mark - UICollectionView Delegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataArray.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    LBChoiceFoodCollectionViewCell *cell = (LBChoiceFoodCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"item"
                                                                           forIndexPath:indexPath];
    
    LBChoiceFoodModel *model = [self.dataArray objectAtIndex:indexPath.row];
    
    NSString *imgUrlString = model.imageUrl;
    cell.foodNameLabel.text=model.foodName;
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:imgUrlString] placeholderImage:[UIImage imageNamed:@"loading"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        if (image) {
            if (!CGSizeEqualToSize(model.imageSize, image.size)) {
                model.imageSize = image.size;
                [collectionView reloadItemsAtIndexPaths:@[indexPath]];
            }
        }
    }];
    
    return cell;
}

#pragma mark - CHTCollectionViewDelegateWaterfallLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    LBChoiceFoodModel *model = [self.dataArray objectAtIndex:indexPath.row];
    if (!CGSizeEqualToSize(model.imageSize, CGSizeZero)) {
        return model.imageSize;
    }
    return CGSizeMake(150, 150);
}
/**
 *  添加定时器
 */
- (void)addTimer
{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(nextImage) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

/**
 *  移除定时器
 */
- (void)removeTimer
{
    [self.timer invalidate];
    self.timer = nil;
}

- (void)nextImage
{
    // 1.增加pageControl的页码
    int page = 0;
    if (self.pageControl.currentPage == 5 - 1) {
        page = 0;
    } else {
        page = (int)self.pageControl.currentPage + 1;
    }
    // 2.计算scrollView滚动的位置
    CGFloat offsetX = page * LBScreenWidth;
    CGPoint offset = CGPointMake(offsetX, -20);
    [self.scrollView setContentOffset:offset animated:YES];
    
}

#pragma mark - scrollView代理方法
/**
 *  当scrollView正在滚动就会调用
 */
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    scrollView.contentSize=CGSizeMake(LBScreenWidth*5, 0);
    // 根据scrollView的滚动位置决定pageControl显示第几页
    CGFloat scrollW = scrollView.width;
    int page = (scrollView.contentOffset.x + scrollW * 0.5) / scrollW;
    self.pageControl.currentPage = page;

}

/**
 *  开始拖拽的时候调用
 */
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    scrollView.contentSize=CGSizeMake(LBScreenWidth*5, 0);
    // 停止定时器(一旦定时器停止了,就不能再使用)
    [self removeTimer];
}

/**
 *  停止拖拽的时候调用
 */
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    // 开启定时器
    [self addTimer];
}
#pragma mark-chooseButtonView的代理方法
-(void)choiceFoodChooseButtonViewDidClickedButton:(LBChoiceFoodChooseButtonView *)buttonView withButton:(UIButton *)sender{
    LBLog(@"点击了第几个按钮%ld",sender.tag+1);
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
