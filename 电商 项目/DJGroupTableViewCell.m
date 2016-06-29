//
//  DJGroupTableViewCell.m
//  电商 项目
//
//  Created by ma c on 16/6/24.
//  Copyright © 2016年 ZCJ. All rights reserved.
//

#import "DJGroupTableViewCell.h"
#import "UIImageView+DJImage.h"

@interface DJGroupTableViewCell ()

/**品牌团购用来显示的图片*/
@property (strong, nonatomic)   UIImageView *groupImage;

@end

@implementation DJGroupTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubview:self.groupImage];
        [self setBackgroundColor:[UIColor whiteColor]];
    }
    return self;
}


- (void)layoutSubviews{
    [super layoutSubviews];
    __weak typeof(self)weakSelf = self;
    [_groupImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf).with.insets(UIEdgeInsetsMake(0, 0, 10, 0));
    }];
}


- (void)setGroupBuyModel:(DJSecondModel *)groupBuyModel{
    [_groupImage getImageForURL:groupBuyModel.ImgView];
}

- (UIImageView *)groupImage{
    if (!_groupImage) {
        _groupImage = [[UIImageView alloc]init];
    }
    return _groupImage;
}



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
