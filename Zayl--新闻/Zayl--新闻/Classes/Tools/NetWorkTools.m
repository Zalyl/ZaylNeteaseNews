//
//  NetWorkTools.m
//  Zayl--新闻
//
//  Created by 张玉 on 15/8/31.
//  Copyright © 2015年 ZY. All rights reserved.
//

#import "NetWorkTools.h"

@implementation NetWorkTools
+(instancetype)sharedNetworkTool{
    static NetWorkTools *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //url
        NSURL *url = [NSURL URLWithString:@"http://c.m.163.com/nc/article/headline/"];
        instance = [[self alloc]initWithBaseURL:url];
        //添加响应解析的格式 AFN 默认只支持3重反序列化 避免出错 也能直接在SFN 框架里该 不好 破坏源代码
        instance.responseSerializer.acceptableContentTypes =  [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", nil];
    });
    return instance;
}
@end
