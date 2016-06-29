//
//  BaseViewController.h
//  电商 项目
//
//  Created by ma c on 16/6/21.
//  Copyright © 2016年 ZCJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AFNetworking.h>

typedef void(^SucessBlock)(NSURLSessionDataTask *task,id project);
typedef void (^FailBlock)(NSURLSessionDataTask *task,NSError *error);
@interface AFNetworkingClient : AFHTTPSessionManager
/**AFHTTPSessionManager初始化单例*/
+ (instancetype)sharedClient;

@end

@interface BaseViewController : UIViewController


//GET请求/
- (void)getRequestURL:(NSString *)URL
              withDic:(NSDictionary *)dic
           withSucess:(SucessBlock)sucess
                 Fail:(FailBlock)failBlock;

//POST请求/
- (void)postRequestURL:(NSString *)URL
               withDic:(NSDictionary *)dic
            withSucess:(SucessBlock)sucess
                  Fail:(FailBlock)failBlock;



@end
