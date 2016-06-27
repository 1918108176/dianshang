//
//  DJOpenViewController.m
//  电商项目
//
//  Created by ma c on 16/6/16.
//  Copyright © 2016年 ZCJ. All rights reserved.
//

#import "DJOpenViewController.h"
#import "FirstView.h"
#import "view.h"
#import "UMThirdLogin.h"
#import "DJAddViewController.h"
#import <UMSocialQQHandler.h>
@interface DJOpenViewController ()

@property (strong,nonatomic) FirstView *view1;

@property (strong,nonatomic) view *view2;

@end

@implementation DJOpenViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = 0;
    [self.view setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
    [self addLayoutIn];

}
- (void)addLayoutIn{
    WS(weakSelf);
    [_view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.view.mas_top).offset(15);
        make.left.equalTo(weakSelf.view.mas_left);
        make.right.equalTo(weakSelf.view.mas_right);
        make.height.equalTo(180);
    }];
    
    [_view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.view1.mas_bottom).offset(20);
        make.left.equalTo(weakSelf.view.mas_left);
        make.right.equalTo(weakSelf.view.mas_right);
        make.height.equalTo(85);
    }];
}

- (void)pushAddViewController{
    DJAddViewController *addVC = [[DJAddViewController alloc]init];
    [self.navigationController pushViewController:addVC animated:YES];
}

- (void)loginViewMethod:(NSDictionary *)dict{
    __weak typeof(self)weakSelf = self;
    [self getRequestURL:@"appMember/appLogin.do" withDic:dict withSucess:^(NSURLSessionDataTask *task, id project) {
        NSDictionary *dic = project;
        if ([dic[@"ErrorMessage"]isEqualToString:@"登陆成功"]) {
            [[NSUserDefaults standardUserDefaults]setValue:dic forKey:@"ISLOGIN"];
            self.tabBarItem.enabled = [NSString stringWithFormat:@"%@",dic[@"result"]];
            [weakSelf.navigationController popViewControllerAnimated:NO];
        } else {
            [weakSelf showTostView:@"ErrorMessage"];
        }
    } Fail:^(NSURLSessionDataTask *task, NSError *error) {
    }];
}
- (void)qqLoginMethod{
    [UMThirdLogin qqVC:self withMethod:^(NSDictionary *returnDict) {
        NSLog(@"dic: %@",returnDict);
    } error:^{
        NSLog(@"登陆失败");
    }];
    
}
- (FirstView *)view{
    if (!_view1) {
        _view1 = [[FirstView alloc]init];
        __weak typeof(self)weakSelf = self;
        _view1.loginBlock = ^(NSDictionary *dict){
            [weakSelf loginViewMethod:dict];
        };
        _view1.landingBlock = ^(){
            [weakSelf pushAddViewController];
        };
    }
    return _view1;
}
- (view *)view2{
    if (!_view2) {
        _view2 = [[view alloc]init];
        __weak typeof(self)weakSelf = self;
        _view2.QQLoginBlock = ^(){
            [weakSelf pushAddViewController];
        };
        
    }
    return _view2;
}






@end
