//
//  DJBuyCarTableViewCell.m
//  电商 项目
//
//  Created by ma c on 16/6/30.
//  Copyright © 2016年 ZCJ. All rights reserved.
//

#import "DJBuyCarTableViewCell.h"
#import "UIImageView+SDWebImage.h"

@interface DJBuyCarTableViewCell ()

/**图片*/
@property (strong,nonatomic) UIImageView *iconImage;
/**标题*/
@property (strong,nonatomic) UILabel *titleLabel;
/**价格*/
@property (strong,nonatomic) UILabel *priceLabel;
/**背景图片*/
@property (strong,nonatomic) UIImageView *backImage;
/**分割线*/
@property (strong,nonatomic) UILabel *lineLabel;


@end

@implementation DJBuyCarTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.selectButton];
        [self.contentView addSubview:self.iconImage];
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.priceLabel];
        [self.contentView addSubview:self.backImage];
        [self.contentView addSubview:self.countLabel];
        [self.contentView addSubview:self.addButton];
        [self.contentView addSubview:self.cutButton];
        [self.contentView addSubview:self.lineLabel];
    }
    return self;
}

#pragma mark -
#pragma mark - 视图加载
- (void)layoutSubviews{
    __weak typeof(self)weakSelf = self;
    [_selectButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(22, 22));
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.left.equalTo(weakSelf.mas_left).offset(13);
    }];
    [_iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
        
        
        
    }];
    
    
    
}
#pragma mark -
#pragma mark - 懒加载
- (void)setBuyCarModel:(DJBuyCarModel *)buyCarModel{
    _buyCarModel = buyCarModel;
    [_iconImage downloadImage:buyCarModel.ImgView place:[UIImage imageNamed:@"购物车界面静态购物车图标"]];
    _priceLabel.text = [NSString stringWithFormat:@"%.2lf",buyCarModel.Price];
    _countLabel.text = [NSString stringWithFormat:@"%li",buyCarModel.GoodsCount];
    _selectButton.selected = buyCarModel.isSelectButton;
}
- (UIButton *)selectButton{
    if (!_selectButton) {
        _selectButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_selectButton setImage:[UIImage imageNamed:@"购物车界面商品未选中"] forState:UIControlStateNormal];
        [_selectButton setImage:[UIImage imageNamed:@"购物车界面商品选中对号按钮"] forState:UIControlStateSelected];
        _selectButton.selected = YES;
    }
    return _selectButton;
}
- (UIImageView *)iconImage{
    if (!_iconImage) {
        _iconImage = [[UIImageView alloc]init];
    }
    return _iconImage;
}
- (UILabel *)titleLabel{
    if (_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.font = [UIFont systemFontOfSize:14.0];
        _titleLabel.numberOfLines = 1;
        _titleLabel.textColor = [UIColor blackColor];
    }
    return _titleLabel;
}
- (UILabel *)priceLabel{
    if (_priceLabel) {
        _priceLabel = [[UILabel alloc]init];
        _priceLabel.font = [UIFont systemFontOfSize:14.0];
        _priceLabel.numberOfLines = 1;
        _priceLabel.textColor = [UIColor blackColor];
    }
    return _priceLabel;
}
- (UILabel *)countLabel{
    if (!_countLabel) {
        _countLabel = [[UILabel alloc]init];
        _countLabel.font = [UIFont systemFontOfSize:14.0];
        _countLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _countLabel;
}
- (UIButton *)addButton{
    if (!_addButton) {
        _addButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _addButton.backgroundColor = [UIColor clearColor];
    }
    return _addButton;
}
- (UIButton *)cutButton{
    if (!_cutButton) {
        _cutButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _cutButton.backgroundColor = [UIColor clearColor];
    }
    return _cutButton;
}
- (UIImageView *)backImage{
    if (!_backImage) {
        _backImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"购物车界面商品加减按钮"]];
    }
    return _backImage;
}
- (UILabel *)lineLabel{
    if (!_lineLabel) {
        _lineLabel = [[UILabel alloc]init];
        _lineLabel.backgroundColor = RGB(245, 245, 245);
    }
    return _lineLabel;
}
#pragma mark -
#pragma mark - nib
- (void)awakeFromNib {
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
