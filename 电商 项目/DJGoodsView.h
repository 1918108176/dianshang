//
//  DJGoodsView.h
//  电商 项目
//
//  Created by ma c on 16/6/28.
//  Copyright © 2016年 ZCJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SDCycleScrollView.h>
@interface DJGoodsView : UIView

/**轮播图*/
@property (strong,nonatomic) SDCycleScrollView *sdcView;
/***/
@property (copy,nonatomic) NSString *string;

@end
