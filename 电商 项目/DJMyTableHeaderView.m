//
//  DJMyTableHeaderView.m
//  电商 项目
//
//  Created by ma c on 16/6/21.
//  Copyright © 2016年 ZCJ. All rights reserved.
//

#import "DJMyTableHeaderView.h"


@interface DJMyTableHeaderView ()

@property (strong,nonatomic) UIImageView *imageView;
@property (strong,nonatomic) UIButton *loginButton;
@property (strong,nonatomic) UIButton *lodaingButton;
@property (strong,nonatomic) UIImageView *iconImageView;
@property (strong,nonatomic) UILabel *userNameLabel;
@property (strong,nonatomic) UILabel *gradeLabel;

@end
@implementation DJMyTableHeaderView

- (void)showLandingAndLoginBtn:(NSDictionary *)dic{
    if (dic.count != 0) {
        _iconImageView.hidden = NO;
        _userNameLabel.hidden = NO;
        _gradeLabel.hidden = NO;
        _loginButton.hidden = YES;
        _lodaingButton.hidden = YES;
        _userNameLabel.text = dic[@"MemberName"];
        _gradeLabel.text = dic[@"MemberLvl"];
    } else {
        _iconImageView.hidden = YES;
        _userNameLabel.hidden = YES;
        _gradeLabel.hidden = YES;
        _loginButton.hidden = NO;
        _lodaingButton.hidden = NO;
        
    }
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.iconImageView];
        [self addSubview:self.imageView];
        [self addSubview:self.lodaingButton];
        [self addSubview:self.loginButton];
        [self addSubview:self.userNameLabel];
        [self addSubview:self.gradeLabel];
        NSDictionary *isLogin = [[NSUserDefaults standardUserDefaults]valueForKey:@"ISLOGIN"];
        [self showLandingAndLoginBtn:isLogin];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    __weak typeof(self)weakSelf = self;
    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf);
    }];
    [_loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakSelf.mas_centerX).offset(-50);
        make.size.equalTo(CGSizeMake(90, 20));
        make.centerY.equalTo(weakSelf.mas_centerY);
    }];
    [_lodaingButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakSelf.mas_centerX).offset(50);
        make.size.equalTo(CGSizeMake(90, 20));
        make.centerY.equalTo(weakSelf.mas_centerY);
    }];
    [_iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.size.equalTo(CGSizeMake(75, 75));
        make.left.equalTo(60);
    }];
    [_userNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.iconImageView.mas_right).offset(40);
        make.top.equalTo(weakSelf.iconImageView.mas_top).offset(10);
        make.right.equalTo(weakSelf.mas_right).offset(-20);
        make.height.equalTo(15);
    }];
    [_gradeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakSelf.iconImageView.mas_bottom).offset(-10);
        make.left.equalTo(weakSelf.iconImageView.mas_right).offset(40);
        make.height.equalTo(15);
        make.right.equalTo(weakSelf.mas_right).offset(-20);
    }];
}




- (UIImageView *)iconImageView{
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"登陆界面微博登录"]];
    }
    return _iconImageView;
}
- (UIImageView *)imageView{
    if (!_imageView) {
        _imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"我的背景"]];
    }
    return _imageView;
}

- (UIButton *)lodaingButton{
    if (!_lodaingButton) {
        _lodaingButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_lodaingButton setTitle:@"注册" forState:UIControlStateNormal];
        [_lodaingButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _lodaingButton.titleLabel.font = [UIFont systemFontOfSize:20.0];
    }
    return _lodaingButton;
}
- (UIButton *)loginButton{
    if (!_loginButton) {
        _loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_loginButton setTitle:@"登录" forState:UIControlStateNormal];
        [_loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _loginButton.titleLabel.font = [UIFont systemFontOfSize:20.0];
    }
    return _loginButton;
}
- (UILabel *)userNameLabel{
    if (!_userNameLabel) {
        _userNameLabel = [[UILabel alloc]init];
        _userNameLabel.textAlignment = NSTextAlignmentLeft;
        _userNameLabel.font = [UIFont systemFontOfSize:16.0];
        _userNameLabel.textColor = [UIColor whiteColor];
    }
    return _userNameLabel;
}
- (UILabel *)gradeLabel{
    if (!_gradeLabel) {
        _gradeLabel = [[UILabel alloc]init];
        _gradeLabel.textAlignment = NSTextAlignmentLeft;
        _gradeLabel.textColor = [UIColor whiteColor];
        _gradeLabel.font = [UIFont systemFontOfSize:16.0];
    }
    return _gradeLabel;
}

@end


