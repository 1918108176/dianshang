//
//  DJBuyCarTableViewCell.h
//  电商 项目
//
//  Created by ma c on 16/6/30.
//  Copyright © 2016年 ZCJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DJBuyCarModel.h"

@interface DJBuyCarTableViewCell : UITableViewCell

/**购物车model*/
@property (strong,nonatomic) DJBuyCarModel *buyCarModel;
/**数量*/
@property (strong,nonatomic) UILabel *countLabel;
/**是否选中按钮*/
@property (strong,nonatomic) UIButton *selectButton;
/**添加数量*/
@property (strong,nonatomic) UIButton *addButton;
/**减少数量*/
@property (strong,nonatomic) UIButton *cutButton;


@end
