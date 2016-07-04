//
//  DJAddView.h
//  电商 项目
//
//  Created by ma c on 16/6/29.
//  Copyright © 2016年 ZCJ. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^loginBlock)();
typedef void(^landingBlock)(NSDictionary *dic);

@interface DJAddView : UIView

/**登陆Block*/
@property (strong,nonatomic) loginBlock login;
/**注册Block*/
@property (strong,nonatomic) landingBlock landing;

@end
