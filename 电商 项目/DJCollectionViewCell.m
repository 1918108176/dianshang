//
//  DJCollectionViewCell.m
//  电商 项目
//
//  Created by ma c on 16/6/27.
//  Copyright © 2016年 ZCJ. All rights reserved.
//

#import "DJCollectionViewCell.h"
#import "UIImageView+DJImage.h"
@interface DJCollectionViewCell ()

@property (strong,nonatomic) UIImageView *imageView;

@end

@implementation DJCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.imageView];
        [self setBackgroundColor:[UIColor whiteColor]];
    }
    return self;
}
- (void)setModel:(ClassModel *)model{
    _model = model;
    [_imageView getImageForURL:model.imgView];
}
- (void)layoutSubviews{
    [super layoutSubviews];
    __weak typeof(self)weakSelf = self;
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf).with.insets(UIEdgeInsetsMake(5, 5, 5, 5));
    }];
}
- (UIImageView *)imageView{
    if (!_imageView) {
        _imageView = [[UIImageView alloc]init];
    }
    return _imageView;
}


@end
