//
//  LoginViewModel.h
//  HbTest
//
//  Created by 郝兵 on 16/9/9.
//  Copyright © 2016年 郝兵. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Account.h"
#import <ReactiveCocoa.h>


@interface LoginViewModel : NSObject

@property (nonatomic, strong) Account *account;

// 是否允许登录的信号
@property (nonatomic, strong, readonly) RACSignal *enableLoginSignal;

@property (nonatomic, strong, readonly) RACCommand *LoginCommand;

@end
