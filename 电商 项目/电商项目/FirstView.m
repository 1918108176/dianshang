//
//  FirstView.m
//  电商项目
//
//  Created by ma c on 16/6/16.
//  Copyright © 2016年 ZCJ. All rights reserved.
//

#import "FirstView.h"


@interface FirstView ()

@property (strong,nonatomic) UILabel *backLabel;
@property (strong,nonatomic) UITextField *nameText;
@property (strong,nonatomic) UITextField *passText;
@property (strong,nonatomic) UILabel *lineLabel;
@property (strong,nonatomic) UIButton *lodaingButton;
@property (strong,nonatomic) UIButton *loginButton;

@end

@implementation FirstView
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addSubview:self.backLabel];
        [self addSubview:self.nameText];
        [self addSubview:self.passText];
        [self addSubview:self.lineLabel];
        [self addSubview:self.lodaingButton];
        [self addSubview:self.loginButton];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    __weak typeof(self)weakSelf = self;
    [self.backLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_top).offset(100);
        make.left.equalTo(weakSelf.mas_left);
        make.right.equalTo(weakSelf.mas_right);
        make.height.equalTo(88);
    }];
    [self.nameText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.backLabel.mas_top);
        make.left.equalTo(weakSelf.backLabel.mas_left).offset(15);
        make.right.equalTo(weakSelf.backLabel.mas_right).offset(-15);
        make.height.equalTo(44);
    }];
    [self.lineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.nameText.mas_bottom);
        make.left.equalTo(weakSelf.mas_left).offset(15);
        make.right.equalTo(weakSelf.mas_right).offset(-15);
        make.height.equalTo(1);
    }];
    [self.passText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakSelf.backLabel.mas_bottom);
        make.left.equalTo(weakSelf.mas_left).offset(15);
        make.right.equalTo(weakSelf.mas_right).offset(-15);
        make.height.equalTo(44);
    }];
    [self.lodaingButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.backLabel.mas_bottom).offset(15);
        make.left.equalTo(weakSelf.mas_left).offset(16);
        make.right.equalTo(weakSelf.mas_right).offset(-16);
        make.height.equalTo(35);
    }];
    [self.loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(100, 25));
        make.top.equalTo(weakSelf.lodaingButton.mas_bottom).offset(17);
        make.right.equalTo(weakSelf.mas_right).offset(-16);
    }];
    
}

#pragma mark -
#pragma mark - 懒加载
- (UILabel *)backLabel{
    if (!_backLabel) {
        _backLabel = [[UILabel alloc]init];
        _backLabel.backgroundColor = [UIColor groupTableViewBackgroundColor];
    }
    return _backLabel;
}
- (UITextField *)nameText{
    if (!_nameText) {
        _nameText = [[UITextField alloc]init];
        _nameText.placeholder = @"请输入账号";
        _nameText.secureTextEntry = YES;
        _nameText.borderStyle = UITextBorderStyleRoundedRect;
    }
    return _nameText;
}
- (UITextField *)passText{
    if (!_passText) {
        _passText = [[UITextField alloc]init];
        _passText.placeholder = @"请输入密码";
        _passText.secureTextEntry = YES;
        _passText.borderStyle = UITextBorderStyleRoundedRect;
    }
    return _passText;
}
- (UILabel *)lineLabel{
    if (!_lineLabel) {
        _lineLabel = [[UILabel alloc]init];
        _lineLabel.backgroundColor = [UIColor groupTableViewBackgroundColor];
    }
    return _lineLabel;
}
- (UIButton *)lodaingButton{
    if (!_lodaingButton) {
        _lodaingButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_lodaingButton setBackgroundColor:RGB(50.0, 165.0, 241.0)];
        [_lodaingButton setTitle:@"登陆" forState:UIControlStateNormal];
        [_lodaingButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _lodaingButton.layer.cornerRadius = 3;
    }
    return _lodaingButton;
}
- (UIButton *)loginButton{
    if (!_loginButton) {
        _loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_loginButton setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
        [_loginButton setTitle:@"免费注册" forState:UIControlStateNormal];
        [_loginButton setTitleColor:RGB(37.0, 122.0, 170.0) forState:UIControlStateNormal];
        _loginButton.layer.cornerRadius = 3;
    }
    return _loginButton;
}
- (void)loginButtonMethod{
    if (_loginBlock) {
    _loginBlock(@{@"LoginName":_nameText.text,@"Lpassword":_passText.text});
    }
}

- (void)landingButtonMethod{
    if (_landingBlock) {
        _landingBlock();
    }
}

@end
