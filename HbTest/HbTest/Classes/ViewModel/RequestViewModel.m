//
//  RequestViewModel.m
//  HbTest
//
//  Created by 郝兵 on 16/9/12.
//  Copyright © 2016年 郝兵. All rights reserved.
//

#import "RequestViewModel.h"
#import "Book.h"
#import <AFNetworking.h>


@implementation RequestViewModel

- (instancetype)init
{
    if (self = [super init]) {
        
        [self initialBind];
    }
    return self;
}


- (void)initialBind{
    
    _reuqesCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        
        RACSignal *requestSignal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
            
            
            NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
            parameters[@"q"] = @"基础";
            
            AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
            // 发送请求
            [session GET:@"https://api.douban.com/v2/book/search" parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
                //NSLog(@"%@",responseObject);
                
                // 请求成功调用
                // 把数据用信号传递出去
                [subscriber sendNext:responseObject];
                
                [subscriber sendCompleted];
                
                
            } failure:^(NSURLSessionDataTask *task, NSError *error) {
                // 请求失败调用
                
            }];
            
            return nil;
        }];
        
        
        
        
        // 在返回数据信号时，把数据中的字典映射成模型信号，传递出去
        return [requestSignal map:^id(NSDictionary *value) {
            NSMutableArray *dictArr = value[@"books"];
            
            // 字典转模型，遍历字典中的所有元素，全部映射成模型，并且生成数组
            NSArray *modelArr = [[dictArr.rac_sequence map:^id(id value) {
                //NSLog(@"%@",value);
                return [Book bookWithDict:value];
            }] array];
            
            return modelArr;
        }];
        
    }];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.models.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    Book *book = self.models[indexPath.row];
    cell.detailTextLabel.text = book.subtitle;
    cell.textLabel.text = book.title;
    
    return cell;
}




@end
