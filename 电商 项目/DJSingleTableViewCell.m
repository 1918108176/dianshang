//
//  DJSingleTableViewCell.m
//  电商 项目
//
//  Created by ma c on 16/6/24.
//  Copyright © 2016年 ZCJ. All rights reserved.
//

#import "DJSingleTableViewCell.h"
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
    
    
    
    
}
#pragma mark -
#pragma mark - 约束


#pragma mark -
#pragma mark - 懒加载
- (UIImageView *)goodsImage{
    if (!_goodsImage) {
        _goodsImage = [[UIImageView alloc]init];
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
