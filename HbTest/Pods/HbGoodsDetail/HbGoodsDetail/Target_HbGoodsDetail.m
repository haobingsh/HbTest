//
//  Target_TAGoodsDetail.m
//  TAGoodsDetail
//
//  Created by Charon on 16/12/25.
//  Copyright © 2016年 Charon. All rights reserved.
//

#import "Target_HbGoodsDetail.h"
#import "HbGoodsDetailViewController.h"

@implementation Target_HbGoodsDetail

- (UIViewController *)Action_GoodsDetailViewController:(NSDictionary *)params
{
    HbGoodsDetailViewController *goodsDetailVC = [[HbGoodsDetailViewController alloc] init];
    goodsDetailVC.goodsId = params[@"goodsId"];
    goodsDetailVC.goodsName = params[@"goodsName"];
    return goodsDetailVC;
}

@end
