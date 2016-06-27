//
//  DJCollectionReusableView.m
//  电商 项目
//
//  Created by ma c on 16/6/27.
//  Copyright © 2016年 ZCJ. All rights reserved.
//

#import "DJCollectionReusableView.h"

@interface DJCollectionReusableView ()



@end

@implementation DJCollectionReusableView

- (UILabel *)label{
    if (!_label) {
        _label = [[UILabel alloc]initWithFrame:CGRectMake(15, 0, VIEW_WIDTH-15, 35)];
        _label.backgroundColor = [UIColor blackColor];
        _label.textAlignment = NSTextAlignmentLeft;
        _label.font = [UIFont systemFontOfSize:20.0];
    }
    return _label;
}





@end
