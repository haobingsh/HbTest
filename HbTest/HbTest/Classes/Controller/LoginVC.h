//
//  LoginVC.h
//  HbTest
//
//  Created by 郝兵 on 16/9/9.
//  Copyright © 2016年 郝兵. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginViewModel.h"


@interface LoginVC : UIViewController

@property (nonatomic, strong) LoginViewModel *loginViewModel;

@property (strong, nonatomic)  UITextField *accountField;
@property (strong, nonatomic)  UITextField *pwdField;

@property (strong, nonatomic)  UIButton *loginBtn;

@end
