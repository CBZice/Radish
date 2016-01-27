//
//  LBLeftSortsViewController.m
//  萝卜周末
//
//  Created by Apple_16 on 16/1/18.
//  Copyright (c) 2016年 com.mall. All rights reserved.
//

#import "LBLeftSortsViewController.h"
#import "LBSearchTypeButton.h"
@interface LBLeftSortsViewController ()<LBSearchTypeButtonDelegate>

@end

@implementation LBLeftSortsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=LBColor(39, 34, 37);
    UIImageView *avatarIcon=[[UIImageView alloc]initWithFrame:CGRectMake((self.view.width-120-80)/2, 60, 120, 120)];
    avatarIcon.layer.masksToBounds=YES;
    avatarIcon.layer.cornerRadius=avatarIcon.width/2;
    avatarIcon.backgroundColor=[UIColor redColor];
    [self.view addSubview:avatarIcon];
    
    UILabel *userNameLabel=[[UILabel alloc]initWithFrame:CGRectMake((self.view.width-120-80)/2, CGRectGetMaxY(avatarIcon.frame)+10, 120, 40)];
    userNameLabel.textColor=[UIColor whiteColor];
    userNameLabel.textAlignment=NSTextAlignmentCenter;
    userNameLabel.text=@"颜諾熙";
    userNameLabel.font=[UIFont boldSystemFontOfSize:20];
    [self.view addSubview:userNameLabel];
    
    //添加按钮
    CGFloat typeButtonWidth=(self.view.width-20*3-120)/2;
    CGFloat typeButtonHeight=(self.view.height-30*4-CGRectGetMaxY(userNameLabel.frame))/3;
    NSArray *typeButtonName=[NSArray arrayWithObjects:@"活动提醒",@"点赞",@"邀请朋友",@"私信",@"主题设置",@"夜间", nil];
    int index=1;
    for (int i=0; i<2; i++) {
        
        for (int j=0; j<3; j++) {
            LBSearchTypeButton *typeButton=[[LBSearchTypeButton alloc]initWithFrame:CGRectMake(i*(typeButtonWidth+30)+30, j*(typeButtonHeight+30)+30+CGRectGetMaxY(userNameLabel.frame), typeButtonWidth, typeButtonHeight)];
            [typeButton searchTypeButtonWithNormalImage:[NSString stringWithFormat:@"settingButton_0%d",index] SelectedImage:nil title:[typeButtonName objectAtIndex:index-1] tap:index];
            typeButton.titleLable.textColor=[UIColor whiteColor];
            typeButton.delegate=self;
            [self.view addSubview:typeButton];
            index++;
        }
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
