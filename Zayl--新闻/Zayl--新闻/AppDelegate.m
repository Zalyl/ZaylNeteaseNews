//
//  AppDelegate.m
//  Zayl--新闻
//
//  Created by 张玉 on 15/8/31.
//  Copyright © 2015年 ZY. All rights reserved.
//

#import "AppDelegate.h"
#import <AFNetworkActivityIndicatorManager.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //1:设置缓存
    NSURLCache *cache = [[NSURLCache alloc]initWithMemoryCapacity:4*1024*1024 diskCapacity:20*1024*1024 diskPath:nil];
    [NSURLCache setSharedURLCache:cache];
    
    //2:网络指示器--设置这个 以后的afn网络请求都会 有菊花  用sdWebimage 不会显示网络请求菊花 只有afn能用
    [AFNetworkActivityIndicatorManager sharedManager];
    return YES;
}


@end
