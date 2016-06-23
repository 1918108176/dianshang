//
//  DJTableView.h
//  电商 项目
//
//  Created by ma c on 16/6/21.
//  Copyright © 2016年 ZCJ. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^exitBlock)();

@interface DJTableView : UITableView

@property (copy, nonatomic) exitBlock exitBlock;/**退出回调*/
@property (strong, nonatomic) NSArray *dataArray;/** 显示数组 */

@end
