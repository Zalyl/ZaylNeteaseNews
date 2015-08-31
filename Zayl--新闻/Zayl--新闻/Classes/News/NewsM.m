//
//  NewsM.m
//  Zayl--新闻
//
//  Created by 张玉 on 15/8/31.
//  Copyright © 2015年 ZY. All rights reserved.
//

#import "NewsM.h"
#import "NetWorkTools.h"

@implementation NewsM
+ (instancetype)newsWithDict:(NSDictionary *)dict {
    id obj = [[self alloc] init];
    NSArray *propertis = @[@"title", @"digest", @"replyCount", @"imgsrc"];
    
    for (NSString *key in propertis) {
        // 判断 dict 是否存在 key
        if (dict[key] != nil) {
            [obj setValue:dict[key] forKeyPath:key];
        }
    }

//    [obj setValuesForKeysWithDictionary:dict];
    
    return obj;
}
//用基本的KVC 要实现这个方法
-(NSString *)description{
    NSArray *propertis = @[@"title", @"digest", @"replyCount", @"imgsrc"];
    NSDictionary *dict = [self dictionaryWithValuesForKeys:propertis];
    return [NSString stringWithFormat:@"<%@: %p> %@", self.class, self, dict];
}

//利用responseObject.keyEnumerator.nextObject 拿到第一个key
//可以遍历字典
+(void)loadNewsListWithURLString:(NSString *)urlstring{
    [[NetWorkTools sharedNetworkTool]GET:urlstring parameters:nil success:^(NSURLSessionDataTask * _Nonnull task,NSDictionary *responseObject) {
        NSLog(@"%@",responseObject.keyEnumerator.nextObject);
        //利用字典的key 得到数组
        NSArray *array = responseObject[responseObject.keyEnumerator.nextObject];
        NSLog(@"%@",array);
        //得到数组 使用字典转模型
        
        // Capacity：容量，假设是 10，一次性分配10个存储空间
        // 当添加第11个元素，会再次开辟10个存储空间！
        // 使用 [NSMutableArray array] 创建的可变数组，会在每一次添加对象的时候，临时申请空间

        NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:array.count];
        for (NSDictionary *obj in array) {
            [arrayM addObject:[self newsWithDict:obj]];
            
        }
        NSLog(@"%@",arrayM);
        
        
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}
@end
