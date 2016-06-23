//
//  FirstView.h
//  电商项目
//
//  Created by ma c on 16/6/16.
//  Copyright © 2016年 ZCJ. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^loginBlock)(NSDictionary *dict);
typedef void(^landingBlock)();

@interface FirstView : UIView

/**登陆block*/
@property (copy, nonatomic) loginBlock loginBlock;
/**去注册block*/
@property (copy, nonatomic) landingBlock landingBlock;

@end
