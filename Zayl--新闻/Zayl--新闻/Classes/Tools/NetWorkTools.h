//
//  NetWorkTools.h
//  Zayl--新闻
//
//  Created by 张玉 on 15/8/31.
//  Copyright © 2015年 ZY. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@interface NetWorkTools : AFHTTPSessionManager
//全局访问的单例接口
+(instancetype)sharedNetworkTool;
@end
