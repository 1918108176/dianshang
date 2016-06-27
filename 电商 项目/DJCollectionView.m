//
//  DJCollectionView.m
//  电商 项目
//
//  Created by ma c on 16/6/27.
//  Copyright © 2016年 ZCJ. All rights reserved.
//

#import "DJCollectionView.h"
#import "DJCollectionReusableView.h"

@interface DJCollectionView ()<UICollectionViewDataSource,UICollectionViewDelegate>



@end

@implementation DJCollectionView


- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        self.dataSource = self;
        self.delegate = self;
        [self registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
        [self registerClass:[DJCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"DJCollectionReusableView"];
    }
    return self;
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 3;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (section == 0) {
        return self.dataArray.count;
    } else if (section == 1){
        return self.dataArray2.count;
    }else{
        return self.dataArray3.count;
    }
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UICollectionViewCell" forIndexPath:indexPath];
    if (indexPath.section == 0) {
        
    } else if (indexPath.section == 1){
        
    }else{
        
    }
    
    return cell;
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if (kind == UICollectionElementKindSectionHeader) {
        DJCollectionReusableView *reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"DJCollectionReusableView" forIndexPath:indexPath];
        if (indexPath.section == 0) {
            reusableView.label.text = @"功效专区";
            reusableView.backgroundColor = RGB(239, 248, 251);
        } else if (indexPath.section == 1){
            reusableView.label.text = @"面部专区 FACE";
            reusableView.backgroundColor = RGB(252, 244, 243);
        }else{
            reusableView.label.text = @"身体专区 BODY";
            reusableView.backgroundColor = RGB(252, 244, 243);
        }
        return reusableView;
    }
    return nil;
}
- (void)getdataPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        
    } else if (indexPath.section == 1){
        
    }else{
        
    }
}


@end
