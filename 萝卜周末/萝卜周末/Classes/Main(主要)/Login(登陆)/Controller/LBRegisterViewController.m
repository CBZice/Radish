//
//  LBRegisterViewController.m
//  萝卜周末
//
//  Created by Apple_16 on 16/1/19.
//  Copyright (c) 2016年 com.mall. All rights reserved.
//

#import "LBRegisterViewController.h"
#import "LBTextField.h"
@interface LBRegisterViewController ()<UITextFieldDelegate>
@property (nonatomic,strong)LBTextField *accountNumberField;
@property (nonatomic,strong)LBTextField *passwordField;
@property (nonatomic,strong)LBTextField *checkPasswordField;
/**
 *  是否已经偏移了
 */
@property (nonatomic,assign)BOOL isTransform;
@end

@implementation LBRegisterViewController

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
    
    //添加密码
    [self.view addSubview:self.passwordField];
    
    //添加确认密码
    [self.view addSubview:self.checkPasswordField];
    //添加登陆按钮
    UIButton *registerAccount=[[UIButton alloc]initWithFrame:CGRectMake(34, 510, (self.view.width-68), 45)];
    [registerAccount setTitle:@"注册" forState:UIControlStateNormal];
    [registerAccount setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [registerAccount.titleLabel setFont:[UIFont systemFontOfSize:18]];
    registerAccount.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:registerAccount];
    //添加登陆事件
    [registerAccount addTarget:self action:@selector(registerAccountButtonAction) forControlEvents:UIControlEventTouchUpInside];
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
        _passwordField=[[LBTextField alloc]initWithFrame:CGRectMake(34, 370, (self.view.width-68), 45)];
        _passwordField.imageName=nil;
        _passwordField.placeholder=@"密码";
        _passwordField.secureTextEntry=YES;
        _passwordField.delegate=self;
    }
    return _passwordField;
}
//密码确认输入框
-(LBTextField *)checkPasswordField{
    if (_checkPasswordField==nil) {
        _checkPasswordField=[[LBTextField alloc]initWithFrame:CGRectMake(34, 440, (self.view.width-68), 45)];
        _checkPasswordField.imageName=nil;
        _checkPasswordField.placeholder=@"确定密码";
        _checkPasswordField.secureTextEntry=YES;
        _checkPasswordField.delegate=self;
    }
    return _checkPasswordField;
}

#pragma mark-按钮的点击事件
//注册
-(void)registerAccountButtonAction{
    LBLog(@"点击了注册按钮");
}
#pragma mark-输入框的代理方法
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    LBLog(@"%d",self.isTransform);
    if (self.isTransform==NO) {
        [UIView animateWithDuration:0.4 animations:^{
            self.view.transform=CGAffineTransformMakeTranslation(0, -120);
        }];
        self.isTransform=YES;
        LBLog(@"%d",self.isTransform);
    }
    
    
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.accountNumberField resignFirstResponder];
    [self.passwordField resignFirstResponder];
    [self.checkPasswordField resignFirstResponder];
    return YES;
}
-(BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    [self.accountNumberField resignFirstResponder];
    [self.passwordField resignFirstResponder];
    [self.checkPasswordField resignFirstResponder];
    return YES;
}
#pragma mark-当触摸屏幕的时候辞去第一响应
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.accountNumberField resignFirstResponder];
    [self.passwordField resignFirstResponder];
    [self.checkPasswordField resignFirstResponder];
    [UIView animateWithDuration:1 animations:^{
        self.view.transform=CGAffineTransformMakeTranslation(0, 0);
    }];
    self.isTransform=NO;
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
