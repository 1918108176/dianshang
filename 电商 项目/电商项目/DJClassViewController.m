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

@property (strong,nonatomic) DJCollectionView *collectionView;

@end

@implementation DJClassViewController

- (DJCollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        layout.itemSize = CGSizeMake((VIEW_WIDTH-3)/4, (VIEW_WIDTH-3)/4);
        layout.headerReferenceSize = CGSizeMake(VIEW_WIDTH, 30);
        _collectionView = [[DJCollectionView alloc]initWithFrame:[UIScreen mainScreen].bounds collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        
    }
    return _collectionView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.collectionView];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (void)getDataURL{
    
}

@end
