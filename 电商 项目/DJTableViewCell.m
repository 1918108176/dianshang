//
//  DJTableViewCell.m
//  电商 项目
//
//  Created by ma c on 16/6/21.
//  Copyright © 2016年 ZCJ. All rights reserved.
//

#import "DJTableViewCell.h"

@interface DJTableViewCell ()
/**图标*/
@property (strong, nonatomic) UIImageView *iconImage;
/**标题label*/
@property (strong, nonatomic) UILabel *titleLabel;
/**指示Image*/
@property (strong, nonatomic) UIImageView *nextImage;
/**分割线*/
@property (strong, nonatomic) UILabel *lineLabel;

@end

@implementation DJTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self addSubview:self.iconImage];
        [self addSubview:self.titleLabel];
        [self addSubview:self.nextImage];
        [self addSubview:self.lineLabel];
    }
    return self;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    __weak typeof(self)weakSelf = self;
    [_iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(20, 20));
        make.left.equalTo(weakSelf.mas_left).offset(15);
        make.centerY.equalTo(weakSelf.mas_centerY);
    }];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(150, 15));
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.left.equalTo(weakSelf.iconImage.mas_right).offset(15);
    }];
    
    [_nextImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(13, 20));
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.right.equalTo(weakSelf.mas_right).offset(-12);
    }];
    
    [_lineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.iconImage.mas_right).offset(15);
        make.right.equalTo(weakSelf.mas_right);
        make.height.equalTo(1);
        make.bottom.equalTo(weakSelf.mas_bottom);
    }];
}

- (void)awakeFromNib {
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)setCellSource:(NSDictionary *)cellSource{
    _titleLabel.text = cellSource[@"title"];
    _iconImage.image = [UIImage imageNamed:cellSource[@"image"]];
}
- (UIImageView *)iconImage{
    if (!_iconImage) {
        _iconImage = [[UIImageView alloc]init];
    }
    return _iconImage;
}
- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.font = [UIFont systemFontOfSize:15.0];
        _titleLabel.textColor = [UIColor blackColor];
    }
    return _titleLabel;
}
- (UIImageView *)nextImage{
    if (!_nextImage) {
        _nextImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"下一步"]];
    }
    return _nextImage;
}
- (UILabel *)lineLabel{
    if (!_lineLabel) {
        _lineLabel = [[UILabel alloc]init];
        _lineLabel.backgroundColor = RGB(245, 245, 245);
    }
    return _lineLabel;
}



@end
