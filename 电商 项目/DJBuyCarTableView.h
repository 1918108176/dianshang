//
//  DJBuyCarTableView.h
//  电商 项目
//
//  Created by ma c on 16/6/30.
//  Copyright © 2016年 ZCJ. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^dataArrayBlock)(NSMutableArray *array);

@interface DJBuyCarTableView : UITableView

@property (strong,nonatomic) NSMutableArray *dataArray;

@property (strong,nonatomic) dataArrayBlock datablock;

@end
