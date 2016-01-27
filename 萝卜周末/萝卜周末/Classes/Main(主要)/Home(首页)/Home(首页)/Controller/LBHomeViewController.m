//
//  LBHomeViewController.m
//  萝卜周末
//
//  Created by Apple_16 on 16/1/18.
//  Copyright (c) 2016年 com.mall. All rights reserved.
//

#import "LBHomeViewController.h"
#import "AppDelegate.h"
#import "LBTestViewController.h"
#import "SphereMenu.h"
#import "LBRadishMeetingViewController.h"
#import "LBTodayRecommedViewController.h"
#import "LBRadishCoopViewController.h"

#import "LBClassifyViewController.h"
@interface LBHomeViewController ()<SphereMenuDelegate>
//温度的label
@property (nonatomic,strong)UILabel *temperatureLabel;
//天气的label
@property (nonatomic,strong)UILabel *weatherLabel;
//天气的图标
@property (nonatomic,strong)UIImageView *weatherImageView;
//风力的label
@property (nonatomic,strong)UILabel *windLabel;
@property (nonatomic,strong)LBClassifyViewController *classifyController;
@property (nonatomic,strong)UIView *smallCircleView;
@property (nonatomic,strong)UIView *middleCircleView;
@property (nonatomic,strong)UIView *bigCircleView;
//顶部整个视图
@property (nonatomic,strong)UIView *topView;
@end

@implementation LBHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:1 green:0.58 blue:0.27 alpha:1];
    //添加导航视图的背景图片
    [self buildBackImage];
    //添加天气视图
    [self bulidWeatherView];
    //添加的是动态的按钮
    UIImage *startImage = [UIImage imageNamed:@"home_icon"];
    UIImage *image1 = [UIImage imageNamed:@"home_classify"];
    UIImage *image2 = [UIImage imageNamed:@"home_radishCoop"];
    UIImage *image3 = [UIImage imageNamed:@"home_radishMeeting"];
    UIImage *image4 = [UIImage imageNamed:@"home_radishAssistant"];
    NSArray *images = @[image1, image2, image3,image4];
    SphereMenu *sphereMenu = [[SphereMenu alloc] initWithStartPoint:CGPointMake(LBScreenWidth/2, LBScreenHeight/4)
                                                         startImage:startImage
                                                      submenuImages:images];
    sphereMenu.delegate = self;
    [self.view addSubview:sphereMenu];
    // 1. url
    NSURL *url = [NSURL URLWithString:@"http://api.k780.com:88/?app=weather.future&weaid=1&&appkey=17615&sign=2b6d65174d9954e97c1e46a39d7ba13e&format=json"];
    
    // 2. 请求
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    // 3. 连接
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        id result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:NULL];
        if (result == nil) {
            return ;
        }
//        LBLog(@"%@",result);
        NSDictionary *dict=(NSDictionary *)result;
        id dictResult=[dict objectForKey:@"result"];
//        LBLog(@"%@  %@",dictResult,[dictResult class]);
        NSDictionary *todayWeatherDict=[dictResult firstObject];
