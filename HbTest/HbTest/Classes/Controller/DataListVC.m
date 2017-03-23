//
//  DataListVC.m
//  HbTest
//
//  Created by 郝兵 on 16/9/12.
//  Copyright © 2016年 郝兵. All rights reserved.
//

#import "DataListVC.h"
#import <HbGoodsDetailBusinessCategory/CTMediator+HbGoodsDetail.h>

@implementation DataListVC

- (RequestViewModel *)requesViewModel
{
    if (_requesViewModel == nil) {
        _requesViewModel = [[RequestViewModel alloc] init];
    }
    return _requesViewModel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    tableView.dataSource = self.requesViewModel;
    tableView.delegate = self;
    
    [self.view addSubview:tableView];
    self.tableView = tableView;
    
    // 执行请求
    RACSignal *requesSiganl = [self.requesViewModel.reuqesCommand execute:nil];
    
    // 获取请求的数据
    [requesSiganl subscribeNext:^(NSArray *x) {
        
        self.requesViewModel.models = x;
        
        [self.tableView reloadData];
        
    }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIViewController *goodsDetailVC = [[CTMediator sharedInstance] goodsDetailViewControllerWithGoodsId:@"001" goodsName:@"测试商品"];
    [self.navigationController pushViewController:goodsDetailVC animated:YES];
    
}



@end
