//
//  DJSingleTableViewCell.m
//  电商 项目
//
//  Created by ma c on 16/6/24.
//  Copyright © 2016年 ZCJ. All rights reserved.
//

#import "DJSingleTableViewCell.h"
#import "UIImageView+SDWebImage.h"
#import "NSMutableAttributedString+Helper.h"
@interface DJSingleTableViewCell ()

/**商品图片*/
@property (strong,nonatomic) UIImageView *goodsImage;
/**国旗*/
@property (strong,nonatomic) UIImageView *countryImage;
/**标题Label*/
@property (strong,nonatomic) UILabel *titleLabel;
/**价格Label*/
@property (strong,nonatomic) UILabel *priceLabel;
/**购物车Button*/
@property (strong,nonatomic) UIButton *buyCarButton;
/**分割线Label*/
@property (strong,nonatomic) UILabel *lineLabel;
/**内容Label*/
@property (strong,nonatomic) UILabel *contentLabel;

@end

@implementation DJSingleTableViewCell
#pragma mark -
#pragma mark - 重写init方法
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubview:self.goodsImage];
        [_goodsImage setBackgroundColor:[UIColor grayColor]];
        [self addSubview:self.countryImage];
        [_countryImage setBackgroundColor:[UIColor blueColor]];
        [self addSubview:self.titleLabel];
        [self addSubview:self.priceLabel];
        [self addSubview:self.buyCarButton];
        [self addSubview:self.lineLabel];
        [self addSubview:self.contentLabel];
    }
    return self;
}
#pragma mark -
#pragma mark - 数据
- (void)setSingleModel:(DJModel *)singleModel{
    _singleModel = singleModel;
    [_goodsImage downloadImage:singleModel.ImgView place:[UIImage imageNamed:@"桌面"]];
    [_countryImage downloadImage:singleModel.CountryImg place:[UIImage imageNamed:@"桌面"]];
    _titleLabel.text = singleModel.Title;
    _contentLabel.text = singleModel.GoodsIntro;
    _priceLabel.attributedText = [NSMutableAttributedString makeStrikethroughAttributedString:singleModel.DomesticPrice :singleModel.Price rebateString:nil];
}
#pragma mark -
#pragma mark - 约束
- (void)layoutSubviews{
    [super layoutSubviews];
    __weak typeof(self)weakSelf = self;
    [_goodsImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(142, 142));
        make.left.equalTo(weakSelf.mas_left).offset(20);
        make.top.equalTo(weakSelf.mas_top).offset(12);
    }];
    [_countryImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.goodsImage.mas_top).offset(12);
        make.right.equalTo(weakSelf.goodsImage.mas_left);
        make.size.equalTo(CGSizeMake(25, 20));
    }];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.goodsImage.mas_right).offset(10);
        make.top.equalTo(weakSelf.mas_top).offset(25);
        make.right.equalTo(weakSelf.mas_right).offset(-17);
        make.height.equalTo(15);
    }];
    [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.titleLabel.mas_bottom);
        make.height.equalTo(60);
        make.right.equalTo(weakSelf.mas_right).offset(-17);
        make.left.equalTo(weakSelf.goodsImage.mas_right).offset(10);
    }];
    
    [_priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(17);
        make.left.equalTo(weakSelf.goodsImage.mas_right).offset(10);
        make.bottom.equalTo(weakSelf.mas_bottom).offset(-27);
        make.right.equalTo(weakSelf.mas_right).offset(-17);//
    }];
    
    [_buyCarButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.mas_right).offset(-45);
        make.bottom.equalTo(weakSelf.mas_bottom).offset(-20);
        make.size.equalTo(CGSizeMake(35, 35));
    }];
    
    [_lineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_top).offset(1);
        make.left.equalTo(weakSelf.mas_left);
        make.right.equalTo(weakSelf.mas_right);
        make.height.equalTo(1);
    }];
    
}

#pragma mark -
#pragma mark - 懒加载
- (UIImageView *)goodsImage{
    if (!_goodsImage) {
        _goodsImage = [[UIImageView alloc]init];
        _goodsImage.backgroundColor = [UIColor clearColor];
    }
    return _goodsImage;
}
- (UIImageView *)countryImage{
    if (!_countryImage) {
        _countryImage = [[UIImageView alloc]init];
    }
    return _countryImage;
}
- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.numberOfLines = 4;
        _titleLabel.font = [UIFont systemFontOfSize:15.0];
    }
    return _titleLabel;
}
- (UILabel *)priceLabel{
    if (!_priceLabel) {
        _priceLabel = [[UILabel alloc]init];
    }
    return _priceLabel;
}
- (UIButton *)buyCarButton{
    if (!_buyCarButton) {
        _buyCarButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_buyCarButton setImage:[UIImage imageNamed:@"限时特卖界面购物车图标"] forState:(UIControlStateNormal)];
    }
    return _buyCarButton;
}
- (UILabel *)lineLabel{
    if (!_lineLabel) {
        _lineLabel = [[UILabel alloc]init];
        _lineLabel.backgroundColor = RGB(245, 245, 245);
    }
    return _lineLabel;
}
- (UILabel *)contentLabel{
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc]init];
        _contentLabel.numberOfLines = 0;
        _contentLabel.font = [UIFont systemFontOfSize:15.0];
        _contentLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _contentLabel;
}

#pragma mark -
#pragma mark - 暂时无用

- (void)awakeFromNib {
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
