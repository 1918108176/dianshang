//
//  DJGoodsView.m
//  电商 项目
//
//  Created by ma c on 16/6/28.
//  Copyright © 2016年 ZCJ. All rights reserved.
//

#import "DJGoodsView.h"

@interface DJGoodsView ()<SDCycleScrollViewDelegate>

@end

@implementation DJGoodsView


- (SDCycleScrollView *)sdcView{
    if (!_sdcView) {
        _sdcView = [SDCycleScrollView cycleScrollViewWithFrame:Rect(0, 0, VIEW_WIDTH, 380) delegate:self placeholderImage:[UIImage imageNamed:@"桌面"]];
        _sdcView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
        _sdcView.currentPageDotColor = [UIColor whiteColor];
    }
    return _sdcView;
}



@end
