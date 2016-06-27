//
//  DJCollectionView.h
//  电商 项目
//
//  Created by ma c on 16/6/27.
//  Copyright © 2016年 ZCJ. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^dataBlock)(NSDictionary *);

@interface DJCollectionView : UICollectionView

@property (strong,nonatomic) NSArray *dataArray;

@property (strong, nonatomic) NSArray *dataArray2;

@property (strong, nonatomic) NSArray *dataArray3;



@end
