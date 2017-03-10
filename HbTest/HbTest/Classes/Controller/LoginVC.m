//
//  LoginVC.m
//  HbTest
//
//  Created by 郝兵 on 16/9/9.
//  Copyright © 2016年 郝兵. All rights reserved.
//


#import "LoginVC.h"
#import "DataListVC.h"


//当前屏幕宽
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
//当前屏幕
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@implementation LoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.accountField = [[UITextField alloc] initWithFrame:CGRectMake(SCREEN_WIDTH*0.05, 100, SCREEN_WIDTH*0.9, 35)];
    self.accountField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.accountField.layer.borderWidth = 0.5;
    self.accountField.layer.cornerRadius = 5;
    [self.view addSubview:self.accountField];
    
    self.pwdField = [[UITextField alloc] initWithFrame:CGRectMake(SCREEN_WIDTH*0.05, 200, SCREEN_WIDTH*0.9, 35)];
    self.pwdField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.pwdField.layer.borderWidth = 0.5;
    self.pwdField.layer.cornerRadius = 5;
    [self.view addSubview:self.pwdField];
    
    self.loginBtn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH*0.05, 300, SCREEN_WIDTH*0.9, 35)];
    self.loginBtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.loginBtn.layer.borderWidth = 0.5;
    self.loginBtn.layer.cornerRadius = 5;
    self.loginBtn.backgroundColor = [UIColor greenColor];
    [self.loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    self.loginBtn.enabled = NO;
    [self.view addSubview:self.loginBtn];
    
    [self bindModel];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (LoginViewModel *)loginViewModel
{
    if (_loginViewModel == nil) {
        
        _loginViewModel = [[LoginViewModel alloc] init];
    }
    return _loginViewModel;
}

// 视图模型绑定
- (void)bindModel{
    // 给模型的属性绑定信号
    // 只要账号文本框一改变，就会给account赋值
    RAC(self.loginViewModel.account, account) = _accountField.rac_textSignal;
    RAC(self.loginViewModel.account, pwd) = _pwdField.rac_textSignal;
    
    // 绑定登录按钮
    RAC(self.loginBtn,enabled) = self.loginViewModel.enableLoginSignal;
    
    // 监听登录按钮点击
    [[_loginBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        
        // 执行登录事件
        [[self.loginViewModel.LoginCommand execute:nil] subscribeNext:^(NSString* x) {
            NSLog(@"返回值是啥呢：%@",x);
            DataListVC *vc = [[DataListVC alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }];
    }];
}



@end
