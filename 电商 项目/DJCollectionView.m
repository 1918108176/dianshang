//
//  DJCollectionView.m
//  电商 项目
//
//  Created by ma c on 16/6/27.
//  Copyright © 2016年 ZCJ. All rights reserved.
//

#import "DJCollectionView.h"
#import "DJCollectionReusableView.h"
#import "CollectionViewCell.h"
#import "DJCollectionViewCell.h"

@interface DJCollectionView ()<UICollectionViewDataSource,UICollectionViewDelegate>



@end

@implementation DJCollectionView


- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        self.dataSource = self;
        self.delegate = self;
        [self registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
        [self registerClass:[DJCollectionViewCell class] forCellWithReuseIdentifier:@"DJCollectionViewCell"];
        [self registerClass:[DJCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"DJCollectionReusableView"];
    }
    return self;
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 3;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (section == 0) {
        return self.dataArray3.count;
    } else if (section == 1){
        return self.dataArray2.count;
    }else{
        return self.dataArray.count;
    }
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        static NSString *cellID = @"UICollectionViewCell";
        CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
        [cell sizeToFit];
        cell.model = self.dataArray3[indexPath.row];
        return cell;
    } else{
        CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"DJCollectionViewCell" forIndexPath:indexPath];
        [cell sizeToFit];
        if (indexPath.section == 1) {
            cell.model = self.dataArray2[indexPath.row];
        } else {
            cell.model = self.dataArray[indexPath.row];
        }
        return cell;
    }
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if (kind == UICollectionElementKindSectionHeader) {
        DJCollectionReusableView *reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"DJCollectionReusableView" forIndexPath:indexPath];
        if (indexPath.section == 0) {
            reusableView.label.text = @"功效分类";
            reusableView.backgroundColor = RGB(239, 248, 251);
        } else if (indexPath.section == 1){
            reusableView.label.text = @"经典品牌";
            reusableView.backgroundColor = RGB(252, 244, 243);
        }else if (indexPath.section ==2){
            reusableView.label.text = @"推荐品牌";
            reusableView.backgroundColor = RGB(252, 244, 243);
        }
        return reusableView;
    }
    return nil;
}



@end
