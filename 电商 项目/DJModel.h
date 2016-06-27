//
//  DJModel.h
//  电商 项目
//
//  Created by ma c on 16/6/24.
//  Copyright © 2016年 ZCJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DJModel : NSObject
/**商品ID*/
@property (copy, nonatomic) NSString *GoodsId;

/**国家图片*/
@property (copy, nonatomic) NSString *CountryImg;

/**缩略图*/
@property (copy, nonatomic) NSString *ImgView;

/**折扣*/
@property (copy, nonatomic) NSString *Discount;

/**商品名称*/
@property (copy, nonatomic) NSString *Title;

/**外币价格*/
@property (copy, nonatomic) NSString *ForeignPrice;

/**原价格*/
@property (copy, nonatomic) NSString *Price;

/**当前价格*/
@property (copy, nonatomic) NSString *DomesticPrice;

/**商品描述*/
@property (copy, nonatomic) NSString *GoodsIntro;

@end
