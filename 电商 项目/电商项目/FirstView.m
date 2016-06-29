//
//  FirstView.m
//  电商项目
//
//  Created by ma c on 16/6/16.
//  Copyright © 2016年 ZCJ. All rights reserved.
//

#import "FirstView.h"


@interface FirstView ()

/**背景label*/
@property (strong,nonatomic) UILabel *backLabel;
/**手机号TextField*/
@property (strong,nonatomic) UITextField *nameText;
/**密码TextField*/
@property (strong,nonatomic) UITextField *passText;
/**分割线*/
@property (strong,nonatomic) UILabel *lineLabel;
/**注册*/
@property (strong,nonatomic) UIButton *lodaingButton;
/**登陆*/
@property (strong,nonatomic) UIButton *loginButton;

@end

@implementation FirstView
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addSubview:self.backLabel];
        [self addSubview:self.lineLabel];
        [self addSubview:self.nameText];
        [self addSubview:self.passText];
        [self addSubview:self.loginButton];
        [self addSubview:self.lodaingButton];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    WS(weakSelf);
    [_backLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_top);
        make.left.equalTo(weakSelf.mas_left).offset(-1);
        make.right.equalTo(weakSelf.mas_right).offset(1);
        make.height.equalTo(88);
    }];
    
    [_lineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.backLabel.mas_left).offset(15);
        make.right.equalTo(weakSelf.backLabel.mas_right).offset(-15);
        make.height.equalTo(1);
        make.centerY.equalTo(weakSelf.backLabel.mas_centerY);
    }];
    
    [_nameText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.backLabel.mas_top);
        make.left.equalTo(weakSelf.backLabel.mas_left).offset(15);
        make.right.equalTo(weakSelf.backLabel.mas_right).offset(-15);
        make.bottom.equalTo(weakSelf.lineLabel.mas_top);
    }];
    
    [_passText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.lineLabel.mas_bottom);
        make.left.equalTo(weakSelf.backLabel.mas_left).offset(15);
        make.right.equalTo(weakSelf.backLabel.mas_right).offset(-15);
        make.bottom.equalTo(weakSelf.backLabel.mas_bottom);
    }];
    
    [_loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.backLabel.mas_bottom).offset(15);
        make.left.equalTo(weakSelf.backLabel.mas_left).offset(15);
        make.right.equalTo(weakSelf.backLabel.mas_right).offset(-15);
        make.height.equalTo(35);
    }];
    
    [_lodaingButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.loginButton.mas_bottom).offset(20);
        make.right.equalTo(weakSelf.mas_right).offset(-15);
        make.size.equalTo(CGSizeMake(80, 22));
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

- (UIButton *)loginButton{
    if (!_loginButton) {
        _loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_loginButton setBackgroundColor:RGB(50.0, 165.0, 241.0)];
        [_loginButton setTitle:@"登陆" forState:UIControlStateNormal];
        [_loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _loginButton.layer.cornerRadius = 3;
        [_loginButton addTarget:self action:@selector(loginButtonMethod) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _loginButton;
}
- (UIButton *)lodaingButton{
    if (!_lodaingButton) {
        _lodaingButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_lodaingButton setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
        [_lodaingButton setTitle:@"免费注册" forState:UIControlStateNormal];
        [_lodaingButton setTitleColor:RGB(37.0, 122.0, 170.0) forState:UIControlStateNormal];
        _lodaingButton.layer.cornerRadius = 3;
        [_lodaingButton addTarget:self action:@selector(landingButtonMethod) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _lodaingButton;
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
