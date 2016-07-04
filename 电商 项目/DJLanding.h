//
//  DJLanding.h
//  电商 项目
//
//  Created by ma c on 16/6/29.
//  Copyright © 2016年 ZCJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DJLanding : UIView

/** 注册按钮 */
@property (strong, nonatomic)   UIButton *landingButton;
/** 重新发送验证码按钮 */
@property (strong, nonatomic)   UIButton *referButton;
/** 计时label */
@property (strong, nonatomic)   UILabel *timeLabel;
/** 验证码输入框 */
@property (strong, nonatomic)   UITextField *verificationText;


@end
