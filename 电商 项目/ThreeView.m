//
//  ThreeView.m
//  电商 项目
//
//  Created by ma c on 16/6/29.
//  Copyright © 2016年 ZCJ. All rights reserved.
//

#import "ThreeView.h"


@interface ThreeView ()

/**提示*/
@property (strong,nonatomic) UILabel *label;
/**分割线*/
@property (strong,nonatomic) UILabel *lineLabel;
/**qq*/
@property (strong,nonatomic) UIButton *qqButton;
/**微信*/
@property (strong,nonatomic) UIButton *WeiBotton;
/**新浪*/
@property (strong,nonatomic) UIButton *xinBotton;

@end
@implementation ThreeView
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
    __weak typeof(self)weakSelf = self;
    [_lineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left).offset(15);
        make.right.equalTo(weakSelf.mas_right).offset(-15);
        make.top.equalTo(weakSelf.mas_top).offset(10);
        make.height.equalTo(1);
    }];
    
    [_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.lineLabel.mas_centerY);
        make.size.equalTo(CGSizeMake(85, 16));
        make.centerX.equalTo(weakSelf.lineLabel.mas_centerX);
    }];
    [_WeiBotton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(45, 45));
        make.centerX.equalTo(weakSelf.mas_centerX);
        make.top.equalTo(weakSelf.label.mas_bottom).offset(20);
    }];
    [_qqButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(45, 45));
        make.right.equalTo(weakSelf.WeiBotton.mas_left).offset(-(VIEW_WIDTH-135)/4);
        make.top.equalTo(weakSelf.label.mas_bottom).offset(20);
    }];
    [_xinBotton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(45, 45));
        make.left.equalTo(weakSelf.WeiBotton.mas_right).offset((VIEW_WIDTH-135)/4);
        make.top.equalTo(weakSelf.label.mas_bottom).offset(20);
    }];
}

- (UILabel *)label{
    if (!_label) {
        _label = [[UILabel alloc]init];
        _label.text = @"一键登录";
        _label.textColor = [UIColor grayColor];
        _label.textAlignment = NSTextAlignmentCenter;
        _label.backgroundColor = RGB(245, 245, 245);
    }
    return _label;
}
- (UILabel *)lineLabel{
    if (!_lineLabel) {
        _lineLabel = [[UILabel alloc]init];
        _lineLabel.backgroundColor = [UIColor groupTableViewBackgroundColor];
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
