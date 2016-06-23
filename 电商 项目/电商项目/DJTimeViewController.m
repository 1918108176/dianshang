//
//  DJTimeViewController.m
//  电商项目
//
//  Created by ma c on 16/6/16.
//  Copyright © 2016年 ZCJ. All rights reserved.
//

#import "DJTimeViewController.h"
#import "DJScrollView.h"
#import "DJModel.h"
@interface DJTimeViewController ()

@property (strong,nonatomic) DJScrollView *backScrollView;

@property (strong,nonatomic) DJScrollView *scrollView;

@end

@implementation DJTimeViewController

- (DJScrollView *)backScrollView{
    if (!_backScrollView) {
        _backScrollView = [[DJScrollView alloc]init];
        [_backScrollView setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
    }
    return _backScrollView;
}
- (DJScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = [[DJScrollView alloc]init];
        [_scrollView setBackgroundColor:[UIColor grayColor]];
    }
    return _scrollView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.backScrollView];
    [self.view addSubview:self.scrollView];
    [self addLayoutIn];
}
- (void)addLayoutIn{
    __weak typeof(self)weakSelf = self;
    [_backScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.left.top.equalTo(weakSelf.view);
        make.height.equalTo(2000);
    }];
    [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.view.mas_top).offset(65);
        make.left.equalTo(weakSelf.view.mas_left);
        make.right.equalTo(weakSelf.view.mas_right);
        make.height.equalTo(232);
    }];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (void)getImageURL{
    [self getRequestURL:@"appHome/appHome.do" withDic:nil withSucess:^(NSURLSessionDataTask *task, id project) {
        
        
        
        
    } Fail:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
    
}


@end
