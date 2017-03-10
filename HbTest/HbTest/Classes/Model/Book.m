//
//  Book.m
//  HbTest
//
//  Created by 郝兵 on 16/9/12.
//  Copyright © 2016年 郝兵. All rights reserved.
//

#import "Book.h"

@implementation Book

+ (instancetype) bookWithDict:(NSDictionary*) dic{
    Book *book = [[Book alloc] init];
    book.subtitle = [dic objectForKey:@"subtitle"];
    book.title = [dic objectForKey:@"title"];
    return book;
}

@end
