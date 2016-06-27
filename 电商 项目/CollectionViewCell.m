//
//  CollectionViewCell.m
//  电商 项目
//
//  Created by ma c on 16/6/27.
//  Copyright © 2016年 ZCJ. All rights reserved.
//

#import "CollectionViewCell.h"

@interface CollectionViewCell ()

@property (strong,nonatomic) UIImageView *imageView;

@property (strong,nonatomic) UILabel *label;

@end

@implementation CollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        
        
    }
    return self;
}




- (UIImageView *)imageView{
    if (!_imageView) {
        _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, VIEW_WIDTH, (VIEW_WIDTH-3)/4-20)];
    }
    return _imageView;
}
- (UILabel *)label{
    if (!_label) {
        _label = [[UILabel alloc]initWithFrame:CGRectMake(0, (VIEW_WIDTH-3)/4-20, VIEW_WIDTH, 20)];
        
        
    }
    return _label;
}

@end
