//
//  BaseViewController.m
//  电商 项目
//
//  Created by ma c on 16/6/21.
//  Copyright © 2016年 ZCJ. All rights reserved.
//

#import "BaseViewController.h"


static NSString * const BaseURLString = @"http://123.57.141.249:8080/beautalk/";

@implementation AFNetworkingClient

+ (instancetype)sharedClient{
    
    static AFNetworkingClient *sharedClient = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        sharedClient = [[AFNetworkingClient alloc]initWithBaseURL:[NSURL URLWithString:BaseURLString]];
        sharedClient.responseSerializer = [AFJSONResponseSerializer serializer];
        sharedClient.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];
    });
    return sharedClient;
}

@end

@implementation BaseViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
}

//GET请求/
- (void)getRequestURL:(NSString *)URL withDic:(NSDictionary *)dic withSucess:(SucessBlock)sucess Fail:(FailBlock)failBlock{
    [[AFNetworkingClient sharedClient]GET:URL parameters:dic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (sucess) {
            sucess(task,responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failBlock) {
            failBlock(task,error);
        }
    }];
}

//POST请求/
- (void)postRequestURL:(NSString *)URL withDic:(NSDictionary *)dic withSucess:(SucessBlock)sucess Fail:(FailBlock)failBlock{
    [[AFNetworkingClient sharedClient]POST:URL parameters:dic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (sucess) {
            sucess(task,responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failBlock) {
            failBlock(task,error);
        }
    }];
}

@end
