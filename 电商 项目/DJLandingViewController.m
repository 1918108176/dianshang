//
//  DJLandingViewController.m
//  电商 项目
//
//  Created by ma c on 16/6/29.
//  Copyright © 2016年 ZCJ. All rights reserved.
//

#import "DJLandingViewController.h"
#import "DJLanding.h"
#import "GCDCountDownTime.h"

@interface DJLandingViewController ()

/**输入框view*/
@property (strong,nonatomic) DJLanding *landView;

@end

@implementation DJLandingViewController
#pragma mark -
#pragma mark - 懒加载
-(DJLanding *)landView{
    if (!_landView) {
        _landView = [[DJLanding alloc]init];
        [_landView.referButton addTarget:self action:@selector(requestVerification) forControlEvents:UIControlEventTouchUpInside];
        [_landView.landingButton addTarget:self action:@selector(landingMethod) forControlEvents:UIControlEventTouchUpInside];
    }
    return _landView;
}

#pragma mark -
#pragma mark - 视图加载
- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self.view setBackgroundColor:RGB(245, 245, 245)];
    [self.view addSubview:self.landView];
    [self addLayoutIn];
    [self requestVerification];
}

- (void)addLayoutIn{
    __weak typeof(self)weakSelf = self;
    [_landView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.left.top.equalTo(weakSelf.view);
        make.height.equalTo(180);
    }];
}
//发送验证码到手机
- (void)requestVerification{//appMember/createSeekPwdCode.do?Telephone=17721025595
    WS(weakSelf);
    /**
     *http://123.57.141.249:8080/beautalk/appMember/createCode.do
     *请求方式为post，请求参数MemberId：参数内容为注册页面输入的手机号
     */
    [self postRequestURL:@"appMember/createCode.do" withDic:@{@"MemberId":_parameterDic[@"LoginName"]} withSucess:^(NSURLSessionDataTask *task, id project) {
        NSDictionary *dic = project;
        if ([dic[@"result"] isEqual:@"success"]) {
            [weakSelf GCDMethodTime];
        }
    } Fail:^(NSURLSessionDataTask *task, NSError *error) {
    }];
}
//注册用户时调用的网络请求，请求需要四个参数，一个参数是用户名（手机号），一个参数是短信验证码，一个参数为登陆密码，还需要再添加一遍手机号
- (void)landingMethod{
    [self getRequestURL:@"appMember/appRegistration.do" withDic:[self makeLandingParameter] withSucess:^(NSURLSessionDataTask *task, id project) {
        NSDictionary *dic = project;
        if ([dic[@"result"] isEqual:@"success"]) {
            [self showTostView:@"注册成功"];
        }
    } Fail:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
    
}
- (NSDictionary *)makeLandingParameter{
    return @{@"LoginName":_parameterDic[@"LoginName"],@"Lpassword":_parameterDic[@"Lpassword"],@"Code":_landView.verificationText.text,@"Telephone":_parameterDic[@"LoginName"]};
}
- (void)GCDMethodTime{
    __block NSInteger timeout= 60;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if (timeout <=0) {//倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                self.landView.referButton.userInteractionEnabled = YES;
                self.landView.timeLabel.text = @"验证码";
            });
        } else {
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                self.landView.referButton.userInteractionEnabled = NO;
                self.landView.timeLabel.text = [NSString stringWithFormat:@"%li后重试",timeout];
            });
            timeout--;
        }
    });
    dispatch_resume(_timer);
}

@end
