//
//  view.m
//  电商 项目
//
//  Created by ma c on 16/6/22.
//  Copyright © 2016年 ZCJ. All rights reserved.
//

#import "view.h"

@interface view ()

@property (strong,nonatomic) UILabel *label;
@property (strong,nonatomic) UILabel *lineLabel;
@property (strong,nonatomic) UIButton *qqButton;
@property (strong,nonatomic) UIButton *WeiBotton;
@property (strong,nonatomic) UIButton *xinBotton;

@end
@implementation view

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.lineLabel];
        [self addSubview:self.label];
        [self addSubview:self.qqButton];
        [self addSubview:self.WeiBotton];
        [self addSubview:self.xinBotton];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    __weak typeof(self)ws = self;
    [_lineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.mas_left).offset(15);
        make.right.equalTo(ws.mas_right).offset(-15);
        make.top.equalTo(ws.mas_top).offset(8);
        make.height.equalTo(1);
    }];
    
    [_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws);
        make.left.equalTo(ws.mas_left).offset(100);
        make.right.equalTo(ws.mas_right).offset(-100);
        make.height.equalTo(16);
    }];
    [_qqButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.mas_top).offset(25);
        make.left.equalTo(ws.mas_left).offset(60);
        make.right.equalTo(ws.mas_left).offset(105);
        make.height.equalTo(45);
    }];
    [_WeiBotton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.mas_top).offset(25);
        make.height.equalTo(45);
        make.left.equalTo(ws.qqButton.mas_right).offset(60);
        make.right.equalTo(ws.qqButton.mas_right).offset(105);
    }];
    [_xinBotton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.mas_top).offset(25);
        make.height.equalTo(45);
        make.right.equalTo(ws.mas_right).offset(-60);
        make.left.equalTo(ws.WeiBotton.mas_right).offset(60);
        
    }];
}

- (UILabel *)label{
    if (!_label) {
        _label = [[UILabel alloc]init];
        _label.text = @"一键登录";
        _label.textColor = [UIColor grayColor];
        _label.textAlignment = NSTextAlignmentCenter;
    }
    return _label;
}
- (UILabel *)lineLabel{
    if (!_lineLabel) {
        _lineLabel = [[UILabel alloc]init];
        _lineLabel.backgroundColor = [UIColor grayColor];
    }
    return _lineLabel;
}
- (UIButton *)qqButton{
    if (!_qqButton) {
        _qqButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_qqButton setBackgroundImage:[UIImage imageNamed:@"登录界面qq登陆"] forState:UIControlStateNormal];
        [_qqButton addTarget:self action:@selector(qqButtonLoginMethod) forControlEvents:UIControlEventTouchUpInside];
        [_qqButton addTarget:self action:@selector(qqButtonLoginMethod) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _qqButton;
}
- (UIButton *)WeiBotton{
    if (!_WeiBotton) {
        _WeiBotton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_WeiBotton setBackgroundImage:[UIImage imageNamed:@"登录界面微信登录"] forState:UIControlStateNormal];
        
    }
    return _WeiBotton;
}
- (UIButton *)xinBotton{
    if (!_xinBotton) {
        _xinBotton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_xinBotton setBackgroundImage:[UIImage imageNamed:@"登陆界面微博登录"] forState:UIControlStateNormal];
        
    }
    return _xinBotton;
}
- (void)qqButtonLoginMethod{
    if (_QQLoginBlock) {
        _QQLoginBlock();
    }
}

@end
