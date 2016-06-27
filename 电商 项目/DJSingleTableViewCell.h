//
//  DJSingleTableViewCell.h
//  电商 项目
//
//  Created by ma c on 16/6/24.
//  Copyright © 2016年 ZCJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DJModel.h"

@interface DJSingleTableViewCell : UITableViewCell

/**存储数据的模型*/
@property (strong,nonatomic) DJModel *singleModel;


@end
