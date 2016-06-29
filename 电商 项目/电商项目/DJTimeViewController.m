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
#import "DJScrollTableView.h"
#import "DJDetailsViewController.h"
#import "DJTableViewController.h"
#import "DJModel.h"
#import "DJSecondModel.h"

@interface DJTimeViewController ()<UIScrollViewDelegate,SDCycleScrollViewDelegate>
/**背景*/
@property (strong,nonatomic) UIScrollView *backScrollView;
/**轮播图*/
@property (strong,nonatomic) SDCycleScrollView *headImageView;
/**按钮*/
@property (strong,nonatomic) DJButtonView *btnView;

@property (strong,nonatomic) UIBarButtonItem *searchButItem;
/**表格1*/
@property (strong,nonatomic) DJScrollTableView *tableView;
/**表格2*/
@property (strong,nonatomic) DJScrollTableView *tableView2;

@end

@implementation DJTimeViewController

- (UIScrollView *)backScrollView{
    if (!_backScrollView) {
        _backScrollView = [[UIScrollView alloc]init];
        _backScrollView.backgroundColor = [UIColor whiteColor];
        _backScrollView.delegate = self;
    }
    return _backScrollView;
}
- (SDCycleScrollView *)headImageView{
    if (!_headImageView) {
        _headImageView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, VIEW_WIDTH, 232) delegate:self placeholderImage:[UIImage imageNamed:@"桌面"]];
        _headImageView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
        _headImageView.currentPageDotColor = [UIColor whiteColor];
    }
    return _headImageView;
}
- (DJButtonView *)btnView{
    if (!_btnView) {
        _btnView = [[DJButtonView alloc]initWithFrame:Rect(0, 232, VIEW_WIDTH, 50)];
        [_btnView.xinButton addTarget:self action:@selector(twoButtonMethod:) forControlEvents:UIControlEventTouchUpInside];
        [_btnView.dfsButton addTarget:self action:@selector(twoButtonMethod:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btnView;
}
//新品团购
- (DJScrollTableView *)tableView{
    if (_tableView) {
        _tableView = [[DJScrollTableView alloc]initWithFrame:Rect(0, 282, VIEW_WIDTH, 0) style:UITableViewStylePlain];
        _tableView.isSingle = YES;
        __weak typeof(self)weakSelf = self;
        _tableView.singBlock = ^(NSString *GoodsID){
            DJDetailsViewController *detailsVC = [[DJDetailsViewController alloc]init];
            detailsVC.goodsID = GoodsID;
            detailsVC.hidesBottomBarWhenPushed = YES;
            [weakSelf.navigationController pushViewController:detailsVC animated:YES];
        };
    }
    return _tableView;
}
//品牌团购
- (DJScrollTableView *)tableView2{
    if (!_tableView2) {
        _tableView2 = [[DJScrollTableView alloc]initWithFrame:Rect(VIEW_WIDTH, 282, VIEW_WIDTH, 0) style:(UITableViewStylePlain)];
        _tableView2.isSingle = NO;
        __weak typeof(self)weakSelf = self;
        _tableView2.singBlock = ^(NSString *groupID){
            DJTableViewController *classList = [[DJTableViewController alloc]init];
            classList.idDictionary = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"appGgroupon/appGrounpGoodsList.do",@"URL",groupID,@"ID",@"GrouponId",@"keyword", nil];
            [weakSelf.navigationController pushViewController:classList animated:YES];
        };
    }
    return _tableView2;
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
    [_backScrollView addSubview:self.tableView];
    [_backScrollView addSubview:self.tableView2];
    [_backScrollView addSubview:self.btnView];
    [self getImageURL];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (void)getImageURL{
    __weak typeof(self)weakSelf = self;
    //请求轮播图片
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
    //请求新品团购
    [self getRequestURL:@"appActivity/appHomeGoodsList.do" withDic:nil withSucess:^(NSURLSessionDataTask *task, id project) {
        NSArray *array = [DJModel mj_objectArrayWithKeyValuesArray:project];
        weakSelf.tableView.singleListArray = array;
        weakSelf.backScrollView.contentSize = CGSizeMake(0, array.count*170+282);
        CGRect rect = _tableView.frame;
        rect.size.height = array.count * 170;
        _tableView.frame = rect;
        [weakSelf.tableView reloadData];
    } Fail:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"%@",error.localizedDescription);
    }];
    //请求品牌团购
    [self getRequestURL:@"appActivity/appActivityList.do" withDic:nil withSucess:^(NSURLSessionDataTask *task, id project) {
        NSArray *array = [DJSecondModel mj_objectArrayWithKeyValuesArray:project];
        weakSelf.tableView2.groupBuyListArray = array;
        CGRect rect = _tableView2.frame;
        rect.size.height = array.count*175;
        _tableView2.frame = rect;
        [weakSelf.tableView2 reloadData];
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
- (void)twoButtonMethod:(UIButton *)sender{
    if (sender == _btnView.xinButton) {
        _btnView.xinButton.selected = YES;
        _btnView.dfsButton.selected = NO;
        _backScrollView.contentSize = CGSizeMake(0, _tableView.singleListArray.count*170+282);
        [UIView animateWithDuration:0.5 animations:^{
            CGRect single = _tableView.frame;
            single.origin.x = 0;
            _tableView.frame = single;
            CGRect group = _tableView2.frame;
            group.origin.x = VIEW_WIDTH;
            _tableView2.frame = group;
        }];
    } else {
        _btnView.dfsButton.selected = YES;
        _btnView.xinButton.selected = NO;
        _backScrollView.contentSize = CGSizeMake(0, _tableView2.groupBuyListArray.count*175+282);
        [UIView animateWithDuration:0.5 animations:^{
            CGRect single = _tableView.frame;
            single.origin.x = -VIEW_WIDTH;
            _tableView.frame = single;
            CGRect group = _tableView2.frame;
            group.origin.x = 0;
            _tableView2.frame = group;
        }];
    }
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
