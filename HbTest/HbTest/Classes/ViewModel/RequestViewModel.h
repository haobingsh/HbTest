//
//  RequestViewModel.h
//  HbTest
//
//  Created by 郝兵 on 16/9/12.
//  Copyright © 2016年 郝兵. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <ReactiveCocoa.h>

@interface RequestViewModel : NSObject<UITableViewDataSource>

// 请求命令
@property (nonatomic, strong) RACCommand *reuqesCommand;

//模型数组
@property (nonatomic, strong) NSArray *models;


@end