//        LBLog(@"%@   %@",todayWeatherDict,[todayWeatherDict class]);
        //温度label
        self.temperatureLabel.text=[todayWeatherDict objectForKey:@"temperature"];
        NSString *weather_icon=[todayWeatherDict objectForKey:@"weather_icon"];
        NSURL *imageUrl=[NSURL URLWithString:weather_icon];
        NSData *imageData=[NSData dataWithContentsOfURL:imageUrl];
        //天气的图标
        self.weatherImageView.image=[UIImage imageWithData:imageData];
        //天气label
        self.weatherLabel.text=[todayWeatherDict objectForKey:@"weather"];
        //风力label
        self.windLabel.text=[todayWeatherDict objectForKey:@"winp"];
        
    }];
}
#pragma mark-懒加载三个原型图
-(UIView *)smallCircleView{
    if (_smallCircleView==nil) {
        _smallCircleView=[[UIView alloc]init];
        _smallCircleView.width=LBScreenWidth/4;
        _smallCircleView.height=LBScreenWidth/4;
        _smallCircleView.centerX=LBScreenWidth/2;
        _smallCircleView.centerY=LBScreenHeight/4;
        _smallCircleView.layer.masksToBounds=YES;
        _smallCircleView.layer.cornerRadius=_smallCircleView.width/2;
        _smallCircleView.backgroundColor=[UIColor whiteColor];
        _smallCircleView.alpha=0.8;
        
    }
    return _smallCircleView;
}
-(UIView *)middleCircleView{
    if (_middleCircleView==nil) {
        _middleCircleView=[[UIView alloc]init];
        _middleCircleView.width=LBScreenWidth/2;
        _middleCircleView.height=LBScreenWidth/2;
        _middleCircleView.centerX=LBScreenWidth/2;
        _middleCircleView.centerY=LBScreenHeight/4;
        _middleCircleView.layer.masksToBounds=YES;
        _middleCircleView.layer.cornerRadius=_middleCircleView.width/2;
        _middleCircleView.backgroundColor=[UIColor whiteColor];
        _middleCircleView.alpha=0.6;
    }
    return _middleCircleView;
}
-(UIView *)bigCircleView{
    if (_bigCircleView==nil) {
        _bigCircleView=[[UIView alloc]init];
        _bigCircleView.width=LBScreenWidth/4*3;
        _bigCircleView.height=LBScreenWidth/4*3;
        _bigCircleView.centerX=LBScreenWidth/2;
        _bigCircleView.centerY=LBScreenHeight/4;
        _bigCircleView.layer.masksToBounds=YES;
        _bigCircleView.layer.cornerRadius=_bigCircleView.width/2;
        _bigCircleView.backgroundColor=[UIColor whiteColor];
        _bigCircleView.alpha=0.5;
    }
    return _bigCircleView;
}
#pragma mark-添加导航视图的背景图片
-(void)buildBackImage{
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, LBScreenWidth, LBScreenHeight/7*4)];
    UIImageView *backImageView=[[UIImageView alloc]initWithFrame:view.bounds];
    UIImage *image=[UIImage imageNamed:@"home_backImage"];
    backImageView.image=image;
    self.topView=view;
    [view addSubview:backImageView];
    [self.view addSubview:view];
    [view addSubview:self.smallCircleView];
    [view addSubview:self.middleCircleView];
    [view addSubview:self.bigCircleView];
}
#pragma mark-添加天气视图
-(void)bulidWeatherView{
    //天气的视图
    UIView *weatherView=[[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.topView.frame), self.view.width, LBScreenHeight/7*3)];
    [self.view addSubview:weatherView];
    UILabel *weatherTitle=[[UILabel alloc]initWithFrame:CGRectMake(40, 20, 150, 30)];
    weatherTitle.text=@"今日天气:";
    [weatherView addSubview:weatherTitle];
    //温度
    UILabel *temperatureLabel=[[UILabel alloc]initWithFrame:CGRectMake(80, 60, 150, 30)];
    self.temperatureLabel=temperatureLabel;
    temperatureLabel.font=[UIFont systemFontOfSize:15];
    [weatherView addSubview:temperatureLabel];
    //天气的图标
    UIImageView *weatherImageView=[[UIImageView alloc]initWithFrame:CGRectMake(60, 105, 28, 20)];
    [weatherView addSubview:weatherImageView];
    self.weatherImageView=weatherImageView;
    //天气
    UILabel *weatherLabel=[[UILabel alloc]initWithFrame:CGRectMake(100, 100, 50, 30)];
    self.weatherLabel=weatherLabel;
    weatherLabel.font=[UIFont systemFontOfSize:15];
    [weatherView addSubview:weatherLabel];
    //风力
    UILabel *windLabel=[[UILabel alloc]initWithFrame:CGRectMake(80, 150, 250, 30)];
    self.windLabel=windLabel;
    windLabel.font=[UIFont systemFontOfSize:15];
    [weatherView addSubview:windLabel];
    //添加今日推荐的按钮
    UIButton *todayRecommendedButton=[[UIButton alloc]initWithFrame:CGRectMake(210, 60, 100, 100)];
    todayRecommendedButton.layer.masksToBounds=YES;
    [todayRecommendedButton setTitle:@"查看\n今日推荐\n>>" forState:UIControlStateNormal];
    todayRecommendedButton.titleLabel.textAlignment=NSTextAlignmentCenter;
    todayRecommendedButton.titleLabel.numberOfLines=0;
    todayRecommendedButton.titleLabel.font=[UIFont boldSystemFontOfSize:16];
    todayRecommendedButton.layer.cornerRadius=todayRecommendedButton.width/2;
    todayRecommendedButton.backgroundColor=LBColor(51, 17, 6);
    [weatherView addSubview:todayRecommendedButton];
    
    [todayRecommendedButton addTarget:self action:@selector(todayRecommendedButtonClick) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark ---- 今日推荐按钮响应事件
- (void)todayRecommendedButtonClick
{
    [self.navigationController pushViewController:[[LBTodayRecommedViewController alloc] init] animated:YES];
}
#pragma mark-懒加载
-(LBClassifyViewController *)classifyController{
    if (_classifyController==nil) {
        _classifyController=[[LBClassifyViewController alloc]init];
        
    }
    return _classifyController;
}
#pragma mark-控制器将要显示出来
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden=YES;
    self.tabBarController.tabBar.hidden=NO;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}
#pragma mark-SphereMenuDelegate的代理方法
-(void)sphereDidSelected:(int)index{
    if (index==0) {
        [self.navigationController pushViewController:self.classifyController animated:YES];
    }
    if (index==2) {
        [self.navigationController pushViewController:[[LBRadishMeetingViewController alloc]init] animated:YES];
    }
    if (index==1) {
        
        
        [self.navigationController pushViewController:[[LBRadishCoopViewController alloc]init] animated:YES];
    }
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
