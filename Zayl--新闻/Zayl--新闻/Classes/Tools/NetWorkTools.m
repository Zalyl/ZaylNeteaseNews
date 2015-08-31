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
    });
    return instance;
}
@end
