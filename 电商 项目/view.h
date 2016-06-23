//
//  view.h
//  电商 项目
//
//  Created by ma c on 16/6/22.
//  Copyright © 2016年 ZCJ. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^QQLoginMethod)();
@interface view : UIView

@property (copy, nonatomic) QQLoginMethod QQLoginBlock;

@end
