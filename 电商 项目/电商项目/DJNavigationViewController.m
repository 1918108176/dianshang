//
//  DJNavigationViewController.m
//  电商项目
//
//  Created by ma c on 16/6/16.
//  Copyright © 2016年 ZCJ. All rights reserved.
//

#import "DJNavigationViewController.h"

@interface DJNavigationViewController ()

@end

@implementation DJNavigationViewController


- (void)initialize{
    UINavigationBar *navigationBar = [UINavigationBar appearance];
    [navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_backImage"] forBarMetrics:UIBarMetricsDefault];
    [navigationBar setTitleTextAttributes:@{
                                            NSFontAttributeName:[UIFont boldSystemFontOfSize:20],NSForegroundColorAttributeName:[UIColor greenColor]
                                            }];
}




- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
