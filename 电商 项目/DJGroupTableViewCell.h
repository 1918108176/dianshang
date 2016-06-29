//
//  DJGroupTableViewCell.h
//  电商 项目
//
//  Created by ma c on 16/6/24.
//  Copyright © 2016年 ZCJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DJSecondModel.h"
@interface DJGroupTableViewCell : UITableViewCell
/**存储数据的model*/
@property (strong, nonatomic)DJSecondModel *groupBuyModel;

@end
