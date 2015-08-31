//
//  NewsM.h
//  Zayl--新闻
//
//  Created by 张玉 on 15/8/31.
//  Copyright © 2015年 ZY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsM : NSObject
//新闻标题
@property (nonatomic, copy) NSString *title;
//新闻摘要
@property (nonatomic, copy) NSString *digest;

//跟帖数量
@property (nonatomic, assign) int replyCount;
//配图地址
@property (nonatomic, copy) NSString *imgsrc;

+ (instancetype)newsWithDict:(NSDictionary *)dict;

//加载指定的URL 的新闻数组
+(void)loadNewsListWithURLString:(NSString *)urlstring;
@end
