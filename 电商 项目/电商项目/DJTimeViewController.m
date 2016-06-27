//
//  DJTimeViewController.m
//  电商项目
//
//  Created by ma c on 16/6/16.
//  Copyright © 2016年 ZCJ. All rights reserved.
//

#import "DJTimeViewController.h"
#import "RootClass.h"
#import <MJExtension.h>
#import "DJButtonView.h"
#import <SDCycleScrollView.h>
#import "SJSearchViewController.h"

@interface DJTimeViewController ()<UIScrollViewDelegate,SDCycleScrollViewDelegate>

@property (strong,nonatomic) UIScrollView *backScrollView;

@property (strong,nonatomic) SDCycleScrollView *headImageView;

@property (strong,nonatomic) DJButtonView *btnView;

@property (strong,nonatomic) UIBarButtonItem *searchButItem;

@end

@implementation DJTimeViewController

- (UIScrollView *)backScrollView{
    if (!_backScrollView) {
        _backScrollView = [[UIScrollView alloc]init];
        _backScrollView.backgroundColor = [UIColor whiteColor];
        _backScrollView.contentSize = CGSizeMake(VIEW_WIDTH, 1000);
        _backScrollView.delegate = self;
    }
    return _backScrollView;
}
- (SDCycleScrollView *)headImageView{
    if (!_headImageView) {
        _headImageView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, VIEW_WIDTH, 230) delegate:self placeholderImage:[UIImage imageNamed:@"桌面"]];
        _headImageView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
        _headImageView.currentPageDotColor = [UIColor whiteColor];
    }
    return _headImageView;
}
- (DJButtonView *)btnView{
    if (!_btnView) {
        _btnView = [[DJButtonView alloc]initWithFrame:Rect(0, 230, VIEW_WIDTH, 50)];
        
        
    }
    return _btnView;
}


- (void)viewWillAppear:(BOOL)animated{
    self.tabBarController.tabBar.hidden = NO;
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_backImage"] forBarMetrics:UIBarMetricsDefault];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.navigationItem.rightBarButtonItem = self.searchButItem;
    [self.view addSubview:self.backScrollView];
    __weak typeof(self)weakSelf = self;
    [_backScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf.view).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    [_backScrollView addSubview:self.headImageView];
    [_headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.backScrollView.mas_top);
        make.left.equalTo(weakSelf.backScrollView.mas_left);
        make.size.equalTo(CGSizeMake(VIEW_WIDTH, 232));
    }];
    
    
    
    [_backScrollView addSubview:self.btnView];
    [self getImageURL];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (void)getImageURL{
    __weak typeof(self)weakSelf = self;
    [self getRequestURL:@"appHome/appHome.do" withDic:nil withSucess:^(NSURLSessionDataTask *task, id project) {
        NSArray *model = [RootClass mj_objectArrayWithKeyValuesArray:project];
        NSMutableArray *muArray = [NSMutableArray arrayWithCapacity:model.count];
        for (RootClass *root in model) {
            [muArray addObject:root.ImgView];
        }
        weakSelf.headImageView.imageURLStringsGroup = [NSArray arrayWithArray:muArray];
        
    } Fail:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"%@",error.localizedDescription);
    }];
    
}
- (UIBarButtonItem *)searchButItem{
    if (!_searchButItem) {
        UIButton *search = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [search setImage:[UIImage imageNamed:@"限时特卖界面搜索按钮"] forState:(UIControlStateNormal)];
        search.frame = CGRectMake(0, 0, 30, 30);
        [search addTarget:self action:@selector(pushSearchViewController) forControlEvents:(UIControlEventTouchUpInside)];
        _searchButItem = [[UIBarButtonItem alloc]initWithCustomView:search];
    }
    return _searchButItem;
}
- (void)pushSearchViewController{
    SJSearchViewController *searchVC = [[SJSearchViewController alloc]init];
    [self.navigationController pushViewController:searchVC animated:YES];
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if ([scrollView isEqual:_backScrollView]) {
        if (scrollView.contentOffset.y > 230) {
            //            scrollView.contentSize
            CGRect twoBtnRect = _btnView.frame;
            twoBtnRect.origin.y = scrollView.contentOffset.y;
            _btnView.frame = twoBtnRect;
        }else{
            _btnView.frame = CGRectMake(0, 230, VIEW_WIDTH, 50);
        }
    }
}

@end
