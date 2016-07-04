//
//  BaseViewController.m
//  电商 项目
//
//  Created by ma c on 16/6/21.
//  Copyright © 2016年 ZCJ. All rights reserved.
//

#import "BaseViewController.h"
#import "UIView+Toast.h"

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
- (void)addBackButtonOnNav{
    UIButton *button = [UIButton buttonWithType:(UIButtonTypeCustom)];
    button.frame = CGRectMake(0, 0, 30, 30);
    [button setImage:[UIImage imageNamed:@"详情界面返回按钮"] forState:(UIControlStateNormal)];
    [button addTarget:self action:@selector(returnViewController) forControlEvents:(UIControlEventTouchUpInside)];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithCustomView:button];
    self.navigationItem.leftBarButtonItem = backItem;
}

- (void)returnViewController{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)showTostView:(NSString *)tostString{
    [self.view makeToast:tostString duration:1.3 position:@"center"];
}

@end
