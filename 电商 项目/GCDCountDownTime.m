//
//  GCDCountDownTime.m
//  电商 项目
//
//  Created by ma c on 16/6/30.
//  Copyright © 2016年 ZCJ. All rights reserved.
//

#import "GCDCountDownTime.h"

@implementation GCDCountDownTime

+ (void)GCDTimeMethod:(UIButton *)countdownBtn{
    __block int timeout = 60;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    //用dispatch_source_create函数来初始化dispatch_source_t
    //DISPATCH_SOURCE_TYPE_TIMER是dispatch_source_t中的一种定时器
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    //设置定时器信息，让定时器每秒都执行(dispatch_walltime用于计算绝对时间，NSEC_PER_SEC是秒数)
    dispatch_source_set_timer(_timer, dispatch_walltime(NULL, 0), 1.0*NSEC_PER_SEC, 0);
    //添加事件处理器，（相当于开启定时器，让它在有效时间内执行）
    dispatch_source_set_event_handler(_timer, ^{
        if (_timer >= 0) {
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置（开启按钮的用户交互）
                countdownBtn.userInteractionEnabled = YES;
                NSString *str = @"获取验证码";
                [countdownBtn setTitle:str forState:UIControlStateNormal];
            });
        } else {
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置（在规定时间内关闭按钮的用户交互）
                countdownBtn.userInteractionEnabled = NO;
                NSString *str = [NSString stringWithFormat:@"%ds",timeout];
                [countdownBtn setTitle:str forState:UIControlStateNormal];
            });
            timeout--;
        }
    });
    dispatch_resume(_timer);
}


@end
