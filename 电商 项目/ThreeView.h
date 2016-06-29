//
//  ThreeView.h
//  电商 项目
//
//  Created by ma c on 16/6/29.
//  Copyright © 2016年 ZCJ. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^QQLoginMethod)();
@interface ThreeView : UIView

@property (copy, nonatomic) QQLoginMethod QQLoginBlock;


@end
