//
//  DJAddView.m
//  电商 项目
//
//  Created by ma c on 16/6/29.
//  Copyright © 2016年 ZCJ. All rights reserved.
//

#import "DJAddView.h"

@interface DJAddView ()<UITextFieldDelegate>

/***/
@property (strong,nonatomic) UILabel *tostLabel;
/***/
@property (strong,nonatomic) UILabel *backLabel;
/***/
@property (strong,nonatomic) UILabel *lineLabel;
/***/
@property (strong,nonatomic) UITextField *nameText;
/***/
@property (strong,nonatomic) UITextField *passText;
/***/
@property (strong,nonatomic) UIButton *loginButton;
/***/
@property (strong,nonatomic) UIButton *landingButton;

@end

@implementation DJAddView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.tostLabel];
        [self addSubview:self.backLabel];
        [self addSubview:self.lineLabel];
        [self addSubview:self.nameText];
        [self addSubview:self.passText];
        [self addSubview:self.loginButton];
        [self addSubview:self.landingButton];
    }
    return self;
}
#pragma mark -
#pragma mark - 视图加载
- (void)layoutSubviews{
    [super layoutSubviews];
    __weak typeof(self)weakSelf = self;
    [_tostLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_top).offset(10);
        make.left.equalTo(weakSelf.mas_left).offset(15);
        make.right.equalTo(weakSelf.mas_right);
        make.height.equalTo(14);
        
    }];
    [_backLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.tostLabel.mas_bottom).offset(10);
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
        make.top.equalTo(weakSelf.landingButton.mas_bottom).offset(20);
        make.right.equalTo(weakSelf.mas_right).offset(-15);
        make.size.equalTo(CGSizeMake(80, 22));
    }];
    [_landingButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.backLabel.mas_bottom).offset(15);
        make.left.equalTo(weakSelf.backLabel.mas_left).offset(15);
        make.right.equalTo(weakSelf.backLabel.mas_right).offset(-15);
        make.height.equalTo(35);
    }];
}
#pragma mark -
#pragma mark - 懒加载
- (UILabel *)tostLabel{
    if (!_tostLabel) {
        _tostLabel = [[UILabel alloc]init];
        _tostLabel.text = @"输入手机号码注册新用户";
        _tostLabel.textColor = RGB(78, 78, 78);
        _tostLabel.font = [UIFont systemFontOfSize:14.0];
    }
    return _tostLabel;
}
- (UILabel *)backLabel{
    if (!_backLabel) {
        _backLabel = [[UILabel alloc]init];
        _backLabel.backgroundColor = [UIColor whiteColor];
        _backLabel.layer.borderWidth = 1.0;
        _backLabel.layer.borderColor = RGB(200, 198, 104).CGColor;
    }
    return _backLabel;
}
- (UILabel *)lineLabel{
    if (!_lineLabel) {
        _lineLabel = [[UILabel alloc]init];
        _lineLabel.backgroundColor = RGB(200, 198, 104);
    }
    return _lineLabel;
}
- (UITextField *)nameText{
    if (!_nameText) {
        _nameText = [[UITextField alloc]init];
        _nameText.delegate = self;
        _nameText.placeholder = @"输入手机号";
        _nameText.keyboardType = UIKeyboardTypeNumberPad;
    }
    return _nameText;
}
- (UITextField *)passText{
    if (!_passText) {
        _passText = [[UITextField alloc]init];
        _passText.delegate = self;
        _passText.secureTextEntry = YES;
        _passText.placeholder = @"输入密码";
    }
    return _passText;
}
- (UIButton *)loginButton{
    if (!_loginButton) {
        _loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _loginButton.backgroundColor = [UIColor clearColor];
        [_loginButton setTitle:@"去登陆" forState:UIControlStateNormal];
        [_loginButton setTitleColor:RGB(67, 182, 245) forState:UIControlStateNormal];
        [_loginButton addTarget:self action:@selector(loginButtonMethod) forControlEvents:UIControlEventTouchUpInside];
    }
    return _loginButton;
}
- (UIButton *)landingButton{
    if (!_landingButton) {
        _landingButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _landingButton.backgroundColor = RGB(67, 182, 245);
        _landingButton.layer.masksToBounds = YES;
        _landingButton.layer.cornerRadius = 5.0;
        [_landingButton setTitle:@"下一步" forState:UIControlStateNormal];
        [_landingButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_landingButton addTarget:self action:@selector(landingButtonMethod) forControlEvents:UIControlEventTouchUpInside];
    }
    return _landingButton;
}

- (void)loginButtonMethod{
    if (_login) {
        _login();
    }
}
- (void)landingButtonMethod{
    if (_landing) {
        _landing(@{@"LoginName":_nameText.text,@"Lpassword":_passText.text});
    }
}

@end
