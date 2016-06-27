//
//  DJSecondModel.h
//  电商 项目
//
//  Created by ma c on 16/6/24.
//  Copyright © 2016年 ZCJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DJSecondModel : NSObject

/**活动ID*/
@property (copy, nonatomic) NSString *ActivityId;

/**图片地址*/
@property (copy, nonatomic) NSString *ImgView;

/**品牌名称*/
@property (copy, nonatomic) NSString *ShopTitle;

/**品牌简介*/
@property (copy, nonatomic) NSString *Content;

@end
