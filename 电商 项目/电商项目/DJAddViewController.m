//
//  DJAddViewController.m
//  电商项目
//
//  Created by ma c on 16/6/16.
//  Copyright © 2016年 ZCJ. All rights reserved.
//

#import "DJAddViewController.h"
#import "DJAddView.h"
#import "DJLandingViewController.h"
#import "ThreeView.h"

@interface DJAddViewController ()

/**注册view*/
@property (strong,nonatomic) DJAddView *addView;
/**第三方view*/
@property (strong,nonatomic) ThreeView *threeView;

@end

@implementation DJAddViewController
#pragma mark -
#pragma mark - 懒加载
- (DJAddView *)addView{
    if (!_addView) {
        _addView = [[DJAddView alloc]init];
        __weak typeof(self)weakSelf = self;
        _addView.landing = ^(NSDictionary *dic){
            [weakSelf pushToLandingViewController:dic];
        };
        _addView.login = ^(){
            [weakSelf popToAddView];
        };
    }
    return _addView;
}
- (ThreeView *)threeView{
    if (!_threeView) {
        _threeView = [[ThreeView alloc]init];
    }
    return _threeView;
}

#pragma mark -
#pragma mark - 视图加载
- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self.view setBackgroundColor:RGB(245, 245, 245)];
    [self.view addSubview:self.addView];
    [self.view addSubview:self.threeView];
    [self addLayoutIn];
}

- (void)addLayoutIn{
    __weak typeof(self)weakSelf = self;
    [_addView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.view.mas_top).offset(15);
        make.left.equalTo(weakSelf.view.mas_left);
        make.right.equalTo(weakSelf.view.mas_right);
        make.height.equalTo(215);
    }];
    [_threeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.addView.mas_bottom).offset(20);
        make.left.equalTo(weakSelf.view.mas_left);
        make.right.equalTo(weakSelf.view.mas_right);
        make.height.equalTo(85);
    }];
}

- (void)popToAddView{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)pushToLandingViewController:(NSDictionary *)dic{
    DJLandingViewController *landingVC = [[DJLandingViewController alloc]init];
    landingVC.parameterDic = dic;
    [self.navigationController pushViewController:landingVC animated:YES];
}



@end
