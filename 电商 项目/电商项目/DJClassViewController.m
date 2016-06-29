//
//  DJClassViewController.m
//  电商项目
//
//  Created by ma c on 16/6/16.
//  Copyright © 2016年 ZCJ. All rights reserved.
//

#import "DJClassViewController.h"
#import "DJCollectionView.h"
#import "ClassModel.h"
#import <MJExtension.h>

@interface DJClassViewController ()<UICollectionViewDelegateFlowLayout>
@property (strong,nonatomic) UIScrollView *scrollView;

@property (strong,nonatomic) DJCollectionView *collectionView;

@end

@implementation DJClassViewController
- (UIScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc]initWithFrame:self.view.frame];
        _scrollView.contentSize = CGSizeMake(VIEW_WIDTH, VIEW_HEIGHT+200);
        
    }
    return _scrollView;
}
- (DJCollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        layout.itemSize = CGSizeMake((VIEW_WIDTH-4)/4, (VIEW_WIDTH-4)/4);
        layout.headerReferenceSize = CGSizeMake(VIEW_WIDTH, 30);
        layout.sectionInset = UIEdgeInsetsMake(0, 0, 1, 0);
        _collectionView = [[DJCollectionView alloc]initWithFrame:CGRectMake(0, 0, VIEW_WIDTH, VIEW_HEIGHT) collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        
    }
    return _collectionView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self.view addSubview:self.scrollView];
    [_scrollView addSubview:self.collectionView];
    [self getDataURL];
    [self getData2URL];
    [self getData3URL];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
- (void)getDataURL{
    [self getRequestURL:@"appBrandareanew/findBrandareanew.do" withDic:nil withSucess:^(NSURLSessionDataTask *task, id project) {
        NSDictionary *dic = project;
        NSArray *array = (NSArray *)dic;
        NSMutableArray *muArray = [NSMutableArray arrayWithCapacity:array.count];
        for (NSDictionary *dic in array) {
            ClassModel *model = [ClassModel getTheDataSource:dic];
            [muArray addObject:model];
        }
        self.collectionView.dataArray = muArray;
        [self.collectionView reloadData];
    } Fail:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"%@",error.localizedDescription);
    }];
}
- (void)getData2URL{
    [self getRequestURL:@"appBrandarea/asianBrand.do" withDic:nil withSucess:^(NSURLSessionDataTask *task, id project) {
        NSDictionary *dic = project;
        NSArray *array = (NSArray *)dic;
        NSMutableArray *muArray = [NSMutableArray arrayWithCapacity:array.count];
        for (NSDictionary *dict in array) {
            ClassModel *model = [ClassModel getTheDataSource:dict];
            [muArray addObject:model];
        }
        self.collectionView.dataArray2 = muArray;
        [self.collectionView reloadData];
    } Fail:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"%@",error.localizedDescription);
    }];
}

- (void)getData3URL{
    [self getRequestURL:@"appBrandareatype/findBrandareatype.do" withDic:nil withSucess:^(NSURLSessionDataTask *task, id project) {
        NSDictionary *dic = project;
        NSArray *array = (NSArray *)dic;
        NSMutableArray *muArray = [NSMutableArray arrayWithCapacity:array.count];
        for (NSDictionary *dict in array) {
            ClassModel *model = [ClassModel getTheDataSource:dict];
            [muArray addObject:model];
        }
        self.collectionView.dataArray3 = muArray;
        [self.collectionView reloadData];
    } Fail:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"%@",error.localizedDescription);
    }];
}

@end
