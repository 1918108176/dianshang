//
//  DJScrollTableView.h
//  电商 项目
//
//  Created by ma c on 16/6/24.
//  Copyright © 2016年 ZCJ. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^SingleBlock)(NSString *GoodsID);
typedef void(^GroupBlock)(NSString *ActivityId);

@interface DJScrollTableView : UITableView<UITableViewDataSource,UITableViewDelegate>

/**新品*/
@property (strong,nonatomic) NSArray *singleListArray;
/**品牌*/
@property (strong, nonatomic) NSArray *groupBuyListArray;
/**判断是新品团购还是品牌团购*/
@property (assign,nonatomic) BOOL isSingle;

@property (copy,nonatomic) SingleBlock singBlock;

@property (copy,nonatomic) GroupBlock groBlock;

@end
