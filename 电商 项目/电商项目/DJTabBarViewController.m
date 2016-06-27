//
//  DJTabBarViewController.m
//  电商项目
//
//  Created by ma c on 16/6/16.
//  Copyright © 2016年 ZCJ. All rights reserved.
//

#import "DJTabBarViewController.h"
#import "DJNavigationViewController.h"
@interface DJTabBarViewController ()

@property (strong,nonatomic) NSArray *viewControllerArray;


@end

@implementation DJTabBarViewController
- (NSArray *)viewControllerArray{
    if (!_viewControllerArray) {
        _viewControllerArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"views" ofType:@"plist"]];
        
    }
    return _viewControllerArray;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    NSMutableArray *muArr = [[NSMutableArray alloc]initWithCapacity:self.viewControllerArray.count];
    [self.viewControllerArray enumerateObjectsUsingBlock:^(NSDictionary *dic, NSUInteger idx, BOOL * _Nonnull stop) {
        Class viewControllerClass = NSClassFromString(dic[@"viewController"]);
        UIViewController *viewController = [[viewControllerClass alloc]init];
        viewController.title = dic[@"title"];
        viewController.tabBarItem.image = [[UIImage imageNamed:dic[@"tabBarItemImage"]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        viewController.tabBarItem.selectedImage = [[UIImage imageNamed:dic[@"tabbarItemSelectImage"]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        DJNavigationViewController *navigationVC = [[DJNavigationViewController alloc]initWithRootViewController:viewController];
        [muArr addObject:navigationVC];
    }];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15.0],NSForegroundColorAttributeName:[UIColor grayColor]} forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithRed:81.0/255.0 green:117.0/255.0 blue:238.0/255.0 alpha:1.0]} forState:UIControlStateSelected];
    self.viewControllers = muArr;
    self.selectedIndex = 1;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
