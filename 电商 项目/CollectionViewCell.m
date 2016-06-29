//
//  CollectionViewCell.m
//  电商 项目
//
//  Created by ma c on 16/6/27.
//  Copyright © 2016年 ZCJ. All rights reserved.
//

#import "CollectionViewCell.h"
#import "UIImageView+DJImage.h"

@interface CollectionViewCell ()

@property (strong,nonatomic) UIImageView *imageView;

@property (strong,nonatomic) UILabel *label;

@end

@implementation CollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.imageView];
        [self addSubview:self.label];
        
    }
    return self;
}

- (void)setModel:(ClassModel *)model{
    _model = model;
    _label.text = model.goodsTypeName;
    [_imageView getImageForURL:model.imgView];
}
- (void)layoutSubviews{
    [super layoutSubviews];
    __weak typeof(self)weakSelf = self;
    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf).with.insets(UIEdgeInsetsMake(10, 20, 30, 20));
    }];
    [_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.imageView.mas_bottom);
        make.bottom.left.right.equalTo(weakSelf);
    }];
}

- (UIImageView *)imageView{
    if (!_imageView) {
        _imageView = [[UIImageView alloc]init];
        
    }
    return _imageView;
}
- (UILabel *)label{
    if (!_label) {
        _label = [[UILabel alloc]init];
        _label.textAlignment = NSTextAlignmentCenter;
        _label.font = [UIFont systemFontOfSize:12.0];
    }
    return _label;
}

@end
