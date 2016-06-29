//
//  DJOpenViewController.m
//  电商项目
//
//  Created by ma c on 16/6/16.
//  Copyright © 2016年 ZCJ. All rights reserved.
//

#import "DJOpenViewController.h"
#import "DJAddViewController.h"
#import "FirstView.h"
#import "ThreeView.h"
#import "UMThirdLogin.h"

@interface DJOpenViewController ()

/**第三方view*/
@property (strong,nonatomic) ThreeView *threeView;
/**登陆view*/
@property (strong,nonatomic) FirstView *loginView;

@end

@implementation DJOpenViewController
#pragma mark -
#pragma mark - 懒加载
- (FirstView *)loginView{
    if (!_loginView) {
        _loginView = [[FirstView alloc]init];
        __weak typeof(self)weakSelf = self;
        _loginView.loginBlock = ^(NSDictionary *dict){
            //在获得参数字典以后去调用网络请求
            [weakSelf loginViewMethod:dict];
        };
        _loginView.landingBlock = ^(){
            [weakSelf pushAddViewController];
        };
    }
    return _loginView;
}
- (ThreeView *)threeView{
    if (!_threeView) {
        _threeView = [[ThreeView alloc]init];
        __weak typeof(self)weakSelf = self;
        _threeView.QQLoginBlock = ^(){
            [weakSelf qqLoginMethod];
        };
    }
    return _threeView;
}
#pragma mark -
#pragma mark - 生命周期方法
- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self.view setBackgroundColor:RGB(245, 245, 245)];
    [self.view addSubview:self.loginView];
    [self.view addSubview:self.threeView];
    [self addLayoutIn];
}


#pragma mark -
#pragma mark - 方法
- (void)pushAddViewController{
    DJAddViewController *addVC = [[DJAddViewController alloc]init];
    [self.navigationController pushViewController:addVC animated:YES];
}
- (void)addLayoutIn{
    __weak typeof(self)weakSelf = self;
    [_loginView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.view.mas_top).offset(15);
        make.right.left.equalTo(weakSelf.view);
        make.height.equalTo(180);
    }];
    [_threeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.loginView.mas_bottom).offset(20);
        make.right.left.equalTo(weakSelf.view);
        make.height.equalTo(85);
    }];
}
- (void)loginViewMethod:(NSDictionary *)dic{
    __weak typeof(self)weakSelf = self;
    [self getRequestURL:@"appMember/appLogin.do" withDic:dic withSucess:^(NSURLSessionDataTask *task, id project) {
        //登陆成功的block回调
        NSDictionary *dict = project;
        if ([dict[@"ErrorMessage"]isEqualToString:@"登陆成功"]) {
            [[NSUserDefaults standardUserDefaults] setValue:dict forKey:@"ISLOGIN"];
            self.tabBarItem.badgeValue = [NSString stringWithFormat:@"%@",dict[@"result"]];
            [weakSelf.navigationController popViewControllerAnimated:YES];
        } else {
            NSLog(@"%@",dict[@"ErrorMessage"]);
        }
    } Fail:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"%@",error.localizedDescription);
    }];
}
- (void)qqLoginMethod{
    [UMThirdLogin qqVC:self withMethod:^(NSDictionary *returnDict) {
        NSLog(@"returnDict:  %@",returnDict);
    } error:^{
        NSLog(@"登陆失败");
    }];
}




@end
