//
//  DJTableViewController.m
//  电商 项目
//
//  Created by ma c on 16/6/27.
//  Copyright © 2016年 ZCJ. All rights reserved.
//

#import "DJTableViewController.h"
#import "DJGoodsView.h"
#import <MJExtension.h>
#import "DJClassListModel.h"


@interface DJTableViewController ()<UIScrollViewDelegate>

@property (strong,nonatomic) UIScrollView *backScrollView;

@property (strong,nonatomic) UIView *backMainView;

@property (strong,nonatomic) DJGoodsView *goodsView;



@end

@implementation DJTableViewController
- (UIView *)backMainView{
    if (!_backMainView) {
        _backMainView = [[UIView alloc]init];
        _backMainView.backgroundColor = [UIColor whiteColor];
    }
    return _backMainView;
}
- (UIScrollView *)backScrollView{
    if (!_backScrollView) {
        _backScrollView = [[UIScrollView alloc]initWithFrame:self.view.frame];
    }
    return _backScrollView;
}
- (DJGoodsView *)goodsView{
    if (!_goodsView) {
        _goodsView = [[DJGoodsView alloc]init];
    }
    return _goodsView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self.view addSubview:self.backScrollView];
    [_backScrollView addSubview:self.backMainView];
    [_backMainView addSubview:self.goodsView];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
//获取轮播图图片
- (void)getGoodsImage{
    __weak typeof(self)weakSelf = self;
    [self getRequestURL:@"appGoods/findGoodsImgList.do" withDic:nil withSucess:^(NSURLSessionDataTask *task, id project)
    {
        NSArray *array = [DJClassListModel mj_objectArrayWithKeyValuesArray:project];
        NSMutableArray *muArray = [NSMutableArray arrayWithCapacity:array.count];
        for (DJClassListModel *model in array) {
            [muArray addObject:model];
        }
        weakSelf.goodsView.sdcView.imageURLStringsGroup = muArray;
    } Fail:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"%@",error.localizedDescription);
    }];
    
    
}




@end
