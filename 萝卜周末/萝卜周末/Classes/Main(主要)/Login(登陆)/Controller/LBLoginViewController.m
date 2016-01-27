//
//  LBLoginViewController.m
//  萝卜周末
//
//  Created by dp on 16/1/18.
//  Copyright (c) 2016年 com.mall. All rights reserved.
//

#import "LBLoginViewController.h"
#import "LBTextField.h"
@interface LBLoginViewController ()<UITextFieldDelegate>
@property (nonatomic,strong)LBTextField *accountNumberField;
@property (nonatomic,strong)LBTextField *passwordField;
/**
 *  是否已经偏移了
 */
@property (nonatomic,assign)BOOL isTransform;
@end

@implementation LBLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImageView *iconview=[[UIImageView alloc]initWithFrame:CGRectMake((self.view.width-120)/2, 60, 120, 120)];
    iconview.image=[UIImage imageNamed:@"Icon-60"];
    [self.view addSubview:iconview];
    self.view.backgroundColor=LBColor(243, 87, 37);
    //添加appName
    UILabel *appNameLabel=[[UILabel alloc]initWithFrame:CGRectMake((self.view.width-200)/2, 200,200 , 45)];
    appNameLabel.text=@"萝卜周末";
    [appNameLabel setFont:[UIFont boldSystemFontOfSize:18]];
    appNameLabel.textAlignment=NSTextAlignmentCenter;
    appNameLabel.textColor=[UIColor whiteColor];
    [self.view addSubview:appNameLabel];
    //添加账号
    [self.view addSubview:self.accountNumberField];
    
    //添加账号
    [self.view addSubview:self.passwordField];
    
    //添加登陆按钮
    UIButton *loginButton=[[UIButton alloc]initWithFrame:CGRectMake(34, 460, (self.view.width-68), 45)];
    [loginButton setTitle:@"登陆" forState:UIControlStateNormal];
    [loginButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [loginButton.titleLabel setFont:[UIFont systemFontOfSize:18]];
    loginButton.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:loginButton];
    //添加登陆事件
    [loginButton addTarget:self action:@selector(loginButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    //添加忘记密码按钮
    UIButton *forgetPwd=[[UIButton alloc]initWithFrame:CGRectMake(34, self.view.height-60,120, 45)];
    [forgetPwd setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:forgetPwd];
    //设置button下划线
    [forgetPwd setAttributedTitle:[NSMutableAttributedString getUnderlineStringWithNSString:@" 忘记密码 ？"] forState:UIControlStateNormal];
    //添加忘记密码按钮的点击事件
    [forgetPwd addTarget:self action:@selector(forgetPwdAction) forControlEvents:UIControlEventTouchUpInside];
    
    //添加注册按钮
    UIButton *registerAccount=[[UIButton alloc]initWithFrame:CGRectMake(self.view.width-120-34, self.view.height-60,120, 45)];
    [registerAccount setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [registerAccount setAttributedTitle:[NSMutableAttributedString getUnderlineStringWithNSString:@" 注册 "] forState:UIControlStateNormal];
    [self.view addSubview:registerAccount];
    //添加注册按钮的点击事件
    [registerAccount addTarget:self action:@selector(registerAccountAction) forControlEvents:UIControlEventTouchUpInside];
}
#pragma mark-懒加载
//账号输入框
-(LBTextField *)accountNumberField{
    if (_accountNumberField==nil) {
        _accountNumberField=[[LBTextField alloc]initWithFrame:CGRectMake(34, 300, (self.view.width-68), 45)];
        _accountNumberField.imageName=nil;
        _accountNumberField.placeholder=@"手机号/邮箱";
        _accountNumberField.delegate=self;
    }
    return _accountNumberField;
}
//密码输入框
-(LBTextField *)passwordField{
    if (_passwordField==nil) {
        _passwordField=[[LBTextField alloc]initWithFrame:CGRectMake(34, 380, (self.view.width-68), 45)];
        _passwordField.imageName=nil;
        _passwordField.placeholder=@"密码";
        _passwordField.secureTextEntry=YES;
        _passwordField.delegate=self;
    }
    return _passwordField;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark-按钮的点击事件
//登陆按钮的点击事件
-(void)loginButtonAction{
    LBLog(@"点击了登陆按钮");
}
//忘记密码
-(void)forgetPwdAction{
    LBLog(@"点击了忘记密码的按钮");
}
//注册
-(void)registerAccountAction{
    LBLog(@"点击了注册按钮");
}
#pragma mark-输入框的代理方法
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    if (self.isTransform==NO) {
        [UIView animateWithDuration:0.4 animations:^{
            self.view.transform=CGAffineTransformMakeTranslation(0, -60);
        }];
        self.isTransform=YES;
        LBLog(@"%d",self.isTransform);
    }
    return YES;
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.accountNumberField resignFirstResponder];
    [self.passwordField resignFirstResponder];
    return YES;
}
-(BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    [self.accountNumberField resignFirstResponder];
    [self.passwordField resignFirstResponder];
    return YES;
}
#pragma mark-当触摸屏幕的时候辞去第一响应
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.accountNumberField resignFirstResponder];
    [self.passwordField resignFirstResponder];
    [UIView animateWithDuration:0.4 animations:^{
        self.view.transform=CGAffineTransformMakeTranslation(0, 0);
    }];
    self.isTransform=NO;
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
