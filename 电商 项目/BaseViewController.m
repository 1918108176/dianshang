//
//  BaseViewController.m
//  电商 项目
//
//  Created by ma c on 16/6/21.
//  Copyright © 2016年 ZCJ. All rights reserved.
//

#import "BaseViewController.h"


static NSString * const BaseURLString = @"http://123.57.141.249:8080/beautalk/";

@interface BaseViewController ()

@end

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

//GET请求/
- (void)getRequestURL:(NSString *)URL withDic:(NSDictionary *)dic withSucess:(SucessBlock)sucess Fail:(FailBlock)failBlock{
    __weak typeof(self)weakSelf = self;
    [[AFNetworkingClient sharedClient]GET:URL parameters:dic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (sucess) {
            sucess(task,responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [weakSelf showTostView:@"请检查网络连接状态"];
        if (failBlock) {
            failBlock(task,error);
        }
    }];
}

//POST请求/
- (void)postRequestURL:(NSString *)URL withDic:(NSDictionary *)dic withSucess:(SucessBlock)sucess Fail:(FailBlock)failBlock{
    
    __weak typeof(self)weakSelf = self;
    [[AFNetworkingClient sharedClient]POST:URL parameters:dic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (sucess) {
            sucess(task,responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [weakSelf showTostView:@"请检查网络连接状态"];
        if (failBlock) {
            failBlock(task,error);
        }
    }];
}

- (void)showTostView:(NSString *)tostString{
    
}
- (void)addBackButtonOnNav{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 30, 30);
    [button setImage:[UIImage imageNamed:@"详情界面返回按钮"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(backViewController) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc]initWithCustomView:button];
    self.navigationItem.leftBarButtonItem = barButton;
}
- (void)backViewController{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)dealloc{
    [[AFNetworkingClient sharedClient].operationQueue cancelAllOperations];
}
@end
