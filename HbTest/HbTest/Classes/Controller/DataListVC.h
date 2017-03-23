//
//  DataListVC.h
//  HbTest
//
//  Created by 郝兵 on 16/9/12.
//  Copyright © 2016年 郝兵. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RequestViewModel.h"

@interface DataListVC : UIViewController<UITableViewDelegate>

@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, strong) RequestViewModel *requesViewModel;

@end
