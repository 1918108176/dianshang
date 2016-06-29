//
//  UIImageView+DJImage.m
//  电商 项目
//
//  Created by ma c on 16/6/27.
//  Copyright © 2016年 ZCJ. All rights reserved.
//

#import "UIImageView+DJImage.h"
#import <UIImageView+WebCache.h>
@implementation UIImageView (DJImage)
- (UIImage*)getImageForURL:(NSString *)iamgeURL
{
    [self sd_setImageWithURL:[NSURL URLWithString:iamgeURL] placeholderImage:[UIImage imageNamed:@"1"]];
    
    return self.image;
}
@end
