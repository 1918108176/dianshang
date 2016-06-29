//
//  DJMyViewController.m
//  电商项目
//
//  Created by ma c on 16/6/16.
//  Copyright © 2016年 ZCJ. All rights reserved.
//

#import "DJMyViewController.h"
#import "DJOpenViewController.h"
#import "DJAddViewController.h"
#import "DJMyTableHeaderView.h"
#import "DJTableView.h"

@interface DJMyViewController ()


@property (strong, nonatomic)   DJTableView *myTableView;              /** 我的列表 */
@property (strong, nonatomic)   DJMyTableHeaderView *myTableHeadView;              /** 表格头 */

@end

@implementation DJMyViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self judgeIsLogin];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:self.myTableView];
    __weak typeof(self)weakSelf = self;
    [_myTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf.view);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
#pragma mark -
#pragma mark - 按钮方法
- (DJTableView *)myTableView{
    if (!_myTableView) {
        _myTableView = [[DJTableView alloc]init];
        _myTableView.tableHeaderView = self.myTableHeadView;
        _myTableView.dataArray = @[@{@"title":@"我的收藏",@"image":@"我的界面我的收藏图标"},@{@"title":@"意见反馈",@"image":@"我的界面意见反馈图标"},@{@"title":@"关于我们",@"image":@"我的界面关于我们图标"},@{@"title":@"客服热线",@"image":@"我的界面客服热线图标"},@{@"title":@"我的优惠劵",@"image":@"我的界面我的优惠券图标"},@{@"title":@"邀请好友，立刻赚钱",@"image":@"我的界面邀请好友图标"}];
        WS(weakSelf);
        _myTableView.exitBlock = ^{
            [weakSelf judgeIsLogin];
        };
    }
    return _myTableView;
}

- (DJMyTableHeaderView *)myTableHeadView{
    if (!_myTableHeadView) {
        _myTableHeadView = [[DJMyTableHeaderView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 125)];
        UIButton *loginBtn = [_myTableHeadView valueForKey:@"loginButton" ];
        [loginBtn addTarget:self action:@selector(loginButtonMethod) forControlEvents:(UIControlEventTouchUpInside)];
        UIButton *landingBtn = [_myTableHeadView valueForKey:@"lodaingButton" ];
        [landingBtn addTarget:self action:@selector(landingButtonMethod) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _myTableHeadView;
}

- (void)loginButtonMethod{
    DJOpenViewController *openVC = [[DJOpenViewController alloc]init];
    openVC.title = @"登录";
    [self.navigationController pushViewController:openVC animated:YES];
}

- (void)landingButtonMethod{
    DJAddViewController *addVC = [[DJAddViewController alloc]init];
    addVC.title = @"注册";
    [self.navigationController pushViewController:addVC animated:YES];
}

- (void)judgeIsLogin{
    NSDictionary *isLogin = [[NSUserDefaults standardUserDefaults]valueForKey:@"ISLOGIN"];
    [_myTableHeadView showLandingAndLoginBtn:isLogin];
    [_myTableView reloadData];
}

@end
