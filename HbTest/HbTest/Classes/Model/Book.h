//
//  Book.h
//  HbTest
//
//  Created by 郝兵 on 16/9/12.
//  Copyright © 2016年 郝兵. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Book : NSObject

@property(nonatomic,copy) NSString *subtitle;
@property(nonatomic,copy) NSString *title;

+ (instancetype) bookWithDict:(NSDictionary*) dic;

@end
