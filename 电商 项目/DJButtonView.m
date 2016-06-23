//
//  DJButtonView.m
//  电商 项目
//
//  Created by ma c on 16/6/23.
//  Copyright © 2016年 ZCJ. All rights reserved.
//

#import "DJButtonView.h"


@implementation DJButtonView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.xinButton];
        [self addSubview:self.dfsButton];
        [self setBackgroundColor:[UIColor whiteColor]];
    }
    return self;
}


- (void)layoutSubviews{
    [super layoutSubviews];
    __weak typeof(self)weakSelf = self;
    [_xinButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_top);
        make.left.equalTo(weakSelf.mas_left);
        make.bottom.equalTo(weakSelf.mas_bottom);
        make.width.equalTo(weakSelf.frame.size.width/2);
    }];
    [_dfsButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_top);
        make.right.equalTo(weakSelf.mas_right);
        make.bottom.equalTo(weakSelf.mas_bottom);
        make.width.equalTo(weakSelf.frame.size.width/2);
    }];
}

- (UIButton *)xinButton{
    if (!_xinButton) {
        _xinButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_xinButton setImage:[UIImage imageNamed:@"新品团未选中"] forState:UIControlStateNormal];
        [_xinButton setImage:[UIImage imageNamed:@"新品团选中"] forState:UIControlStateSelected];
        [_xinButton setImageEdgeInsets:UIEdgeInsetsMake(0, -40, 0, 0)];
        [_xinButton setTitle:@"新品团购" forState:UIControlStateNormal];
        [_xinButton setTitleColor:RGB(67, 182, 241) forState:UIControlStateNormal];
        [_xinButton setTitleColor:RGB(239, 101, 48) forState:UIControlStateSelected];
        _xinButton.selected = YES;
        }
    return _xinButton;
}
- (UIButton *)dfsButton{
    if (!_dfsButton) {
        _dfsButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_dfsButton setImage:[UIImage imageNamed:@"品牌团未选中"] forState:UIControlStateNormal];
        [_dfsButton setImage:[UIImage imageNamed:@"品牌团选中"] forState:UIControlStateSelected];
        [_dfsButton setImageEdgeInsets:UIEdgeInsetsMake(0, -40, 0, 0)];
        [_dfsButton setTitle:@"品牌团购" forState:UIControlStateNormal];
        [_dfsButton setTitleColor:RGB(67, 182, 241) forState:UIControlStateNormal];
        [_dfsButton setTitleColor:RGB(239, 101, 48) forState:UIControlStateSelected];
    }
    return _dfsButton;
}



@end
