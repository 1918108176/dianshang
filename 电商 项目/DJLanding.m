//
//  DJLanding.m
//  电商 项目
//
//  Created by ma c on 16/6/29.
//  Copyright © 2016年 ZCJ. All rights reserved.
//

#import "DJLanding.h"

@interface DJLanding ()<UITextFieldDelegate>
/**背景*/
@property (strong,nonatomic) UILabel *backLabel;
/**提示*/
@property (strong,nonatomic) UILabel *tostLabel;
/**竖线*/
@property (strong,nonatomic) UILabel *lineLabel;

@end

@implementation DJLanding
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.tostLabel];
        [self addSubview:self.backLabel];
        [self addSubview:self.lineLabel];
        [self addSubview:self.landingButton];
        [self addSubview:self.verificationText];
        [self addSubview:self.timeLabel];
        [self addSubview:self.referButton];
    }
    return self;
}
#pragma mark -
#pragma mark - 约束
- (void)layoutSubviews{
    [super layoutSubviews];
    __weak typeof(self)weakSelf = self;
    [_tostLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.left.top.equalTo(weakSelf);
        make.height.equalTo(35);
    }];
    [_backLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.tostLabel.mas_bottom);
        make.left.equalTo(weakSelf.mas_left).offset(-1);
        make.right.equalTo(weakSelf.mas_right).offset(1);
        make.height.equalTo(43);
    }];
    [_verificationText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.backLabel.mas_top);
        make.left.equalTo(weakSelf.mas_left).offset(15);
        make.bottom.equalTo(weakSelf.backLabel.mas_bottom);
        make.right.equalTo(weakSelf.mas_right).offset(-105);
    }];
    [_lineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.backLabel.mas_top).offset(5);
        make.bottom.equalTo(weakSelf.backLabel.mas_bottom).offset(-5);
        make.width.equalTo(1);
        make.left.equalTo(weakSelf.verificationText.mas_right);
    }];
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.lineLabel.mas_right);
        make.right.equalTo(weakSelf.mas_right);
        make.bottom.equalTo(weakSelf.backLabel.mas_bottom);
        make.top.equalTo(weakSelf.backLabel.mas_top);
    }];
    [_landingButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left).offset(16);
        make.right.equalTo(weakSelf.mas_right).offset(-16);
        make.height.equalTo(35);
        make.top.equalTo(weakSelf.backLabel.mas_bottom).offset(16);
    }];
    [_referButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.landingButton.mas_bottom).offset(22);
        make.centerX.equalTo(weakSelf.mas_centerX);
        make.size.equalTo(CGSizeMake(150, 18));
    }];
}
#pragma mark -
#pragma mark - 懒加载
- (UIButton *)landingButton{
    if (!_landingButton) {
        _landingButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _landingButton.backgroundColor = RGB(234, 234, 234);
        [_landingButton setTitle:@"注 册" forState:UIControlStateNormal];
        [_landingButton setTitleColor:RGB(145, 145, 145) forState:UIControlStateNormal];
        [_landingButton setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        _landingButton.layer.masksToBounds = YES;
        _landingButton.layer.cornerRadius = 5.0;
    }
    return _landingButton;
}
- (UILabel *)tostLabel{
    if (!_tostLabel) {
        _tostLabel = [[UILabel alloc]init];
    }
    return _tostLabel;
}
- (UILabel *)backLabel{
    if (!_backLabel) {
        _backLabel = [[UILabel alloc]init];
        _backLabel.backgroundColor = [UIColor whiteColor];
        _backLabel.layer.borderColor = RGB(217, 217, 217).CGColor;
        _backLabel.layer.borderWidth = 1.0;
    }
    return _backLabel;
}
- (UITextField *)verificationText{
    if (!_verificationText) {
        _verificationText = [[UITextField alloc]init];
        _verificationText.placeholder = @"验证码";
        _verificationText.delegate = self;
        _verificationText.keyboardType = UIKeyboardTypeNumberPad;
    }
    return _verificationText;
}
- (UILabel *)lineLabel{
    if (!_lineLabel) {
        _lineLabel = [[UILabel alloc]init];
        _lineLabel.backgroundColor = RGB(231, 231, 231);
    }
    return _lineLabel;
}
- (UILabel *)timeLabel{
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc]init];
        _timeLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _timeLabel;
}
- (UIButton *)referButton{
    if (!_referButton) {
        _referButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_referButton setTitle:@"请重新发送验证码" forState:UIControlStateNormal];
        [_referButton setTitleColor:RGB(203, 203, 203) forState:UIControlStateNormal];
        [_referButton setTitleColor:RGB(68, 184, 245) forState:UIControlStateSelected];
    }
    return _referButton;
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    if (textField.text.length ==4) {
        _landingButton.selected = YES;
        _landingButton.backgroundColor = RGB(67, 182, 245);
    } else {
        _landingButton.selected = NO;
        _landingButton.backgroundColor = RGB(234, 234, 234);
    }
    return YES;
}


@end
